import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  User(
    this.id,
    this.name,
    this.email,
    this.gender,
    this.status,
  );

  final int id;
  final String name;
  final String email;
  final String gender;
  final String status;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
