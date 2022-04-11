
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

class TermsAndPrivacyPolicyPageParams {
  TermsAndPrivacyPolicyPageParams({this.key, required this.title});
  final Key? key;
  String title;
}

@injectable
class TermsAndPrivacyPolicyPageServices {
  // ProfileStore store;
  // TermsAndPrivacyPolicyPageServices({
  //   // required this.store,
  // });
}

@injectable
class TermsAndPrivacyPolicyPage extends StatelessWidget {
  final TermsAndPrivacyPolicyPageServices services;
  final TermsAndPrivacyPolicyPageParams? params;
  TermsAndPrivacyPolicyPage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(params!.title),
        centerTitle: true,
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: const Center(
          child: Text('Waiting for Links'),
        ),
      ),
    );
  }
}
