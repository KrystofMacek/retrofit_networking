// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCommentsResponse _$GetCommentsResponseFromJson(Map<String, dynamic> json) {
  return GetCommentsResponse(
    (json['data'] as List<dynamic>)
        .map((e) => Comment.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GetCommentsResponseToJson(
        GetCommentsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
