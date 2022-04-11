import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';
import 'package:happy_place/api_utils/http_exception.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'requests_store.g.dart';

@injectable
class RequestsStore = _RequestsStore with _$RequestsStore;

abstract class _RequestsStore with Store {
  final ApiProvider apiProvider;
  _RequestsStore({
    required this.apiProvider,
  }) {
    getRequests();
  }

  @observable
  bool isLoading = false;

  @observable
  List<User> users = [];

  @action
  getRequests() async {
    try {
      users.clear();
      isLoading = true;
      var response = await apiProvider.apiClient.friendRequestsGet();
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        users = ApiSuccessParser.payloadOrThrow(response);

        var response1 = await apiProvider.apiClient.familyRequestsGet();
        if (ApiSuccessParser.isSuccessfulWithPayload(response1)) {
          users.addAll(ApiSuccessParser.payloadOrThrow(response1));
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
  acceptRequest(int userId) async {
    try {
      var response =
          await apiProvider.apiClient.friendFamilyAcceptPut(userId: userId);
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        HttpExceptionNotifyUser.showMessage(response.body!.message!);
        getRequests();
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  rejectRequest(int userId) async {
    try {
      var response =
          await apiProvider.apiClient.friendFamilyRejectPut(userId: userId);
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        HttpExceptionNotifyUser.showMessage(response.body!.message!);
        getRequests();
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    } catch (e) {
      rethrow;
    }
  }
}
