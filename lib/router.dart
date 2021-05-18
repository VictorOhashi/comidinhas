import 'package:flutter/material.dart';

import 'package:comidinhas/views/home_view.dart';

import 'constants/route_names.dart';
import 'views/start_up_view.dart';

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case StartUpRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: StartUpView(),
      );
    case HomeRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
