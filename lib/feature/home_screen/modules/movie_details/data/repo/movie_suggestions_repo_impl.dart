import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/error_handling/falliures.dart';
import 'package:movies/feature/home_screen/modules/movie_details/data/datasource/movie_suggestions_remote_ds.dart';
import 'package:movies/feature/home_screen/modules/movie_details/data/models/suggestion_model_response.dart';
import 'package:movies/feature/home_screen/modules/movie_details/domain/repo/movie_suggestions_repo.dart';

@Injectable(as: MovieSuggestionsRepo)
class MovieSuggestionsRepoImpl implements MovieSuggestionsRepo {
  final MovieSuggestionsRemoteDs movieSuggestionsRemoteDs;

  MovieSuggestionsRepoImpl(this.movieSuggestionsRemoteDs);

  @override
  Future<Either<MovieFailure, SuggestionModelResponse>> call(
    int movieId,
  ) async {
    try {
      final response = await movieSuggestionsRemoteDs.getMovieSuggestionDS(
        movieId,
      );
      print("response for id $movieId");
      return Right(response);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
