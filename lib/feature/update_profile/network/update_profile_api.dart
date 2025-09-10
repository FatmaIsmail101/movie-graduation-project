import 'package:dio/dio.dart';
import 'package:movies/feature/update_profile/%20%20data/models/update_model_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../  data/models/update_profile_request.dart';

part 'update_profile_api.g.dart';

@RestApi(baseUrl: "https://route-movie-apis.vercel.app/")
abstract class UpdateProfileApi {
  factory UpdateProfileApi(Dio dio, {String? baseUrl}) = _UpdateProfileApi;

  @PATCH("profile")
  Future<UpdateModelResponse> update(
    @Body() UpdateProfileRequest request,
    @Header('Authorization') String token,
  );
}
