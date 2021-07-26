import 'package:json_annotation/json_annotation.dart';
part 'links.g.dart';

@JsonSerializable()
class Links {
  Links(
    this.previous,
    this.current,
    this.next,
  );

  final dynamic previous;
  final String current;
  final String next;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}
