import 'package:movies/feature/authuntication/data/models/auth_model_response.dart';
import 'package:movies/feature/authuntication/data/models/login_request.dart';

abstract class AuthRemoteDS {
  Future<AuthModelResponse> login(LoginRequest request);
}
