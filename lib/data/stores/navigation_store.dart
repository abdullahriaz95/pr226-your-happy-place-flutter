import 'package:chopper/chopper.dart';

import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../api_utils/api_parser.dart';
import '../../api_utils/api_provider.dart';

part 'navigation_store.g.dart';

@singleton
class NavigationStore = _NavigationStore with _$NavigationStore;

abstract class _NavigationStore with Store {
  // final ApiProvider apiProvider;

  _NavigationStore() {
    getProfile();
  }

  @observable
  int selectedPage = 0;

  @observable
  bool isLoading = false;

  @observable
  bool dontShowAgain = false;

  @action
  selectPage(int page) {
    selectedPage = page;
  }

  @action
  updateDontShowAgain() async {
    try {
      Response<ProfileHideProfileUpdateMessageResponse> response =
          await getIt<ApiProvider>()
              .apiClient
              .profileCompleteProfileRememberPut();
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        dontShowAgain = true;
        ApiSuccessParser.payloadOrThrow(response);
      }
    } catch (e) {
      rethrow;
    }
  }

  @action
  getProfile() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    try {
      Response<ProfileMyProfileResponse> response =
          await getIt<ApiProvider>().apiClient.profileGet();
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        User? user = ApiSuccessParser.payloadOrThrow(response);
        dontShowAgain = user?.completeProfileRemember ?? false;
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }

  @action
  reset() {
    dontShowAgain = false;
  }
}
