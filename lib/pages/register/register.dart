import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softlearning_app/pages/register/bloc/register_event.dart';
import 'package:softlearning_app/pages/register/register_controller.dart';
import '../sign_in/widgets/sign_in_widget.dart';
import 'bloc/register_bloc.dart';
import 'bloc/register_state.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: buildAppBar('Sign Up'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child:
                        reuseAbleText(
                            'Enter your details below & SignUp for free')),
                    Container(
                      margin: EdgeInsets.only(top: 25.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reuseAbleText('username'),
                          buildTextField('Enter your username', 'Email', 'user',
                                  (value) {
                                 context.read<RegisterBloc>().add(UserNameEvent(value));
                              }),
                          reuseAbleText('Email'),

                          buildTextField(
                              'Enter your email', 'email', 'user',
                                  (value) {
                                 context.read<RegisterBloc>().add(EmailEvent(value));
                              }),
                          reuseAbleText('Password'),
                          buildTextField(
                              'Enter your password', 'Password', 'lock',
                                  (value) {
                                context.read<RegisterBloc>().add(PasswordEvent(value));
                              }), reuseAbleText('confirm Password'),

                          buildTextField(
                              'Re-Enter your confirm password', 'Password', 'lock',
                                  (value) {
                                context.read<RegisterBloc>().add(RePasswordEvent(value));
                              }), reuseAbleText(
                              'By creating an account you have to\n'
                                  'agree with our terms and conditions'
                          ),

                          buildLoginAndRegButton('Sign Up', 'login', () {
                           RegisterController(context: context).handleRegisterEmail();
                          }),
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
