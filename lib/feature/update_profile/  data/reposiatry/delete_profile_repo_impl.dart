import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/error_handling/falliures.dart';
import 'package:movies/feature/update_profile/%20%20data/models/delete_profile_model_response.dart';
import 'package:movies/feature/update_profile/domain/repositry/delete_profile_repo.dart';

import '../data_source/delete_profile_remote_ds.dart';

@Injectable(as: DeleteProfileRepo)
class DeleteProfileRepoImpl implements DeleteProfileRepo {
  final DeleteProfileRemoteDS deleteRemoteDS;

  DeleteProfileRepoImpl(this.deleteRemoteDS);

  @override
  Future<Either<MovieFailure, DeleteProfileModelResponse>>
  deleteProfile() async {
    try {
      var response = await deleteRemoteDS.deleteProfile();
      return Right(response);
    } catch (e, stackTrace) {
      print('DeleteProfileRepoImpl error: $e');
      print(stackTrace);
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
