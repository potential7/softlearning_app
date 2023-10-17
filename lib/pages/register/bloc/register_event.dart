abstract class RegisterEvent{
  const RegisterEvent();
}

class PasswordEvent extends RegisterEvent{
  final String password;
  const PasswordEvent(this.password);
}
class EmailEvent extends RegisterEvent{
  final String email;
  const EmailEvent(this.email);
}
class UserNameEvent extends RegisterEvent{
  final String userName;
  const UserNameEvent(this.userName);
}
class RePasswordEvent extends RegisterEvent{
  final String rePassword;
  const RePasswordEvent(this.rePassword);
}
