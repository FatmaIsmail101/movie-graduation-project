import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/error_handling/falliures.dart';
import 'package:movies/feature/update_profile/domain/repositry/delete_profile_repo.dart';

import '../../../../core/cache/cashe_helper.dart';
import '../data_source/delete_profile_remote_ds.dart';

@Injectable(as: DeleteProfileRepo)
class DeleteProfileRepoImpl implements DeleteProfileRepo {
  final DeleteProfileRemoteDS deleteRemoteDS;

  DeleteProfileRepoImpl(this.deleteRemoteDS);

  @override
  Future<Either<MovieFailure, void>> deleteProfile() async {
    try {
      final token = CacheHelper.getString("token") ?? "";
      await deleteRemoteDS.deleteProfile(token);
      return Right(null);
    } catch (e, stackTrace) {
      print('DeleteProfileRepoImpl error: $e');
      print(stackTrace);
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
