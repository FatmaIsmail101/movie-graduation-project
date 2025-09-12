part of 'login_bloc.dart';

class LoginState {
  final RequestState? loginRequestState;
  final AuthModelResponse? authModelResponse;
  final MovieFailure? failure;

  LoginState({this.loginRequestState, this.authModelResponse, this.failure});

  LoginState copyWith({
    RequestState? loginRequestState,
    AuthModelResponse? authModelResponse,
    MovieFailure? failure,
  }) {
    return LoginState(
      loginRequestState: loginRequestState ?? this.loginRequestState,
      authModelResponse: authModelResponse ?? this.authModelResponse,
      failure: failure ?? this.failure,
    );
  }
}

class LoginInitial extends LoginState {
  LoginInitial() : super(loginRequestState: RequestState.init);
}

enum RequestState { init, loading, success, error }
