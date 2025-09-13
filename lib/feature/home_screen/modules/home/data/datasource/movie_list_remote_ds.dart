import 'package:movies/feature/home_screen/modules/home/data/model/movie_list_response.dart';

abstract class MovieListRemoteDs {
  Future<MovieListResponse> getMovieListDS({
    int limit = 20,
    int page = 1,
    String? quality,
    int minimumRating = 0,
    String? queryTerm,
    String? genre,
    String sortBy = "date_added",
    String orderBy = "desc",
    bool withRtRatings = false,
  });
}
