import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softlearning_app/common/values/colors.dart';
// import 'package:softlearning_app/pages/application/application_page.dart';
// import 'package:softlearning_app/pages/blocProviders.dart';
// import 'package:softlearning_app/pages/register/register.dart';
// import 'package:softlearning_app/pages/sign_in/bloc/signin_blocs.dart';
// import 'package:softlearning_app/pages/sign_in/sign_in.dart';
// import 'package:softlearning_app/pages/welcome/blocs/welcome_blocs.dart';
// import 'package:softlearning_app/pages/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'common/routes/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: AppColors.primaryText,
              ),
              color: Colors.white,
              elevation: 0,
            ),
          ),
          onGenerateRoute: AppPages.GenerateRouteSettings,
        ),
      ),
    );
  }
}
