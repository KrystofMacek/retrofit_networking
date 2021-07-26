import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit_networking/networking/models/comment.dart';
import 'package:retrofit_networking/networking/models/meta.dart';
import 'package:retrofit_networking/networking/models/user.dart';
part 'get_comments.g.dart';

@JsonSerializable()
class GetCommentsResponse {
  GetCommentsResponse(this.data);

  final List<Comment> data;

  factory GetCommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCommentsResponseFromJson(json);
}
