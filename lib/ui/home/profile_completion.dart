import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/data/stores/navigation_store.dart';
import 'package:happy_place/data/stores/profile_store.dart';
import 'package:happy_place/injection.dart';
import 'package:happy_place/ui/profile/edit_profile_page.dart';
import 'package:happy_place/ui/widgets/app_button.dart';
import 'package:happy_place/ui/widgets/loader.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

class CompleteProfilePageParams {
  Key? key;
  CompleteProfilePageParams({this.key});
}

@injectable
class CompleteProfileServices {
  CompleteProfileServices();
}

@injectable
class CompleteProfilePage extends StatefulWidget {
  final CompleteProfileServices? services;
  final CompleteProfilePageParams? params;

  CompleteProfilePage({
    @factoryParam this.params,
    this.services,
  }) : super(key: params?.key);

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late List<ReactionDisposer> _disposers;

  @override
  void initState() {
    // getIt<ProfileStore>().initProfileOnly();

    _disposers = [
      reaction(
        (_) => getIt<ProfileStore>().isProfileUpdated,
        (bool result) {
          if (result) {
            getIt<NavigationStore>().selectPage(0);
          }
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
    return Observer(builder: (context) {
      if (getIt<ProfileStore>().isLoading) {
        return const Loader();
      }

      return Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              Image.asset(
                'assets/images/your_happy_place_with_logo.png',
                height: MediaQuery.of(context).size.width * 0.35,
                width: MediaQuery.of(context).size.width * 0.35,
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Your profile is not completed. It will help to meet your needs, and find people like you',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/img_complete_profile.png',
                      height: MediaQuery.of(context).size.height * 0.28,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'By completing your profile, you will help us to personalise your feedback and enable you to better explore places that meets your needs. You will be able to explore places with a \'people like me\' feature in future updates.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              AppButton(
                title: 'Complete Profile',
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => getIt<EditProfilePage>(),
                    ),
                  );

                  getIt<NavigationStore>().selectPage(0);
                },
              ),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: () {
                  getIt<NavigationStore>().updateDontShowAgain();
                  getIt<NavigationStore>().selectPage(0);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text('Don\'t show this again'),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      );
    });
  }
}
