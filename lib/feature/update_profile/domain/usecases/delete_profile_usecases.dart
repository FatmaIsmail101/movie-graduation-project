import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/error_handling/falliures.dart';
import 'package:movies/feature/update_profile/domain/repositry/delete_profile_repo.dart';

@injectable
class DeleteProfileUseCase {
  DeleteProfileRepo deleteProfileRepo;

  DeleteProfileUseCase(this.deleteProfileRepo);

  Future<Either<MovieFailure, void>> callDeleteProfile() async {
    return await deleteProfileRepo.deleteProfile();
  }
}
