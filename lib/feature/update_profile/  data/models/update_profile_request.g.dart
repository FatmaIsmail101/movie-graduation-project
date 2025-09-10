// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequest _$UpdateProfileRequestFromJson(
  Map<String, dynamic> json,
) => UpdateProfileRequest(
  email: json['email'] as String?,
  avaterId: (json['avaterId'] as num?)?.toInt(),
  name: json['name'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$UpdateProfileRequestToJson(
  UpdateProfileRequest instance,
) => <String, dynamic>{
  'email': instance.email,
  'avaterId': instance.avaterId,
  'name': instance.name,
  'phone': instance.phone,
};
