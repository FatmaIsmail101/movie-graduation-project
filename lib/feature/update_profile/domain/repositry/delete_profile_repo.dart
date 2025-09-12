import 'package:dartz/dartz.dart';
import 'package:movies/core/error_handling/falliures.dart';
import 'package:movies/feature/update_profile/%20%20data/models/delete_profile_model_response.dart';

abstract class DeleteProfileRepo {
  Future<Either<MovieFailure, DeleteProfileModelResponse>> deleteProfile();
}
