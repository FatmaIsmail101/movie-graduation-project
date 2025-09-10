import 'package:dio/dio.dart';
import 'package:movies/feature/update_profile/%20%20data/models/delete_profile_model_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'delete_profile_api.g.dart';

@RestApi(baseUrl: "https://route-movie-apis.vercel.app/")
abstract class DeleteProfileApi {
  factory DeleteProfileApi(Dio dio, {String? baseUrl}) = _DeleteProfileApi;

  @DELETE("profile")
  Future<DeleteProfileModelResponse> deleteProfile(
    @Header('Authorization') String token,
  );
}
