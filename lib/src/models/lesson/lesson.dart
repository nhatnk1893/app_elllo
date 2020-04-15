import 'package:json_annotation/json_annotation.dart';
part 'lesson.g.dart';

@JsonSerializable(nullable: false)
class Lesson {
  final String id, parentId, title, thumnailUrl, subTitle;

  Lesson(this.id, this.parentId, this.title, this.thumnailUrl, this.subTitle);

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
  Map<String, dynamic> toJson() => _$LessonToJson(this);
}
