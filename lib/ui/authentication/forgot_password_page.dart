import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:happy_place/data/stores/forgot_password_store.dart';
import 'package:happy_place/generated/l10n.dart';
import 'package:happy_place/ui/widgets/app_button.dart';
import 'package:happy_place/ui/widgets/app_edit_text.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

class ForgotPasswordPageParams {
  const ForgotPasswordPageParams(this.key);
  final Key key;
}

@injectable
class ForgotPasswordPageServices {
  ForgotPasswordStore store;
  ForgotPasswordPageServices({
    required this.store,
  });
}

@injectable
class ForgotPasswordPage extends StatefulWidget {
  final ForgotPasswordPageServices services;
  final ForgotPasswordPageParams? params;

  ForgotPasswordPage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _disposers = [
      reaction((_) => widget.services.store.error, (result) async {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                widget.services.store.errorMessage ?? 'Something went wrong'),
          ),
        );
      }),
      reaction((_) => widget.services.store.linkSent, (result) async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Link Sent"),
              content: const Text(
                  "A password reset link has been sent. Please check your email."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                )
              ],
            );
          },
        );
      }),
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: widget.services.store.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              Image.asset(
                'assets/images/your_happy_place_with_logo.png',
                height: MediaQuery.of(context).size.width / 2,
                width: MediaQuery.of(context).size.width / 2,
              ),
              const SizedBox(height: 24),
              AppEditText(
                backgroundcolor: Colors.white,
                borderColor: Colors.grey,
                headingText: 'Email',
                hint: 'Type here',
                textInputAction: TextInputAction.done,
                textController:
                    widget.services.store.forgotPasswordTextEditingController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return S.of(context).signupEmptyEmail;
                  } else if (!EmailValidator.validate(value.trim())) {
                    return S.of(context).entVEmain;
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 24),
              AppButton(
                title: 'Reset Password',
                onPressed: () {
                  widget.services.store.forgotPassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
