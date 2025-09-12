import 'package:dartz/dartz.dart';
import 'package:movies/core/error_handling/falliures.dart';
import 'package:movies/feature/authuntication/data/models/auth_model_response.dart';
import 'package:movies/feature/authuntication/data/models/login_request.dart';

abstract class AuthRepo {
  Future<Either<MovieFailure, AuthModelResponse>> login(LoginRequest request);
}
