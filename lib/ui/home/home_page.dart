import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:happy_place/api_utils/user_provider.dart';
import 'package:happy_place/data/stores/navigation_store.dart';
import 'package:happy_place/data/stores/profile_store.dart';
import 'package:happy_place/generated/l10n.dart';
import 'package:happy_place/injection.dart';
import 'package:happy_place/ui/authentication/login_page.dart';
import 'package:happy_place/ui/dashboard/dashboard_page.dart';
import 'package:happy_place/ui/home/profile_completion.dart';
import 'package:happy_place/ui/profile/profile_page.dart';
import 'package:happy_place/ui/profile/requests_page.dart';
import 'package:happy_place/ui/settings/notification_page.dart';
import 'package:happy_place/ui/settings/settings_page.dart';
import 'package:happy_place/ui/widgets/loader.dart';
import 'package:injectable/injectable.dart';

class HomePageParams {
  bool? justSignedUp;
  bool? justLoggedIn;
  Key? key;
  HomePageParams({
    this.key,
    this.justSignedUp,
    this.justLoggedIn,
  });
}

@injectable
class HomePageServices {
  UserProvider userProvider;
  NavigationStore navigationStore;
  ProfileStore profileStore;
  HomePageServices({
    required this.userProvider,
    required this.navigationStore,
    required this.profileStore,
  });
}

@injectable
class HomePage extends StatefulWidget {
  final HomePageServices services;
  final HomePageParams? params;

