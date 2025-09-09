// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModelResponse _$AuthModelResponseFromJson(Map<String, dynamic> json) =>
    AuthModelResponse(
      message: json['message'] as String,
      data: json['data'] as String,
    );

Map<String, dynamic> _$AuthModelResponseToJson(AuthModelResponse instance) =>
    <String, dynamic>{'message': instance.message, 'data': instance.data};
