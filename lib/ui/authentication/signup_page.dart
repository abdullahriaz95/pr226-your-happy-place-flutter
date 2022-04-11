import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:happy_place/data/stores/signup_store.dart';
import 'package:happy_place/generated/l10n.dart';
import 'package:happy_place/injection.dart';
import 'package:happy_place/ui/authentication/forgot_password_page.dart';
import 'package:happy_place/ui/home/home_page.dart';

import 'package:happy_place/ui/terms_and_privacy_policy/terms_and_privacy_policy.dart';
import 'package:happy_place/ui/widgets/app_button.dart';
import 'package:happy_place/ui/widgets/app_edit_text.dart';
import 'package:happy_place/ui/widgets/progress_dialog_layout.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

class SingupPageParams {
  const SingupPageParams(this.key);
  final Key key;
}

@injectable
class SingupPageServices {
  SignupStore store;
  SingupPageServices({
    required this.store,
  });
}

@injectable
class SignUpPage extends StatefulWidget {
  final SingupPageServices services;
  final SingupPageParams? params;
  SignUpPage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _disposers = [
      reaction((_) => widget.services.store.signUpComplete,
          (bool result) async {
        if (result) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => getIt<HomePage>(
                  param1: HomePageParams(
                    justSignedUp: true,
                  ),
                ),
              ),
              (route) => false);
        }
      }),
      reaction((_) => widget.services.store.isLoading, (bool result) async {
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
        title: const Text('Sign Up'),
      ),

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: widget.services.store.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // const SizedBox(height: 32),
                    material.Image.asset(
                      'assets/images/your_happy_place_with_logo.png',
                      height: MediaQuery.of(context).size.width * 0.45,
                      width: MediaQuery.of(context).size.width * 0.45,
                    ),
                    const SizedBox(height: 12),
                    AppEditText(
                      backgroundcolor: Colors.white,
                      borderColor: Colors.grey,
                      headingText: 'Email',
                      textInputAction: TextInputAction.next,
                      hint: 'Type here',
                      textController:
                          widget.services.store.emailTextEditingController,
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
                      hint: 'Type here',
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      textController:
                          widget.services.store.passwordTextEditingController,
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
                    const SizedBox(height: 24),
                    _termsAndConditions(context),
                    const SizedBox(height: 10),
                    AppButton(
                      title: 'Sign Up',
                      onPressed: () async {
                        await widget.services.store.signUp();
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                    // const SizedBox(height: 100),
                    // _dontHaveAccount(context),
                    // const SizedBox(height: 200),
                  ],
                ),
              ),
            ),
          ),
          _dontHaveAccount(context),
        ],
      ),
      // body: Stack(
      //   children: [

      //     _dontHaveAccount(context),
      //   ],
      // ),
    );
  }

  Widget _dontHaveAccount(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: RichText(
          text: TextSpan(
            text: 'Already have an account? ',
            style: Theme.of(context).textTheme.bodyText1,
            children: [
              TextSpan(
                text: 'Sign In',
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Navigator.pop(context),
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

  Widget _termsAndConditions(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => getIt<ForgotPasswordPage>(),
          ),
        );
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'By Signing up, you agree to our\n',
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(fontWeight: FontWeight.normal, height: 1.5),
          children: [
            TextSpan(
              text: 'Terms & Conditions',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => getIt<TermsAndPrivacyPolicyPage>(
                        param1: TermsAndPrivacyPolicyPageParams(
                          title: 'Terms & Conditions',
                        ),
                      ),
                    ),
                  );
                },
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            TextSpan(
              text: ' and ',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
            ),
            TextSpan(
              text: 'Privacy Policy.',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => getIt<TermsAndPrivacyPolicyPage>(
                        param1: TermsAndPrivacyPolicyPageParams(
                          title: 'Privacy Policy',
                        ),
                      ),
                    ),
                  );
                },
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
