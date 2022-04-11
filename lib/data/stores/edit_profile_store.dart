import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';
import 'package:happy_place/api_utils/http_exception.dart';
import 'package:happy_place/data/stores/profile_store.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/injection.dart';
import 'package:happy_place/models/happy_place.dart';
import 'package:happy_place/ui/add_new_happy_place/add_new_happy_place.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';
part 'edit_profile_store.g.dart';

@injectable
class EditProfileStore = _EditProfileStore with _$EditProfileStore;

abstract class _EditProfileStore with Store {
  final ApiProvider apiProvider;
  _EditProfileStore({
    required this.apiProvider,
  }) {
    getAgeGroups();
  }

  String? errorMessage;

  @observable
  String? profileImagePath;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @observable
  String gender = 'Male';

  @observable
  bool loadingPlaces = false;

  @observable
  bool showPlacesLayout = false;

  @observable
  List<HappyPlace> placesAutoCompleteList = [];

  @observable
  HappyPlace? finalPlaceSelected;

  @observable
  bool isLoading = false;

  @observable
  int error = 1;

  @observable
  User? user;

  @observable
  List<AgeGroup> ageGroups = [];

  @observable
  String? ageGroupId;

  @observable
  AgeGroup? selectedAgeGroup;

  @observable
  bool profileUpdated = false;

  @action
  pickProfileImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (image?.path != '') {
      profileImagePath = image?.path;
      updatePicture();
    }
  }

  @action
  updateCurrentUserInfo(User u) {
    user = u;
    if (u.firstName != null) {
      firstNameController.text = u.firstName!;
    }
    if (u.lastName != null) {
      lastNameController.text = u.lastName!;
    }
    if (u.username != null) {
      usernameController.text = u.username!;
    }
    if (u.address != null) {
      if (u.address!.toLowerCase() != 'address' &&
          u.longitude != 'longitude' &&
          u.latitude != 'latitude') {
        locationController.text = u.address!;

        finalPlaceSelected = HappyPlace(
          description: u.address!,
          latitude: double.parse(u.latitude!),
          longitude: double.parse(u.longitude!),
        );
      }
    }
    if (u.description != null) {
      bioController.text = u.description!;
    }
    if (u.email != null) {
      emailController.text = u.email!;
    }
    if (u.genderId != null) {
      if (u.genderId == '1') {
        gender = 'Male';
      }
      if (u.genderId == '2') {
        gender = 'Female';
      }
      if (u.genderId == '3') {
        gender = 'Other';
      }
    }
    if (u.ageGroup != null) {
      ageGroupId = u.ageGroup;
    }
  }

  @action
  getAgeGroups() async {
    try {
      isLoading = true;
      Response<UsersAgeGroupsResponse> response =
          await apiProvider.apiClient.usersAgeGroupsGet();
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        ageGroups = ApiSuccessParser.payloadOrThrow(response);

        for (var a in ageGroups) {
          if (a.id == ageGroupId) {
            selectedAgeGroup = a;
          }
        }
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }

  @action
  searchAddressWithAutoComplete(String value) async {
    placesAutoCompleteList.clear();
    showPlacesLayout = true;
    loadingPlaces = true;
    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: kGoogleApiKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );
    PlacesAutocompleteResponse placesAutoCompleteResponse =
        await _places.autocomplete(value);

    if (placesAutoCompleteResponse.status == 'OK') {
      if (placesAutoCompleteResponse.predictions.isNotEmpty) {
        await Future.forEach(placesAutoCompleteResponse.predictions,
            (Prediction prediction) async {
          if (prediction.description != null) {
            double? latitude, longitude;
            PlacesDetailsResponse placeDetails =
                await _places.getDetailsByPlaceId(prediction.placeId!);
            latitude = placeDetails.result.geometry?.location.lat;
            longitude = placeDetails.result.geometry?.location.lng;
            placesAutoCompleteList.add(
              HappyPlace(
                  description: prediction.description!,
                  latitude: latitude!,
                  longitude: longitude!),
            );
          }
        });
        placesAutoCompleteList = placesAutoCompleteList;
        loadingPlaces = false;
      }
    }
  }

  @action
  updateProfile() async {
    try {
      Response<ProfileUpdateMyProfileResponse> response =
          await apiProvider.apiClient.profilePut(
        address: finalPlaceSelected!.description,
        ageGroup: selectedAgeGroup?.id.toString(),
        email: emailController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        genderId: gender.toLowerCase() == 'male'
            ? 1
            : gender.toLowerCase() == 'female'
                ? 2
                : 3,
        latitude: finalPlaceSelected!.latitude.toString(),
        longitude: finalPlaceSelected!.longitude.toString(),
        username: usernameController.text,
        description: bioController.text,
      );
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        HttpExceptionNotifyUser.showMessage(response.body!.message!);
        getIt<ProfileStore>().initProfileOnly();
        profileUpdated = true;
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> updatePicture() async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse(apiProvider.apiClient.client.baseUrl + '/avatar'));
      request.files
          .add(await http.MultipartFile.fromPath('image', profileImagePath!));
      request.headers['x-access-token'] =
          apiProvider.userProvider.user!.accessToken!;
      request.headers['x-api-key'] = apiProvider.apiSettings.apiKey;
      var response =
          await apiProvider.apiClient.client.httpClient.send(request);
      if (response.statusCode == 200) {
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
}
