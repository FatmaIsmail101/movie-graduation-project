import 'package:movies/feature/home_screen/modules/movie_details/data/models/suggestion_model_response.dart';

abstract class MovieSuggestionsRemoteDs {
  Future<SuggestionModelResponse> getMovieSuggestionDS(int movieId);
}
