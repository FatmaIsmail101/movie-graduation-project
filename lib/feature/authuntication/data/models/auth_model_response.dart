import 'package:json_annotation/json_annotation.dart';

part 'auth_model_response.g.dart';

@JsonSerializable()
class AuthModelResponse {
  final String message;
  final String data;

  AuthModelResponse({required this.message, required this.data});

  /// From JSON
  factory AuthModelResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthModelResponseFromJson(json);

  /// To JSON
  Map<String, dynamic> toJson() => _$AuthModelResponseToJson(this);
}
