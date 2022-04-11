import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:happy_place/api_utils/user_provider.dart';
import 'package:happy_place/generated/l10n.dart';
import 'package:happy_place/injection.dart';
import 'package:happy_place/ui/authentication/login_page.dart';
import 'package:happy_place/ui/home/home_page.dart';
import 'package:happy_place/ui/theme/app_theme.dart';
import 'package:logging/logging.dart';

import 'generated_api_code/api_client.swagger.dart';

void setLoggingLevelAll() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    // ignore: avoid_print
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(sandbox.name);
  setLoggingLevelAll();
  await Firebase.initializeApp();

  final home = await getHome();
  runApp(MyApp(home));
}

class MyApp extends StatelessWidget {
  final Widget home;
  const MyApp(this.home, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.getTheme(context),
      home: home,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}

Future<Widget> getHome() async {
  // return CompleteProfilePage();
  // // Uri parsing may fail, so we use a try/catch FormatException.
  // try {
  //   final initialUri = await getInitialUri();
  //   // Use the uri and warn the user, if it is not correct,
  //   // but keep in mind it could be `null`.
  //   print('URI START ${initialUri?.toString()}');
  //   if (initialUri != null && initialUri.path.startsWith('/password/reset/')) {
  //     return getIt<ResetPassword>();
  //   }
  // } on FormatException {
  //   // Handle exception by warning the user their action did not succeed
  //   // return?
  // }

  final userProvider = getIt<UserProvider>();
  final user = await userProvider.getUserOnAppStart();
  return getHomeFromUser(user);
}

Widget getHomeFromUser(User? user) {
  Widget home = getIt<LoginPage>();
  if (user != null) {
    home = getIt<HomePage>();
  }
  return home;
}
