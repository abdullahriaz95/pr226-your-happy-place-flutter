import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/image.dart' as image;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/data/stores/dashboard_store.dart';
import 'package:happy_place/data/stores/navigation_store.dart';
import 'package:happy_place/data/stores/profile_store.dart';
import 'package:happy_place/generated/l10n.dart';
import 'package:happy_place/injection.dart';
import 'package:happy_place/ui/add_new_happy_place/add_new_happy_place.dart';
import 'package:happy_place/ui/explore/explore_page.dart';
import 'package:happy_place/ui/my_happiness/my_happiness_page.dart';
import 'package:happy_place/ui/my_places/my_places_page.dart';
import 'package:happy_place/ui/profile/edit_profile_page.dart';
import 'package:happy_place/ui/settings/information_page.dart';
import 'package:happy_place/ui/widgets/app_button.dart';
import 'package:injectable/injectable.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

class DashboardParams {
  const DashboardParams(this.key);
  final Key key;
}

@injectable
class DashboardServices {
  DashboardStore store;
  NavigationStore navigationStore;
  DashboardServices({
    required this.store,
    required this.navigationStore,
  });
}

@injectable
class DashboardPage extends StatefulWidget {
  final DashboardServices services;
  final DashboardParams? params;
  DashboardPage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    getIt<ProfileStore>().initProfileOnly();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // const SizedBox(height: 12),
            _completeProfile(context),
            _googleAdvertisement(context),
            const SizedBox(height: 8),
            _image(),
            _pickImagesSection(context),
            const SizedBox(height: 16),
            _happinesAndPlaces(context),
            const SizedBox(height: 16),
            _myPeople(context),
            const SizedBox(height: 16),
            _questionsAndExplore(context),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _questionsAndExplore(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 3,
              ),
            ),
            child: Column(
              children: [
                image.Image.asset(
                  'assets/images/qa_btn.png',
                  height: 40,
                  width: 40,
                ),
                const SizedBox(height: 8),
                Text(
                  'Q & A',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => getIt<ExplorePage>(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 3,
                ),
              ),
              child: Column(
                children: [
                  image.Image.asset(
                    'assets/images/explore_btn.png',
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Explore',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _myPeople(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.services.navigationStore.selectedPage = 1;
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          children: [
            image.Image.asset(
              'assets/images/my_people_btn.png',
              height: 40,
              width: 40,
            ),
            const SizedBox(height: 8),
            Text(
              'My People',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            )
          ],
        ),
      ),
    );
  }

  Widget _happinesAndPlaces(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TapDebouncer(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => getIt<MyHappinessPage>(),
                ),
              );
            },
            builder: (context, onTap) {
              return GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Column(
                    children: [
                      image.Image.asset(
                        'assets/images/happiness_btn.png',
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        S.of(context).myHappiness,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: TapDebouncer(onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => getIt<MyPlacesPage>(),
              ),
            );
          }, builder: (context, onTap) {
            return GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  children: [
                    image.Image.asset(
                      'assets/images/places_btn.png',
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'My Places',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    )
                  ],
                ),
              ),
            );
          }),
        )
      ],
    );
  }

  Widget _pickImagesSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => getIt<AddNewHappyPlacePage>(),
          ),
        );
      },
      child: DottedBorder(
        dashPattern: const [6, 6],
        color: Colors.grey,
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Container(
            color: Colors.grey.shade100,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                const SizedBox(width: 26),
                image.Image.asset(
                  'assets/images/ic_add_home.png',
                  height: 70,
                  width: 70,
                ),
                const SizedBox(width: 26),
                const Expanded(
                  child: Text(
                    'Pick icons and take photos to create a record of your mood, activity and place patterns. Share with family and friends. Explore places that fit your personality and meet your needs then find people like you.',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: 26),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _completeProfile(BuildContext context) {
    return Observer(builder: (context) {
      if (getIt<ProfileStore>().isProfileUpdated ||
          getIt<ProfileStore>().isLoading) {
        return const SizedBox();
      }

      return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Your profile is not completed. It will help to meet your needs, and find people like you.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                AppButton(
                  title: 'Complete Profile',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => getIt<EditProfilePage>(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  _googleAdvertisement(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => getIt<InformationPage>(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Center(
              child: Text(
                'Google Advertisement',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Colors.grey.shade400, fontWeight: FontWeight.w200),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _image() {
    return image.Image.asset('assets/images/house.png');
  }
}
