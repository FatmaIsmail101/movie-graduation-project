abstract class LoginFailure {
  String? message;

  LoginFailure({this.message = ''});
}

class GeneralFailure extends LoginFailure {
  GeneralFailure({super.message});
}
