import 'package:chopper/chopper.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';

import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/models/happy_place.dart';
import 'package:happy_place/ui/add_new_happy_place/add_new_happy_place.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';

part 'add_new_happy_place_store.g.dart';

@injectable
class AddNewHappyPlaceStore = _AddNewHappyPlaceStore
    with _$AddNewHappyPlaceStore;

abstract class _AddNewHappyPlaceStore with Store {
  final ApiProvider apiProvider;
  _AddNewHappyPlaceStore({
    required this.apiProvider,
  }) {
    getMoods();
    getPlaces();
    getActivities();
    getFeelings();
  }

  String? errorMessage;
  @observable
  bool isLoading = false;
  String finalNoteFeeling = '';
  int? finalFeelingRating;

  @observable
  int error = 1;

  @observable
  int totalPages = 4;

  @observable
  int currentPage = 0;

  @observable
  List<Mood>? moods;

  @observable
  Mood? finalMoodSelected;

  @observable
  MoodType? finalMoodTypeSelected;

  @observable
  List<Place>? places;

  @observable
  Place? finalPlaceSelected;

  @observable
  PlaceType? finalPlaceTypeSelected;

  @observable
  List<Activity>? activities;

  @observable
  Activity? finalActivitySelected;

  @observable
  ActivityType? finalActivityTypeSelected;

  @observable
  List<Feeling>? feelings;

  @observable
  Feeling? finalFeelingSelected;

  @observable
  String? finalFeelingTypeSelected;

  @observable
  List<HappyPlace> placesAutoCompleteList = [];

  @observable
  bool loadingPlaces = false;

  @observable
  HappyPlace? finalLocationSelected;

  @observable
  bool savingPlace = false;

  @action
  getMoods() async {
    try {
      Response<MoodsListResponse> response =
          await apiProvider.apiClient.moodsGet();
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        moods = ApiSuccessParser.payloadOrThrow(response);
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  getPlaces() async {
    try {
      Response<PlacesListResponse> response =
          await apiProvider.apiClient.placesGet();
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        places = ApiSuccessParser.payloadOrThrow(response);
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  getActivities() async {
    try {
      Response<ActivitiesListResponse> response =
          await apiProvider.apiClient.activitiesGet();
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        activities = ApiSuccessParser.payloadOrThrow(response);
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  getFeelings() async {
    try {
      Response<FeelingsListResponse> response =
          await apiProvider.apiClient.feelingsGet();
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        feelings = ApiSuccessParser.payloadOrThrow(response);
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  completeAHappyPlace() async {
    try {
      savingPlace = true;
      Response<VisitedPlacesSaveResponse> response =
          await apiProvider.apiClient.visitedPlacesPost(
        location: finalLocationSelected!.description,
        latitude: finalLocationSelected!.latitude.toString(),
        longitude: finalLocationSelected!.longitude.toString(),
        moodId: finalMoodSelected?.id,
        moodTypeId: finalMoodTypeSelected?.id,
        placeId: finalPlaceSelected?.id,
        placeTypeId: finalPlaceTypeSelected?.id,
        activityId: int.parse(finalActivitySelected!.id!),
        activityTypeId: finalActivityTypeSelected?.id,
        feelingId: finalFeelingSelected?.id,
        feelingRating: finalFeelingRating,
        feelingNote: finalNoteFeeling,
      );
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        ApiSuccessParser.payloadOrThrow(response);
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
      if (savingPlace) savingPlace = false;
    } catch (e) {
      if (savingPlace) savingPlace = false;
      rethrow;
    }
  }

  nextPage() {
    if (currentPage < totalPages) currentPage++;
  }

  previousPage() {
    if (currentPage > 0) currentPage--;
  }

  @action
  searchAddressWithAutoComplete(String value) async {
    placesAutoCompleteList.clear();
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
}
