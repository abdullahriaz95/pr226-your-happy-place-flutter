import 'dart:io';

import 'package:happy_place/api_utils/api_provider.dart';
import 'package:happy_place/api_utils/device_id_provider.dart';
import 'package:happy_place/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'notification_store.g.dart';

@injectable
class NotificationStore = _NotificationStore with _$NotificationStore;

abstract class _NotificationStore with Store {
  final ApiProvider apiProvider;
  _NotificationStore({
    required this.apiProvider,
  }) {
    getNotifications();
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
  getNotifications() async {
    try {
      isLoading = true;
      await apiProvider.apiClient.notificationsGet(
        xDeviceId: getIt<DeviceIdProvider>().deviceId.deviceId,
        xDeviceType: Platform.isIOS ? 'iOS' : 'Android',
      );
      isLoading = false;
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }
}
