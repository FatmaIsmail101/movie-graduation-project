import 'package:movies/feature/home_screen/modules/movie_details/data/models/movie_details_response.dart';

abstract class MovieDetailsRemoteDS {
  Future<MovieDetailsResponse> getMovieDetailsDS(
    int movieId, {
    bool withImages = true,
    bool withCast = true,
  });
}
