// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return Pagination(
    json['total'] as int,
    json['pages'] as int,
    json['page'] as int,
    json['limit'] as int,
    Links.fromJson(json['links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pages': instance.pages,
      'page': instance.page,
      'limit': instance.limit,
      'links': instance.links,
    };
