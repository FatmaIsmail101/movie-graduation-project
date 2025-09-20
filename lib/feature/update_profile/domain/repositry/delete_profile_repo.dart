import 'package:dartz/dartz.dart';
import 'package:movies/core/error_handling/falliures.dart';

abstract class DeleteProfileRepo {
  Future<Either<MovieFailure, void>> deleteProfile();
}
