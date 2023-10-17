class RegisterState {
  final String userName;
  final String email;
  final String password;
  final String rePassword;

  RegisterState({this.userName = '',
    this.email = '',
    this.password = '',
    this.rePassword = '',});

  RegisterState copyWith(
      {String? email,
        String? userName,
        String? password,
        String? rePassword }) {
    return RegisterState(
        email: email?? this.email,
        userName: userName?? this.userName,
        password: password?? this.password,
        rePassword: rePassword?? this.rePassword,

    );
  }
}
