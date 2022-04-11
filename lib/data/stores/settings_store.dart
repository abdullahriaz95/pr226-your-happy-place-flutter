import 'package:chopper/chopper.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

@injectable
class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  final ApiProvider apiProvider;
  _SettingsStore({
    required this.apiProvider,
  }) {
    getSettings();
  }

  @observable
  bool keepPrivate = false;

  @observable
  bool makePublic = false;

  @observable
  bool family = false;

  @observable
  bool friends = false;

  @observable
  bool visibleUserName = false;

  @observable
  bool savingSettings = false;

  @observable
  bool isLoading = false;

  @action
  getSettings() async {
    try {
      isLoading = true;
      Response<ProfileMyProfileResponse> response =
          await apiProvider.apiClient.profileGet();
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        User? user = ApiSuccessParser.payloadOrThrow(response);
        if (user != null) {
          keepPrivate = user.postsKeepPrivate == '0' ? false : true;
          makePublic = user.postsWithPublic == '0' ? false : true;
          family = user.postsWithFamily == '0' ? false : true;
          friends = user.postsWithFriends == '0' ? false : true;
          visibleUserName = user.visibleUsername == '0' ? false : true;
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
  updateSettings() async {
    try {
      await apiProvider.apiClient.profileSettingsPut(
        postsKeepPrivate: keepPrivate ? 1 : 0,
        postsWithPublic: makePublic ? 1 : 0,
        postsWithFamily: family ? 1 : 0,
        postsWithFriends: friends ? 1 : 0,
        visibleUsername: visibleUserName ? 1 : 0,
      );
    } catch (e) {
      rethrow;
    }
  }
}
