import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/error_handling/falliures.dart';
import 'package:movies/feature/home_screen/modules/movie_details/data/models/movie_details_response.dart';
import 'package:movies/feature/home_screen/modules/movie_details/domain/repo/movie_details_repo.dart';

@injectable
class MovieDetailsUseCase {
  MovieDetailsRepo repo;

  MovieDetailsUseCase(this.repo);

  Future<Either<MovieFailure, MovieDetailsResponse>> call(
    int movieId, {
    bool withImages = true,
    bool withCast = true,
  }) {
    return repo.call(movieId, withImages: withImages, withCast: withCast);
  }
}
