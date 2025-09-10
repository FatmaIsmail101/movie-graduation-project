import 'package:json_annotation/json_annotation.dart';

part 'update_model_response.g.dart';

@JsonSerializable()
class UpdateModelResponse {
  final String message;

  UpdateModelResponse({required this.message});

  factory UpdateModelResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateModelResponseToJson(this);
}
