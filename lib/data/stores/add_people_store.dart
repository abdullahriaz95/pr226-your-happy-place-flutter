import 'package:chopper/chopper.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';
import 'package:happy_place/api_utils/http_exception.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'add_people_store.g.dart';

@injectable
class AddPeopleStore = _AddPeopleStore with _$AddPeopleStore;

abstract class _AddPeopleStore with Store {
  final ApiProvider apiProvider;
  _AddPeopleStore({
    required this.apiProvider,
  });

  String? errorMessage;

  @observable
  bool isLoading = false;

  @observable
  int error = 1;

  @observable
  List<User> users = [];

  @observable
  bool searchingPeople = false;

  @action
  searchPeople(String query) async {
    try {
      searchingPeople = true;
      var response = await apiProvider.apiClient.usersGet(q: query);
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        users = ApiSuccessParser.payloadOrThrow(response);
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
      searchingPeople = false;
    } catch (e) {
      searchingPeople = false;
      rethrow;
    }
  }

  @action
  sendFriendOrFamilyRequest(
      {bool addAsFriend = true, required int userId}) async {
    try {
      Response<FriendAddFriendOrFamilyResponse> response =
          await apiProvider.apiClient.friendFamilyPost(
              friendId: userId, relationType: addAsFriend ? 1 : 2);
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        HttpExceptionNotifyUser.showMessage('Request Sent');
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      rethrow;
    }
  }
}
