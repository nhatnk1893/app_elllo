import 'package:json_annotation/json_annotation.dart';
part 'lesson.g.dart';

@JsonSerializable(nullable: false)
class Lesson {
  final int id;
  final String title, thumnailUrl, subTitle;

  Lesson({this.id, this.title, this.thumnailUrl, this.subTitle});

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
  Map<String, dynamic> toJson() => _$LessonToJson(this);
}
