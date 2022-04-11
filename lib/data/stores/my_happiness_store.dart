import 'package:chopper/chopper.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'my_happiness_store.g.dart';

@injectable
class MyHappinessStore = _MyHappinessStore with _$MyHappinessStore;

abstract class _MyHappinessStore with Store {
  final ApiProvider apiProvider;

  _MyHappinessStore(this.apiProvider) {
    getHappinessOptions();
  }

  String? errorMessage;
  String? profileImagePath;
  @observable
  bool isLoadingOptions = false;

  @observable
  int error = 1;

  @observable
  List<HappynessOption> happinessOptions = [];

  @observable
  List<bool> testsLoading = [];

  @observable
  List<List<HappynessTest>> listTests = [];

  @action
  getHappinessOptions() async {
    try {
      isLoadingOptions = true;
      Response<HappynessOptionsListResponse>? response =
          await apiProvider.apiClient.happynessOptionsGet(perPage: 200);

      if (isLoadingOptions) isLoadingOptions = false;
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        happinessOptions = ApiSuccessParser.payloadOrThrow(response);
        for (var _ in happinessOptions) {
          testsLoading.add(false);
          listTests.add([]);
        }
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      if (isLoadingOptions) isLoadingOptions = false;
    }
  }

  @action
  getTests(String id, int index) async {
    try {
      testsLoading[index] = true;
      testsLoading = testsLoading;
      Response<HappynessTestsListResponse> response = await apiProvider
          .apiClient
          .happynessTestsGet(perPage: 200, optionId: id);
      testsLoading[index] = false;
      testsLoading = testsLoading;
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        listTests[index] = ApiSuccessParser.payloadOrThrow(response);
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      if (isLoadingOptions) isLoadingOptions = false;
      rethrow;
    }
  }
}
