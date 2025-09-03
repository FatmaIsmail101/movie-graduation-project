import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/network/api_constants.dart';

import 'end_point.dart';

abstract class ApiRequests {
  static Future<String?> login(String email, String password) async {
    final url = Uri.parse(EndPoints.postLogin);
    final response = await http.post(
      url,
      headers: {'anonKey': ApiConstants.apiKey, 'url': ApiConstants.baseUrl},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['access_token'];
      print("Login Successfully");
      print("Access token: ${data['access_token']}");
      return token;
    } else {
      print("Login failed :${response.body}");
      return null;
    }
  }
}
