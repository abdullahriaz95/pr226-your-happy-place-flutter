import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:happy_place/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_provider.dart';
import 'device_id_provider.dart';

@module
abstract class SharedPreferencesModule {
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}

/// This class hold the user object across the entire app.
@preResolve
@singleton
class UserProvider {
  static const String _kUserAccessToken = 'accessToken';

  UserProvider(this.sharedPreferences, DeviceIdProvider deviceIdProvider)
      : deviceId = deviceIdProvider.deviceId;

  @factoryMethod
  static Future<UserProvider> create(SharedPreferences sharedPreferences,
      DeviceIdProvider deviceIdProvider) async {
    final userProvider = UserProvider(sharedPreferences, deviceIdProvider);
    return userProvider;
  }

  final SharedPreferences sharedPreferences;
  final DeviceId deviceId;

  User? _user;

  // /// Returns the User if logged in. null otherwise
  User? get user => _user;

  // /// Returns true if the User is logged in
  bool get isLoggedIn => _user != null;

  // /// Call this function when the user logs in
  void onLogIn(User user) async {
    _user = user;
    await _setAccessToken(_user!.accessToken);
  }

  // /// Call this function when the user is updated
  void onUserUpdated(User user) async {
    _user = user.copyWith(accessToken: _user?.accessToken);
  }

  /// Call this function when the user logs out or is logged out
  void logOut() async {
    await _setAccessToken(null);
    _user = null;
  }

  Future<void> _setAccessToken(String? accessToken) async {
    if (accessToken != null) {
      await sharedPreferences.setString(_kUserAccessToken, accessToken);
    } else {
      await sharedPreferences.remove(_kUserAccessToken);
    }
  }

  String? get _accessToken => sharedPreferences.getString(_kUserAccessToken);

  Future<User?> getUserOnAppStart() async {
    final api = getIt<ApiProvider>();
    if (_accessToken != null) {

      try {
        _user = User(accessToken: _accessToken);
        var profile = await api.apiClient.profileGet();
        _user = profile.body?.payload?.copyWith(accessToken: _accessToken);
        return _user;
      } catch (e) {
        _user = null;
      }
    }
    return null;
  }
}
