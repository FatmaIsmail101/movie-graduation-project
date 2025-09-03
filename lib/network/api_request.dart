
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/models/login_api/login_api.dart';
import 'package:movies/network/api_constants.dart';
import 'package:movies/network/end_point.dart';


abstract class ApiRequests {


  static Future<LoginResponse?> login() async {
    final response = await http.post(Uri.https(ApiConstants.baseUrl,
        EndPoints.postLogin));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      LoginResponse loginResponse = LoginResponse.fromJson(data);
      return loginResponse;
    }
    else {
      throw Exception("Login Failed");
    }
  }
}
