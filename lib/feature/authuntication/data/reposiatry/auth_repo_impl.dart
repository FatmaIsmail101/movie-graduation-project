import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/error_handling/falliures.dart';
import 'package:movies/feature/authuntication/data/data_source/auth_remote_ds.dart';
import 'package:movies/feature/authuntication/data/models/auth_model_response.dart';
import 'package:movies/feature/authuntication/data/models/login_request.dart';
import 'package:movies/feature/authuntication/domain/repositrory/auth_repo.dart';

import '../../../../core/cache/cashe_helper.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRemoteDS authRemoteDS;

  AuthRepoImpl(this.authRemoteDS);

  @override
  Future<Either<MovieFailure, AuthModelResponse>> login(
    LoginRequest request,
  ) async {
    try {
      var response = await authRemoteDS.login(request);
      CacheHelper.saveString("token", response.data);
      return Right(response);
    } catch (e) {
      return Left(GeneralFailure(message: "Erooorrrrrrrr"));
    }
  }
}
