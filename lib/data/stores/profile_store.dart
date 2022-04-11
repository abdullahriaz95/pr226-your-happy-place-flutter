import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';
import 'package:happy_place/api_utils/http_exception.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/models/user_with_wrapper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'profile_store.g.dart';

@singleton
class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  final ApiProvider apiProvider;
  _ProfileStore({
    required this.apiProvider,
  });

  @action
  init() async {
    isLoading = true;
    await getProfile();
    await getMyFamily();
    await getMyFriends();
    await getFriendsAndFamilyRequests();
    deletionMode = false;
    isLoading = false;
  }

  @action
  initProfileOnly() async {
    isLoading = true;
    await getProfile(
      calledFromDashboard: true,
    );
    isLoading = false;
  }

  String? errorMessage;
  String? coverImagePath;

  @observable
  bool isProfileUpdated = false;

  @observable
  bool deletionMode = false;

  @observable
  bool checkAll = false;

  @observable
  bool isLoading = false;

  @observable
  int error = 1;

  @observable
  String peopleCategory = 'Friends';

  @observable
  User? user;

  @observable
  List<UserWithWrapper> friends = [];

  @observable
  List<UserWithWrapper> family = [];

  @observable
  List<User> listFriendRequests = [];

  @action
  checkAllItems(bool val) {
    checkAll = val;
    if (peopleCategory == 'Friends') {
      for (var i in friends) {
        i.checked = val;
      }
      friends = friends;
    } else {
      for (var i in family) {
        i.checked = val;
      }
      family = family;
    }
  }

  @action
  getFriendsAndFamilyRequests() async {
    try {
      listFriendRequests.clear();
      Response<ProfileMyFamilyRequestsResponse> response =
          await apiProvider.apiClient.familyRequestsGet();
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        listFriendRequests = ApiSuccessParser.payloadOrThrow(response);
        Response<ProfileMyFriendRequestsResponse> response1 =
            await apiProvider.apiClient.friendRequestsGet();
        if (ApiSuccessParser.isSuccessfulWithPayload(response1)) {
          listFriendRequests.addAll(ApiSuccessParser.payloadOrThrow(response1));
        }
        listFriendRequests = listFriendRequests;
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  updatePeopleCategory(String value) {
    peopleCategory = value;
  }

  @action
  getProfile({bool calledFromDashboard = false}) async {
    try {
      Response<ProfileMyProfileResponse> response =
          await apiProvider.apiClient.profileGet();
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        user = ApiSuccessParser.payloadOrThrow(response);

        if (user?.firstName != null && user?.firstName != '') {
          isProfileUpdated = true;
        }
      } else {
        if (!calledFromDashboard) {
          ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  getMyFriends() async {
    try {
      friends.clear();
      Response<ProfileMyFriendsResponse> response =
          await apiProvider.apiClient.friendsGet();
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        List<User> users = ApiSuccessParser.payloadOrThrow(response);
        for (var u in users) {
          friends.add(UserWithWrapper(user: u, checked: false));
        }
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  getMyFamily() async {
    try {
      family.clear();
      Response<ProfileMyFamilyResponse> response =
          await apiProvider.apiClient.familyGet();
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        List<User> users = ApiSuccessParser.payloadOrThrow(response);
        for (var u in users) {
          family.add(UserWithWrapper(user: u, checked: false));
        }
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  deleteFriendsAndFamily() async {
    try {
      List<String> listOfIds = [];
      if (peopleCategory == 'Friends') {
        for (var i in friends) {
          if (i.checked) {
            listOfIds.add(i.user.id!);
          }
        }
      } else {
        for (var i in family) {
          if (i.checked) {
            listOfIds.add(i.user.id!);
          }
        }
      }

      if (listOfIds.isNotEmpty) {
        String commaSeperatedListOfIds = listOfIds.join(', ');
        Response<SuccessResponse> response = await apiProvider.apiClient
            .friendFamilyDelete(friendIds: commaSeperatedListOfIds);
        if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
          init();
        } else {
          ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  pickCoverImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (image?.path != '') {
      coverImagePath = image?.path;
      updatePicture();
    }
  }

  @action
  Future<void> updatePicture() async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse(apiProvider.apiClient.client.baseUrl + '/cover'));
      request.files
          .add(await http.MultipartFile.fromPath('image', coverImagePath!));
      request.headers['x-access-token'] =
          apiProvider.userProvider.user!.accessToken!;
      request.headers['x-api-key'] = apiProvider.apiSettings.apiKey;
      var response =
          await apiProvider.apiClient.client.httpClient.send(request);
      if (response.statusCode == 200) {
        await HttpExceptionNotifyUser.showMessage('Cover Image Updated');
        init();
      } else {
        final body = await response.stream.bytesToString();
        final Map<String, dynamic> bodyJson = json.decode(body);
        final message = bodyJson['message'] ?? '';
        await HttpExceptionNotifyUser.showError(message);
        throw HttpException(response.statusCode, message);
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  reset() {
    isProfileUpdated = false;
  }
}
