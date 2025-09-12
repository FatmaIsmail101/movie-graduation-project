import 'package:dio/dio.dart';
import 'package:movies/feature/home_screen/modules/movie_details/data/models/movie_details_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'movie_details_api.g.dart';

@RestApi(baseUrl: "https://yts.mx/api/v2/")
abstract class MovieDetailsApi {
  factory MovieDetailsApi(Dio dio, {String? baseUrl}) = _MovieDetailsApi;

  @GET('movie_details.json')
  Future<MovieDetailsResponse> getMovieDetails(
    @Query("movie_id") int movieId,
    @Query("with_images") bool withImages,
    @Query("with_cast") bool withCast,
  );
}
