import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit_networking/networking/models/pagination.dart';
part 'meta.g.dart';

@JsonSerializable()
class Meta {
  Meta(this.pagination);

  final Pagination pagination;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
