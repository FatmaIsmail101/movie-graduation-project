class LoginRequest {
  final String email;
  final String passsword;

  LoginRequest({required this.email, required this.passsword});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      LoginRequest(email: json['email'], passsword: json['passsword']);
}

class LoginResponse {
  final String message;
  final String data;

  LoginResponse({required this.message, required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      LoginResponse(message: json['message'], data: json['data']);
}
