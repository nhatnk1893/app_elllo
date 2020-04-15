import 'package:json_annotation/json_annotation.dart';
part 'session.g.dart';

@JsonSerializable(nullable: false)
class Session {
  final String id, lessonId, title, subTitle, thumnailUrl;

  Session(this.id, this.lessonId, this.title, this.subTitle, this.thumnailUrl);

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
