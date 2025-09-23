import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/error_handling/falliures.dart';
import 'package:movies/feature/authuntication/data/models/auth_model_response.dart';
import 'package:movies/feature/authuntication/data/models/login_request.dart';
import 'package:movies/feature/authuntication/domain/usecases/login_usecase.dart';

import '../../../../core/token_handling/token.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginBtnEvent>((event, emit) async {
      emit(state.copyWith(loginRequestState: RequestState.loading));
      LoginRequest request = LoginRequest(
        email: event.email,
        password: event.password,
      );

      var result = await loginUseCase.call(request);
      result.fold(
        (l) {
          emit(
            state.copyWith(loginRequestState: RequestState.error, failure: l),
          );
          print(l);
        },
        (model) {
          TokenHandler.saveToken(model.data) ;
          emit(
            state.copyWith(
              loginRequestState: RequestState.success,
              authModelResponse: model,
            ),
          );
        },
      );
    });
  }
}
