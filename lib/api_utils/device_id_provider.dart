import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class DeviceId {
  DeviceId(this.deviceId);

  final String deviceId;

  String get deviceType => Platform.isIOS ? 'APPLE' : 'ANDROID';
}

@singleton
class DeviceIdProvider {
  final deviceIdKey = 'FLUTTER_DEVICE_ID_KEY';

  DeviceIdProvider(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  DeviceId get deviceId {
    var deviceId = sharedPreferences.getString(deviceIdKey);
    if (deviceId == null) {
      deviceId = const Uuid().v4().toString();
      sharedPreferences.setString(deviceIdKey, deviceId);
    }
    return DeviceId(deviceId);
  }
}
