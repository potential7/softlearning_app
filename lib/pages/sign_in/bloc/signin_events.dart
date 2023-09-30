abstract class SignInEvent{
  const SignInEvent();
}

class PasswordEvent extends SignInEvent{
  final String password;
  const PasswordEvent(this.password);
}
class EmailEvent extends SignInEvent{
  final String email;
  const EmailEvent(this.email);
}