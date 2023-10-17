import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softlearning_app/common/routes/names.dart';
import 'package:softlearning_app/pages/application/application_page.dart';
import 'package:softlearning_app/pages/application/bloc/app_blocs.dart';
import 'package:softlearning_app/pages/register/bloc/register_bloc.dart';
import 'package:softlearning_app/pages/register/register.dart';
import 'package:softlearning_app/pages/sign_in/bloc/signin_blocs.dart';
import 'package:softlearning_app/pages/sign_in/sign_in.dart';
import 'package:softlearning_app/pages/welcome/blocs/welcome_blocs.dart';
import '../../pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        page: const Welcome(),
        routes: AppRoutes.INITIAL,
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        page: const SignIn(),
        routes: AppRoutes.SIGN_IN,
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntity(
        page: const Register(),
        routes: AppRoutes.REGISTER,
        bloc: BlocProvider(
          create: (_) => RegisterBloc(),
        ),
      ),
      PageEntity(
        page: const ApplicationPage(),
        routes: AppRoutes.APPLICATION,
      bloc: BlocProvider(
        create: (_) => AppBlocs(),
      ),
      ),

    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings){
    if (settings.name!= null){
      var result = routes().where((element) => element.routes == settings.name);
      if (result.isNotEmpty){
        return MaterialPageRoute(builder: (_)=> result.first.page, settings: settings);
      }
    }
   return MaterialPageRoute(builder: (_)=> const SignIn(), settings: settings);
  }
}

class PageEntity {
  String routes;
  Widget page;
  dynamic bloc;

  PageEntity({required this.routes, required this.page, this.bloc}) {}
}
