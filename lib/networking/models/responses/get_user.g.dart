// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserResponse _$GetUserResponseFromJson(Map<String, dynamic> json) {
  return GetUserResponse(
    User.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetUserResponseToJson(GetUserResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
