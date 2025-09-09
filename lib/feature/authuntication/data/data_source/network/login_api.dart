import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../models/auth_model_response.dart';
import '../../models/login_request.dart';

part 'login_api.g.dart';

@RestApi(baseUrl: "https://route-movie-apis.vercel.app/")
abstract class LoginRequestApi {
  factory LoginRequestApi(Dio dio, {String? baseUrl}) = _LoginRequestApi;

  @POST('/auth/login')
  Future<AuthModelResponse> login(@Body() LoginRequest request);
}

@module
abstract class DioModule {
  Dio get dio => Dio();

  @lazySingleton
  LoginRequestApi loginRequestApi(Dio dio) => LoginRequestApi(dio);
}
