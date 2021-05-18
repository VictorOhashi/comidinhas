import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'locator.dart';
import 'managers/dialog_manager.dart';
import 'router.dart';
import 'services/dialog_service.dart';
import 'services/navigation_service.dart';
import 'views/start_up_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comidinhas',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.grey,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.all(10)),
          ),
        ),
        textTheme: ThemeData.light()
            .textTheme
            .copyWith(
              bodyText1: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              bodyText2: TextStyle(
                fontWeight: FontWeight.w500,
              ),
              headline1: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
              headline2: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              button: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            )
            .apply(
              bodyColor: Colors.black87,
              displayColor: Colors.black87,
            ),
      ),
      home: StartUpView(),
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: generateRoute,
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => DialogManager(child: child),
        ),
      ),
    );
  }
}
