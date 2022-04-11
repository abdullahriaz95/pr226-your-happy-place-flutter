import 'package:chopper/chopper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

@injectable
class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final ApiProvider apiProvider;

  _LoginStore({
    required this.apiProvider,
  });

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  String? errorMessage;
  GlobalKey<FormState> formKey = GlobalKey();

  @observable
  bool isLoading = false;

  @observable
  int error = 1;

  @observable
  bool loginComplete = false;

  @action
  signIn() async {
    try {
      if (formKey.currentState?.validate() ?? false) {
        isLoading = true;

        String? pushNotification = await FirebaseMessaging.instance.getToken();
        Response<AuthLoginResponse> authLoginResponse =
            await apiProvider.apiClient.loginPost(
                deviceId: apiProvider.userProvider.deviceId.deviceId,
                deviceType: apiProvider.userProvider.deviceId.deviceType,
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text,
                devicePushToken: pushNotification);

        if (isLoading) isLoading = false;
        if (ApiSuccessParser.isSuccessfulWithPayload(authLoginResponse)) {
          User? user = ApiSuccessParser.payloadOrThrow(authLoginResponse);
          if (user != null) {
            await updateUserProvider(user);
            loginComplete = true;
          }
        } else {
          ApiSuccessParser.isSuccessfulOrThrowWithMessage(authLoginResponse);
        }
      }
    } catch (e) {
      if (isLoading) isLoading = false;

    }
  }

  @action
  updateUserProvider(User user) {
    apiProvider.userProvider.onLogIn(user);
  }
}
