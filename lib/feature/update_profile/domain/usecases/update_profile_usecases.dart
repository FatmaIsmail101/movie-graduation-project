import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/feature/update_profile/%20%20data/models/update_model_response.dart';
import 'package:movies/feature/update_profile/%20%20data/models/update_profile_request.dart';
import 'package:movies/feature/update_profile/domain/repositry/update_profile_repo.dart';

import '../../../../core/error_handling/falliures.dart';

@injectable
class UpdateProfileUseCases {
  UpdateProfileRepo updateProfileRepo;

  UpdateProfileUseCases(this.updateProfileRepo);

  Future<Either<LoginFailure, UpdateModelResponse>> updateCall(
    UpdateProfileRequest request,
  ) {
    return updateProfileRepo.update(request);
  }
}
