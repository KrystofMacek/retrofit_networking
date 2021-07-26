import 'package:json_annotation/json_annotation.dart';
part 'comment.g.dart';

@JsonSerializable()
class Comment {
  Comment(
    this.id,
    this.postId,
    this.name,
    this.email,
    this.body,
  );

  final int id;
  @JsonKey(name: 'post_id')
  final int postId;
  final String name;
  final String email;
  final String body;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
