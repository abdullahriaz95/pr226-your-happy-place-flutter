import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';
import 'package:happy_place/api_utils/http_exception.dart';
import 'package:happy_place/generated_api_code/api_client.swagger.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'change_password_store.g.dart';

@injectable
class ChangePasswordStore = _ChangePasswordStore with _$ChangePasswordStore;

abstract class _ChangePasswordStore with Store {
  final ApiProvider apiProvider;
  _ChangePasswordStore({
    required this.apiProvider,
  });

  TextEditingController currentPasswordEditingController =
      TextEditingController();

  TextEditingController newPasswordEditingController = TextEditingController();

  TextEditingController confirmPasswordEditingController =
      TextEditingController();

  @observable
  bool isLoading = false;

  @observable
  int passwordChanged = 1;

  @action
  changePassword() async {
    try {
      isLoading = true;
      Response<SuccessResponse> response =
          await apiProvider.apiClient.passwordEditPost(
        password: newPasswordEditingController.text,
        currentPassword: currentPasswordEditingController.text,
        passwordConfirmation: confirmPasswordEditingController.text,
      );
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        if (response.body?.message != null) {
          HttpExceptionNotifyUser.showMessage(response.body!.message!);
        }
        passwordChanged++;
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
      if (isLoading) {
        isLoading = false;
      }
    } catch (e) {
      if (isLoading) {
        isLoading = false;
      }
      rethrow;
    }
  }
}
