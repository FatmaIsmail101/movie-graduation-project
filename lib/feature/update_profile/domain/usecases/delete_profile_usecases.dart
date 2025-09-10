import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/error_handling/falliures.dart';
import 'package:movies/feature/update_profile/%20%20data/models/delete_profile_model_response.dart';
import 'package:movies/feature/update_profile/domain/repositry/delete_profile_repo.dart';

@injectable
class DeleteProfileUseCase {
  DeleteProfileRepo deleteProfileRepo;

  DeleteProfileUseCase(this.deleteProfileRepo);

  Future<Either<LoginFailure, DeleteProfileModelResponse>>
  callDeleteProfile() async {
    return await deleteProfileRepo.deleteProfile();
  }
}
