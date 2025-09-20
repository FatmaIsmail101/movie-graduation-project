import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/cache/cashe_helper.dart';
import 'package:movies/core/error_handling/falliures.dart';
import 'package:movies/feature/update_profile/%20%20data/data_source/update_remote_ds.dart';
import 'package:movies/feature/update_profile/%20%20data/models/update_model_response.dart';
import 'package:movies/feature/update_profile/%20%20data/models/update_profile_request.dart';

import '../../domain/repositry/update_profile_repo.dart';

@Injectable(as: UpdateProfileRepo)
class UpdateProfileRepoImpl implements UpdateProfileRepo {
  UpdateRemoteDS updateRemoteDS;
  UpdateProfileRepoImpl(this.updateRemoteDS);
  @override
  Future<Either<MovieFailure, UpdateModelResponse>> update(
    UpdateProfileRequest request,
  ) async {
    try {
      final token = CacheHelper.getString("token") ?? '';
      print("Token before API call : $token");
      print(CacheHelper.getString("token"));
      var response = await updateRemoteDS.updateDS(request, token);
      print("============Request Repo Impl==========$request");
      return Right(response);
    } catch (e, stackTrace) {
      print('UpdateProfileRepoImpl error: $e');
      print(stackTrace);
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
