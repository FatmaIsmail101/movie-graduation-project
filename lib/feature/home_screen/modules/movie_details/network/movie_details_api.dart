import 'package:dio/dio.dart';
import 'package:movies/feature/home_screen/modules/home/data/model/movie_list_response.dart';
import 'package:movies/feature/home_screen/modules/movie_details/data/models/movie_details_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../data/models/suggestion_model_response.dart';

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

  @GET('movie_suggestions.json')
  Future<SuggestionModelResponse> getMovieSuggestions(
      @Query("movie_id") int movieId,);

  @GET("list_movies.json")
  Future<MovieListResponse> getMovieList(@Query("limit") int limit,
      @Query("page") int page, @Query("quality") String? quality,
      @Query("minimum_rating") int minimumRating, @Query("query_term") String?
      queryTerm, @Query("genre") String? genre, @Query("sort_by") String sortBy,
      @Query("order_by") String orderBy,
      @Query("with_rt_ratings") bool withRtRatings);
}
