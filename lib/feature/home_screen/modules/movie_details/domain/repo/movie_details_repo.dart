import 'package:dartz/dartz.dart';
import 'package:movies/core/error_handling/falliures.dart';
import 'package:movies/feature/home_screen/modules/movie_details/data/models/movie_details_response.dart';

abstract class MovieDetailsRepo {
  Future<Either<MovieFailure, MovieDetailsResponse>> call(
    int movieId, {
    bool withImages = true,
    bool withCast = true,
  });
}
