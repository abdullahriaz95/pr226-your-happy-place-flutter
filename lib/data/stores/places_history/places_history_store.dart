import 'package:chopper/chopper.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'places_history_store.g.dart';

@injectable
class PlacesHistoryStore = _PlacesHistoryStore with _$PlacesHistoryStore;

abstract class _PlacesHistoryStore with Store {
  final ApiProvider apiProvider;
  _PlacesHistoryStore({
    required this.apiProvider,
  }) {
    init();
  }

  init() {
    getPlacesHistory();
  }

  String? errorMessage;

  @observable
  bool isLoading = false;

  @observable
  int error = 1;

  @observable
  List<VisitedPlace> myPlaces = [];

  @action
  getPlacesHistory() async {
    try {
      isLoading = true;
      Response<VisitedPlacesListResponse> response =
          await apiProvider.apiClient.visitedPlacesGet(q: '');
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        myPlaces = ApiSuccessParser.payloadOrThrow(response);
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
      isLoading = false;
    } catch (e) {
      rethrow;
    }
  }
}
