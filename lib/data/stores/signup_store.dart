import 'package:chopper/chopper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:happy_place/api_utils/api_provider.dart';
part 'signup_store.g.dart';

@injectable
class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
  final ApiProvider apiProvider;

  _SignupStore({
    required this.apiProvider,
  });

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  String? errorMessage;

  @observable
  bool isLoading = false;

  @observable
  bool signUpComplete = false;

  @action
  signUp() async {
    try {
      if (formKey.currentState?.validate() ?? false) {
        isLoading = true;
        String? pushNotification = await FirebaseMessaging.instance.getToken();
        Response<AuthRegisterResponse> authRegisterResponse =
            await apiProvider.apiClient.registerPost(
          deviceId: apiProvider.userProvider.deviceId.deviceId,
          deviceType: apiProvider.userProvider.deviceId.deviceType,
          devicePushToken: pushNotification,
          firstName: '',
          lastName: '',
          genderId: 1,
          ageGroup: '10-50',
          email: emailTextEditingController.text.trim(),
          address: '',
          latitude: '',
          longitude: '',
          username: '',
          password: passwordTextEditingController.text.trim(),
          passwordConfirmation: passwordTextEditingController.text.trim(),
        );
        if (isLoading) isLoading = false;
        if (ApiSuccessParser.isSuccessfulWithPayload(authRegisterResponse)) {
          User? user = ApiSuccessParser.payloadOrThrow(authRegisterResponse);
          if (user != null) {
            await updateUserProvider(user);
            signUpComplete = true;
          }
        } else {
          ApiSuccessParser.isSuccessfulOrThrowWithMessage(authRegisterResponse);
        }
      }
    } catch (e) {
      if (isLoading) isLoading = false;
      rethrow;
    }
  }

  @action
  updateUserProvider(User user) {
    apiProvider.userProvider.onLogIn(user);
  }
}
