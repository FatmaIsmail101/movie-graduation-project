part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginBtnEvent extends LoginEvent {
  String email;
  String password;

  LoginBtnEvent(this.email, this.password);
}
