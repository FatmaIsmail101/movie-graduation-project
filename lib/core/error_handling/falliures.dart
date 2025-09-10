abstract class LoginFailure {
  String? message;

  LoginFailure({this.message = ''});

  String toString() => message ?? 'Unknown failure';
}

class GeneralFailure extends LoginFailure {
  GeneralFailure({super.message});
}
