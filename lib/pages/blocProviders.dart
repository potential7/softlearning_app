import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softlearning_app/pages/register/bloc/register_bloc.dart';
import 'package:softlearning_app/pages/sign_in/bloc/signin_blocs.dart';
import 'package:softlearning_app/pages/welcome/blocs/welcome_blocs.dart';

class AppBlocProviders {
  static get allBlocProvider => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
      ];
}
