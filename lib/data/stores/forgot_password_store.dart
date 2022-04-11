import 'package:flutter/material.dart';
import 'package:happy_place/api_utils/api_parser.dart';
import 'package:happy_place/api_utils/api_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'forgot_password_store.g.dart';

@injectable
class ForgotPasswordStore = _ForgotPasswordStore with _$ForgotPasswordStore;

abstract class _ForgotPasswordStore with Store {
  final ApiProvider apiProvider;
  _ForgotPasswordStore({
    required this.apiProvider,
  });

  TextEditingController forgotPasswordTextEditingController =
      TextEditingController();
  String? errorMessage;
  GlobalKey<FormState> formKey = GlobalKey();

  @observable
  bool isLoading = false;

  @observable
  int error = 1;

  @observable
  int linkSent = 0;

  @action
  forgotPassword() async {
    if (formKey.currentState?.validate() ?? false) {
      var response = await apiProvider.apiClient
          .passwordEmailPost(email: forgotPasswordTextEditingController.text);
      if (ApiSuccessParser.isSuccessfulWithPayload(response)) {
        linkSent++;
      } else {
        ApiSuccessParser.isSuccessfulOrThrowWithMessage(response);
      }
    }
  }
}
