import 'package:comidinhas/services/image_services.dart';
import 'package:comidinhas/views/form_receita_view/form_receita_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:comidinhas/services/receita_services.dart';
import 'package:comidinhas/services/user_services.dart';
import 'package:comidinhas/views/create_user_view/create_user_view.dart';
import 'package:comidinhas/views/home_view/home_view.dart';
import 'package:comidinhas/views/init_view/init_view.dart';
import 'package:comidinhas/views/login_user_view/login_user_view.dart';
import 'package:comidinhas/views/no_user_view/no_user_view.dart';
import 'package:comidinhas/views/profile_view/profile_view.dart';
import 'package:comidinhas/views/receita_view/receita_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: InitViewView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: NoUserView),
    MaterialRoute(page: LoginUserView),
    MaterialRoute(page: CreateUserView),
    MaterialRoute(page: ReceitaView),
    MaterialRoute(page: FormReceitaView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: ReceitaService),
    LazySingleton(classType: ImageService),
    Singleton(classType: FirebaseAuthenticationService),
  ],
  logger: StackedLogger(),
)
class AppSetup {}