  HomePage({
    @factoryParam this.params,
    required this.services,
  }) : super(key: params?.key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    checkNotificationPermission();
    listenNotifications();
    widget.services.navigationStore.getProfile();

    if (widget.params?.justSignedUp ?? false) {
      widget.services.navigationStore.selectedPage = -1;
    }
    if (widget.params?.justLoggedIn ?? false) {
      widget.services.navigationStore.selectedPage = -1;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: _drawerLayout(context),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => toggleDrawer(),
                child: Image.asset(
                  'assets/images/ic_menu.png',
                  height: 24,
                  width: 24,
                ),
              ),
            ],
          ),
          actions: [
            widget.services.navigationStore.selectedPage == 1
                ? GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => getIt<RequestsPage>(),
                        ),
                      );
                      widget.services.profileStore.init();
                    },
                    child: Observer(builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/ic_navigation_profile_active.png',
                              height: 18,
                            ),
                            widget.services.profileStore.listFriendRequests
                                    .isEmpty
                                ? const SizedBox()
                                : Container(
                                    height: 16,
                                    width: 16,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        widget.services.profileStore
                                            .listFriendRequests.length
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                    ),
                                  )
                          ],
                        ),
                      );
                    }),
                  )
                : const SizedBox(),
          ],
          title: Text(widget.services.navigationStore.selectedPage == -1
              ? ''
              : widget.services.navigationStore.selectedPage == 0
                  ? 'Home'
                  : widget.services.navigationStore.selectedPage == 2
                      ? 'Notification'
                      : widget.services.navigationStore.selectedPage == 4
                          ? 'Settings'
                          : 'My Profile'),
        ),
        body: Observer(builder: (context) {
          if (widget.services.navigationStore.isLoading) {
            return const Loader();
          }
          if (widget.services.navigationStore.selectedPage == -1 &&
              widget.services.navigationStore.dontShowAgain == false) {
            return CompleteProfilePage();
          }
          return widget.services.navigationStore.selectedPage == 0
              ? getIt<DashboardPage>()
              : widget.services.navigationStore.selectedPage == 2
                  ? getIt<NotificationPage>()
                  : widget.services.navigationStore.selectedPage == 4
                      ? getIt<SettingsPage>()
                      : getIt<ProfilePage>();
        }),
      );
    });
  }

  void toggleDrawer() {
    if (scaffoldKey.currentState?.isDrawerOpen == false) {
      scaffoldKey.currentState!.openDrawer();
    }
  }

  Widget _drawerLayout(BuildContext context) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 60),
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Navigation',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Image.asset(
                  'assets/images/your_happy_place_with_logo.png',
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 24),
            ListTile(
              leading: Image.asset(
                'assets/images/ic_navigation_home.png',
                height: 22,
                width: 22,
                color: widget.services.navigationStore.selectedPage == 0
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).textTheme.bodyText1?.color,
              ),
              title: Text(
                'Home',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: widget.services.navigationStore.selectedPage == 0
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.bodyText1?.color,
                    ),
              ),
              onTap: () {
                Navigator.pop(context);
                widget.services.navigationStore.selectPage(0);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/ic_navigation_profile.png',
                height: 22,
                width: 22,
                color: widget.services.navigationStore.selectedPage == 1
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).textTheme.bodyText1?.color,
              ),
              title: Text(
                'Profile',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: widget.services.navigationStore.selectedPage == 1
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.bodyText1?.color,
                    ),
              ),
              onTap: () {
                Navigator.pop(context);
                widget.services.navigationStore.selectPage(1);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/ic_navigation_notification.png',
                height: 22,
                width: 22,
                color: widget.services.navigationStore.selectedPage == 2
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).textTheme.bodyText1?.color,
              ),
              title: Text(
                'Notification',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: widget.services.navigationStore.selectedPage == 2
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.bodyText1?.color,
                    ),
              ),
              onTap: () {
                Navigator.pop(context);

                widget.services.navigationStore.selectPage(2);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/ic_navigation_privacy_policy.png',
                height: 22,
                width: 22,
                color: widget.services.navigationStore.selectedPage == 3
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).textTheme.bodyText1?.color,
              ),
              title: Text(
                'Privacy Policy',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: widget.services.navigationStore.selectedPage == 3
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.bodyText1?.color,
                    ),
              ),
              onTap: () {
                Navigator.pop(context);

                widget.services.navigationStore.selectPage(3);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/ic_navigation_settings.png',
                height: 22,
                width: 22,
                color: widget.services.navigationStore.selectedPage == 4
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).textTheme.bodyText1?.color,
              ),
              title: Text(
                'Settings',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: widget.services.navigationStore.selectedPage == 4
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.bodyText1?.color,
                    ),
              ),
              onTap: () {
                Navigator.pop(context);
                widget.services.navigationStore.selectPage(4);
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/ic_navigation_logout.png',
                height: 22,
                width: 22,
                color: widget.services.navigationStore.selectedPage == 5
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).textTheme.bodyText1?.color,
              ),
              title: Text(
                'Log out',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: widget.services.navigationStore.selectedPage == 5
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.bodyText1?.color,
                    ),
              ),
              onTap: () {
                showAlertDialog(context);
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      );
    });
  }

  void showAlertDialog(BuildContext context) {
    Widget okButton = Padding(
      padding: const EdgeInsets.only(left: 64.5, right: 63.5, bottom: 24.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  blurRadius: 10.0,
                  spreadRadius: 0.0, //extend the shadow
                  offset: const Offset(
                    0.0, // Move to right 10  horizontally
                    4, // Move to bottom 10 Vertically
                  ),
                ),
              ],
            ),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                S.of(context).no,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () async {
                Navigator.pop(context, true);
              },
              child: Text(
                S.of(context).yes,
              ),
            ),
          ),
        ],
      ),
    );
    var alert = AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      title: Text(
        S.of(context).logout,
        textAlign: TextAlign.center,
      ),
      content: Text(
        S.of(context).logoutAlertMessage,
        textAlign: TextAlign.center,
      ),
      actions: [okButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        }).then((value) async {
      if (value ?? false) {
        await logout(context, widget.services.userProvider);
      }
    });
  }

  Future<void> logout(BuildContext context, UserProvider user) async {
    user.logOut();
    getIt<ProfileStore>().reset();
    getIt<NavigationStore>().selectPage(0);
    getIt<NavigationStore>().reset();
    while (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    await Navigator.pushReplacement(
      context,
      // ignore: inference_failure_on_instance_creation
      MaterialPageRoute(
        builder: (context) => getIt<LoginPage>(),
      ),
    );
  }

  void checkNotificationPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    if (Platform.isIOS) {
      await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
    }
  }

  void listenNotifications() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // implementation here.
    });
  }
}
