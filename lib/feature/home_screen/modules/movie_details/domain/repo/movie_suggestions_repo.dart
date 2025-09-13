import 'package:dartz/dartz.dart';
import 'package:movies/core/error_handling/falliures.dart';
import 'package:movies/feature/home_screen/modules/movie_details/data/models/suggestion_model_response.dart';

abstract class MovieSuggestionsRepo {
  Future<Either<MovieFailure, SuggestionModelResponse>> call(int movieId);
}
