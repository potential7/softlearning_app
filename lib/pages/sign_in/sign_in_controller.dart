import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softlearning_app/common/widget/flutter_toast.dart';
import 'package:softlearning_app/pages/application/application_page.dart';
import 'package:softlearning_app/pages/sign_in/bloc/signin_blocs.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context
            .read<SignInBloc>()
            .state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {

          toastInfo(msg: 'You need to fill in your email Address');
          return;
        }
        if (password.isEmpty) {

          toastInfo(msg: 'You need to fill in your password');
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
              email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(msg: 'User don\'t exist');
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: 'You need to verify your email');
            return;
          }

          var user = credential.user;
          if (user != null) {
            //we got verified user from firebase
            Navigator.of(context).pushNamedAndRemoveUntil('/application', (route) => false);
          } else {
            toastInfo(msg: 'You are not a user of this App');
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: 'No user found for that email');
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: 'wrong password for this email');
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: 'invalid email Address');
          }
        }
      }
    } catch (e) {}
  }
}