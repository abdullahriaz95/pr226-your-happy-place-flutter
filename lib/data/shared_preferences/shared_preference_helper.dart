// import 'dart:async';

// import 'package:injectable/injectable.dart';
// import 'package:mobx/mobx.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// @module
// abstract class SharedPreferencesModule {
//   @preResolve
//   Future<SharedPreferences> get sharedPreferences =>
//       SharedPreferences.getInstance();
// }

// @preResolve
// @singleton
// class SharedPreferenceHelper {
//   final SharedPreferences _sharedPreference;
//   SharedPreferenceHelper(this._sharedPreference);

//   @factoryMethod
//   static Future<SharedPreferenceHelper> create(
//       SharedPreferences sharedPreferences) async {
//     final sharedPreferenceHelper = SharedPreferenceHelper(sharedPreferences);
//     return sharedPreferenceHelper;
//   }

//   String? get authToken {
//     return _sharedPreference.getString('authToken');
//   }

//   Future<bool> saveAuthToken(String authToken) async {
//     return _sharedPreference.setString('authToken', authToken);
//   }

//   Future<bool> removeAuthToken() async {
//     return _sharedPreference.remove('authToken');
//   }

//   // Login:---------------------------------------------------------------------
//   Future<bool> get isLoggedIn async {
//     return _sharedPreference.getBool('isLoggedIn') ?? false;
//   }

//   bool isLoggedInUser() {
//     return _sharedPreference.getBool('isLoggedIn') ?? false;
//   }

//   Future<bool> saveIsLoggedIn(bool value) async {
//     return _sharedPreference.setBool('isLoggedIn', value);
//   }

//   // // Theme:------------------------------------------------------
//   // bool get isDarkMode {
//   //   return _sharedPreference.getBool(Preferences.is_dark_mode) ?? false;
//   // }

//   // Future<void> changeBrightnessToDark(bool value) {
//   //   return _sharedPreference.setBool(Preferences.is_dark_mode, value);
//   // }

//   // // Language:---------------------------------------------------
//   // String? get currentLanguage {
//   //   return _sharedPreference.getString(Preferences.current_language);
//   // }

//   // Future<void> changeLanguage(String language) {
//   //   return _sharedPreference.setString(Preferences.current_language, language);
//   // }

// // idToken:---------------------------------------------------
//   String? get idToken {
//     return _sharedPreference.getString('idToken');
//   }

//   Future<void> setIdToken(String value) {
//     return _sharedPreference.setString('idToken', value);
//   }

//   // // User Model:---------------------------------------------------
//   // Future<void> setUserModel(UserModel res) async {
//   //   String user = jsonEncode(res);
//   //   _sharedPreference.setString(Preferences.userData, user);
//   // }

//   // //clear User Model:---------------------------------------------------
//   // Future<void> clearUserModel() async {
//   //   _sharedPreference.setString(Preferences.userData, '');
//   // }

//   // UserModel get getUserModel {
//   //   Map json =
//   //       jsonDecode(_sharedPreference.getString(Preferences.userData) ?? "");
//   //   if (json.isNotEmpty) {
//   //     return UserModel.fromJson(json);
//   //   }
//   //   return UserModel.fromJson(json);
//   // }

//   String? get deviceUUID {
//     return _sharedPreference.getString('FLUTTER_DEVICE_ID_KEY');
//   }

//   Future<void> setDeviceUUID(String value) {
//     return _sharedPreference.setString('FLUTTER_DEVICE_ID_KEY', value);
//   }
// }
