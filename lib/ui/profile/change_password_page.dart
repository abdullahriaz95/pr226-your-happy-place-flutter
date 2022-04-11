import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/api_utils/http_exception.dart';
import 'package:happy_place/data/stores/change_password_store.dart';
import 'package:happy_place/generated/l10n.dart';
import 'package:happy_place/ui/widgets/app_button.dart';
import 'package:happy_place/ui/widgets/app_edit_text.dart';
import 'package:happy_place/ui/widgets/progress_dialog_layout.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

class ChangePasswordPageParams {
  const ChangePasswordPageParams(this.key);
  final Key key;
}

@injectable
class ChangePasswordPageServices {
  ChangePasswordStore store;
  ChangePasswordPageServices({
    required this.store,
  });
}

@injectable
class ChangePasswordPage extends StatefulWidget {
  final ChangePasswordPageServices services;
  final ChangePasswordPageParams? params;
  ChangePasswordPage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _disposers = [
      reaction(
        (_) => widget.services.store.isLoading,
        (bool result) {
          if (result) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.grey.shade800,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  content: const ProgressDialogLayout(),
                );
              },
            );
          } else {
            Navigator.pop(context);
          }
        },
      ),
      reaction(
        (_) => widget.services.store.passwordChanged,
        (int result) {
          Navigator.pop(context);
        },
      ),
    ];
    super.initState();
  }

  @override
  void dispose() {
    for (final d in _disposers) {
      d();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Change Password'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Observer(builder: (context) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  AppEditText(
                    headingTextColor: Colors.grey.shade800,
                    textController:
                        widget.services.store.currentPasswordEditingController,
                    backgroundcolor: Colors.white,
                    borderColor: Colors.grey,
                    obscureText: true,
                    headingText: 'Current password',
                    hint: '',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return S.of(context).entPass;
                      } else if (value.length < 8) {
                        return S.of(context).passLength;
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  AppEditText(
                    headingTextColor: Colors.grey.shade800,
                    textController:
                        widget.services.store.newPasswordEditingController,
                    backgroundcolor: Colors.white,
                    borderColor: Colors.grey,
                    obscureText: true,
                    headingText: 'New password',
                    hint: '',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return S.of(context).enter_new_password;
                      } else if (value.length < 8) {
                        return S.of(context).passLength;
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  AppEditText(
                    headingTextColor: Colors.grey.shade800,
                    textController:
                        widget.services.store.confirmPasswordEditingController,
                    backgroundcolor: Colors.white,
                    borderColor: Colors.grey,
                    obscureText: true,
                    headingText: 'Confirm password',
                    hint: '',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return S.of(context).enter_confirm_password;
                      } else if (value.length < 8) {
                        return S.of(context).passLength;
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    title: 'Save',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (widget.services.store.newPasswordEditingController
                                .text !=
                            widget.services.store
                                .confirmPasswordEditingController.text) {
                          HttpExceptionNotifyUser.showError(
                              'New and confirm password must be the same.');
                        } else {
                          widget.services.store.changePassword();
                        }
                      }
                    },
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
