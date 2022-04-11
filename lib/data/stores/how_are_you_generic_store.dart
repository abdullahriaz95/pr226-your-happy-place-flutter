import 'package:flutter/material.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'how_are_you_generic_store.g.dart';

@injectable
class HowAreYouGenericStore = _HowAreYouGenericStore
    with _$HowAreYouGenericStore;

abstract class _HowAreYouGenericStore with Store {
  final ApiProvider apiProvider;
  _HowAreYouGenericStore({
    required this.apiProvider,
  });

  TextEditingController noteEditingController = TextEditingController();

  @observable
  bool isLoading = false;

  @observable
  List<MoodType> moodTypes = [];

  @observable
  List<PlaceType> placesTypes = [];

  @observable
  List<ActivityType> activityTypes = [];

  @observable
  List<FeelingType> feelingTypes = [];

  @action
  getMoodDetails(int id) async {
    try {
      isLoading = true;
      var response = await apiProvider.apiClient.moodsIdTypesGet(id: id);
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        moodTypes = ApiSuccessParser.payloadOrThrow(response);
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;

    }
  }

  @action
  getPlaceDetails(int id) async {
    try {
      isLoading = true;
      var response = await apiProvider.apiClient.placesIdTypesGet(id: id);
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        placesTypes = ApiSuccessParser.payloadOrThrow(response);
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;

    }
  }

  @action
  getActivityDetails(int id) async {
    try {
      isLoading = true;
      var response = await apiProvider.apiClient.activitiesIdTypesGet(id: id);
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        activityTypes = ApiSuccessParser.payloadOrThrow(response);
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;

    }
  }

  @action
  getFeelingDetails(int id) async {
    try {
      isLoading = true;
      var response = await apiProvider.apiClient.feelingsIdTypesGet(id: id);
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        feelingTypes = ApiSuccessParser.payloadOrThrow(response);
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;

    }
  }
}
