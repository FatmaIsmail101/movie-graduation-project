import 'package:dartz/dartz.dart';
import 'package:movies/feature/update_profile/%20%20data/models/update_model_response.dart';
import 'package:movies/feature/update_profile/%20%20data/models/update_profile_request.dart';

import '../../../../core/error_handling/falliures.dart';

abstract class UpdateProfileRepo {
  Future<Either<LoginFailure, UpdateModelResponse>> update(
    UpdateProfileRequest request,
  );
}
