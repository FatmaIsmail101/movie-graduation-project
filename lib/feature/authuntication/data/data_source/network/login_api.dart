import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/feature/home_screen/modules/movie_details/data/models/movie_details_response.dart';
import 'package:movies/feature/home_screen/modules/movie_details/network/movie_details_api.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../update_profile/network/update_profile_api.dart';
import '../../models/auth_model_response.dart';
import '../../models/login_request.dart';

part 'login_api.g.dart';

@RestApi(baseUrl: "https://route-movie-apis.vercel.app/")
abstract class MovieClient {
  factory MovieClient(Dio dio, {String? baseUrl}) = _MovieClient;

  @POST('/auth/login')
  Future<AuthModelResponse> login(@Body() LoginRequest request);

  @GET('movie_details.json')
  Future<MovieDetailsResponse> getMovieDetails(@Query("movie_id") int movieId,
      @Query("with_images") bool withImages, @Query("with_cast") bool withCast);

}

@module
abstract class DioModule {
  Dio get dio => Dio();


  @lazySingleton
  MovieClient loginRequestApi(Dio dio) => MovieClient(dio);


  @lazySingleton
  MovieDetailsApi movieDetailsApi(Dio dio) => MovieDetailsApi(dio);

  @lazySingleton
  UpdateProfileApi updateProfileApi(Dio dio) => UpdateProfileApi(dio);
}
