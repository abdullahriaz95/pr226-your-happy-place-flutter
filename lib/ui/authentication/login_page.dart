import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:happy_place/generated/l10n.dart';
import 'package:happy_place/injection.dart';
import 'package:happy_place/ui/authentication/forgot_password_page.dart';
import 'package:happy_place/ui/authentication/signup_page.dart';
import 'package:happy_place/ui/home/home_page.dart';
import 'package:happy_place/ui/widgets/app_button.dart';
import 'package:happy_place/ui/widgets/progress_dialog_layout.dart';
import 'package:injectable/injectable.dart';

import 'package:happy_place/data/stores/login_store.dart';
import 'package:happy_place/ui/widgets/app_edit_text.dart';
import 'package:mobx/mobx.dart';

class LoginPageParams {
  const LoginPageParams(this.key);
  final Key key;
}

@injectable
class LoginPageServices {
  LoginStore loginStore;
  LoginPageServices({
    required this.loginStore,
  });
}

@injectable
class LoginPage extends StatefulWidget {
  final LoginPageServices services;
  final LoginPageParams? params;
  LoginPage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _disposers = [
      reaction((_) => widget.services.loginStore.loginComplete,
          (bool result) async {
        if (result) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => getIt<HomePage>(
                  param1: HomePageParams(
                    justLoggedIn: true,
                  ),
                ),
              ),
              (route) => false);
        }
      }),
      reaction((_) => widget.services.loginStore.isLoading,
          (bool result) async {
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
        title: const Text('Sign In'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: widget.services.loginStore.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // const SizedBox(height: 32),
                    Image.asset(
                      'assets/images/your_happy_place_with_logo.png',
                      height: MediaQuery.of(context).size.width * 0.45,
                      width: MediaQuery.of(context).size.width * 0.45,
                    ),
                    const SizedBox(height: 12),
                    AppEditText(
                      backgroundcolor: Colors.white,
                      borderColor: Colors.grey,
                      headingText: 'Email',
                      hint: 'Type here',
                      textInputAction: TextInputAction.next,
                      textController:
                          widget.services.loginStore.emailTextEditingController,
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
                    const SizedBox(height: 12),
                    AppEditText(
                      backgroundcolor: Colors.white,
                      borderColor: Colors.grey,
                      headingText: 'Password',
                      textInputAction: TextInputAction.done,
                      hint: 'Type here',
                      obscureText: true,
                      textController: widget
                          .services.loginStore.passwordTextEditingController,
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
                    _forgotPassword(context),
                    const SizedBox(height: 12),
                    AppButton(
                      title: 'Sign In',
                      onPressed: () async {
                        await widget.services.loginStore.signIn();
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                    // Expanded(
                    //   child: Container(),
                    // ),
                    // _dontHaveAnAccount(context),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _dontHaveAnAccount(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => getIt<ForgotPasswordPage>(),
            ),
          );
        },
        child: Text(
          'Forgot Password?',
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: Colors.grey.shade500),
        ),
      ),
    );
  }

  Widget _dontHaveAnAccount(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: RichText(
          text: TextSpan(
            text: 'Don\'t have an account? ',
            style: Theme.of(context).textTheme.bodyText1,
            children: [
              TextSpan(
                text: 'Sign Up',
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => getIt<SignUpPage>(),
                        ),
                      ),
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
