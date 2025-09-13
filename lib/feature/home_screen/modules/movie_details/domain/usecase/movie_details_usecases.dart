import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/error_handling/falliures.dart';
import 'package:movies/feature/home_screen/modules/movie_details/data/models/movie_details_response.dart';
import 'package:movies/feature/home_screen/modules/movie_details/data/models/suggestion_model_response.dart';
import 'package:movies/feature/home_screen/modules/movie_details/domain/repo/movie_details_repo.dart';
import 'package:movies/feature/home_screen/modules/movie_details/domain/repo/movie_suggestions_repo.dart';

@injectable
class MovieDetailsUseCase {
  MovieDetailsRepo repo;
  MovieSuggestionsRepo movieSuggestionsRepo;

  MovieDetailsUseCase({required this.repo, required this.movieSuggestionsRepo});

  Future<Either<MovieFailure, MovieDetailsResponse>> call(
    int movieId, {
    bool withImages = true,
    bool withCast = true,
  }) {
    return repo.call(movieId, withImages: withImages, withCast: withCast);
  }

  Future<Either<MovieFailure, SuggestionModelResponse>> callSuggestion(
      int movieId) {
    return movieSuggestionsRepo.call(movieId);
  }
}
