import 'package:injectable/injectable.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/feature/authuntication/data/data_source/auth_remote_ds.dart';
import 'package:movies/feature/authuntication/data/data_source/network/login_api.dart';
import 'package:movies/feature/authuntication/data/models/auth_model_response.dart';
import 'package:movies/feature/authuntication/data/models/login_request.dart';

@Injectable(as: AuthRemoteDS)
class AuthRemoteDSImpl implements AuthRemoteDS {
  @override
  Future<AuthModelResponse> login(LoginRequest request) {
    return getIt<MovieClient>().login(request);
  }
}
