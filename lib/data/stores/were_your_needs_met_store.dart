import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'were_your_needs_met_store.g.dart';

@injectable
class WereYourNeedsMetStore = _WereYourNeedsMetStore
    with _$WereYourNeedsMetStore;

abstract class _WereYourNeedsMetStore with Store {
  final ApiProvider apiProvider;
  _WereYourNeedsMetStore({
    required this.apiProvider,
  });

  TextEditingController noteEditingController = TextEditingController();

  @observable
  bool isLoading = false;

  @observable
  List<FeelingRating> filters = [];

  @observable
  int indexSelected = 0;

  @action
  getFilters() async {
    try {
      isLoading = true;
      Response<FeelingsListRatingsResponse> response =
          await apiProvider.apiClient.feelingRatingsGet();

      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {

        filters = ApiSuccessParser.payloadOrThrow(response);
        indexSelected = filters.length - 1;
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
  updateSelected(int index) {
    indexSelected = index;
  }
}
