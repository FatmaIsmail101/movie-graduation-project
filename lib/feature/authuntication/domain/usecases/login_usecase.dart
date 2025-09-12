import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/error_handling/falliures.dart';
import 'package:movies/feature/authuntication/data/models/auth_model_response.dart';
import 'package:movies/feature/authuntication/data/models/login_request.dart';

import '../repositrory/auth_repo.dart';

@injectable
class LoginUseCase {
  AuthRepo repo;

  LoginUseCase(this.repo);

  Future<Either<MovieFailure, AuthModelResponse>> call(LoginRequest request) {
    return repo.login(request);
  }
}
