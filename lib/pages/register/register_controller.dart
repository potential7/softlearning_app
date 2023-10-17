import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softlearning_app/common/widget/flutter_toast.dart';

import 'bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleRegisterEmail() async {
    final state = context.read<RegisterBloc>().state;
    String username = state.userName;
    String email = state.email;
    String password = state.password;
    String repassword = state.rePassword;

    if (username.isEmpty) {
      toastInfo(msg: 'your username can not be empty');
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: 'your password can not be empty');
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: 'your email can not be empty');
      return;
    }
    if (repassword.isEmpty) {
      toastInfo(msg: 'your password confirmation can not be empty');
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);
        toastInfo(
            msg:
                'An email has been send to your registered email to activate it. '
                    'please check your email box and click to the link');
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: 'password is too weak');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'this email is already in use ');
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: 'this email is invalid ');
      }
    }
  }
}
