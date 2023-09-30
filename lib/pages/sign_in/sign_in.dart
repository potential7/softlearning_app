import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softlearning_app/pages/sign_in/bloc/signin_blocs.dart';
import 'package:softlearning_app/pages/sign_in/bloc/signin_events.dart';
import 'package:softlearning_app/pages/sign_in/bloc/signin_states.dart';
import 'package:softlearning_app/pages/sign_in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: buildAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context),
                    Center(
                        child:
                            reuseAbleText('Or login with your email address')),
                    Container(
                      margin: EdgeInsets.only(top: 36.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reuseAbleText('Email'),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField('Enter your email', 'Email', 'user',
                              (value) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                          reuseAbleText('Password'),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                              'Enter your password', 'Password', 'lock',
                              (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value));
                          }),
                          forgotPassword(),
                          buildLoginAndRegButton('Log In', 'login', () {}),
                          buildLoginAndRegButton('Register', 'register', () {}),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
