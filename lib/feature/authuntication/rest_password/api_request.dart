import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../home_screen/core/network/api_constants.dart';
import 'end_point1.dart';

abstract class ApiRequests {
  static Future<String?> login(String email, String password) async {
    final url = Uri.parse(ApiConstants.baseUrl + EndPoints.postLogin);

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final token = data['data'];
      await saveToken(token);
      print("Login Successfully");
      print("Access token: ${data['access_token']}");
      return token;
    } else {
      print("Login failed :${response.body}");
      return null;
    }
  }

  static Future<String?> resetPassword(
    String oldPassword,
    String newPassword,
  ) async {
    final url = Uri.parse(ApiConstants.baseUrl + EndPoints.resetPassword);
    var token = await getToken();
    final response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      }),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("password reseted Successfully");
      return data['message'];
    } else {
      print("failed to reset password :${response.body}");
      return null;
    }
  }

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
}
