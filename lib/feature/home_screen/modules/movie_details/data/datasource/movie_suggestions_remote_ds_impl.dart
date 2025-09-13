import 'package:injectable/injectable.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/feature/home_screen/modules/movie_details/data/datasource/movie_suggestions_remote_ds.dart';
import 'package:movies/feature/home_screen/modules/movie_details/data/models/suggestion_model_response.dart';
import 'package:movies/feature/home_screen/modules/movie_details/network/movie_details_api.dart';

@Injectable(as: MovieSuggestionsRemoteDs)
class MovieSuggestionsRemoteDsImpl implements MovieSuggestionsRemoteDs {
  @override
  Future<SuggestionModelResponse> getMovieSuggestionDS(int movieId) async {
    // TODO: implement getMovieSuggestionDS
    print("RemoteDSImpl: $movieId");
    final response = await getIt<MovieDetailsApi>().getMovieSuggestions(
      movieId,
    );
    return response;
  }
}
