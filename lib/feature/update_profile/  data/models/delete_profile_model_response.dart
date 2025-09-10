import 'package:json_annotation/json_annotation.dart';

part 'delete_profile_model_response.g.dart';

@JsonSerializable()
class DeleteProfileModelResponse {
  final String message;

  DeleteProfileModelResponse({required this.message});

  /// Factory method to parse from JSON
  factory DeleteProfileModelResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProfileModelResponseFromJson(json);

  /// Method to convert to JSON
  Map<String, dynamic> toJson() => _$DeleteProfileModelResponseToJson(this);
}
