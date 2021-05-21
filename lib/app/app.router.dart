// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../views/create_user_view/create_user_view.dart';
import '../views/home_view/home_view.dart';
import '../views/init_view/init_view.dart';
import '../views/login_user_view/login_user_view.dart';
import '../views/profile_view/profile_view.dart';

class Routes {
  static const String initViewView = '/';
  static const String homeView = '/home-view';
  static const String profileView = '/profile-view';
  static const String loginUserView = '/login-user-view';
  static const String createUserView = '/create-user-view';
  static const all = <String>{
    initViewView,
    homeView,
    profileView,
    loginUserView,
    createUserView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.initViewView, page: InitViewView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.profileView, page: ProfileView),
    RouteDef(Routes.loginUserView, page: LoginUserView),
    RouteDef(Routes.createUserView, page: CreateUserView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    InitViewView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => InitViewView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    ProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileView(),
        settings: data,
      );
    },
    LoginUserView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginUserView(),
        settings: data,
      );
    },
    CreateUserView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CreateUserView(),
        settings: data,
      );
    },
  };
}
