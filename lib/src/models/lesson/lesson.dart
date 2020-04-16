import 'package:json_annotation/json_annotation.dart';
part 'lesson.g.dart';

@JsonSerializable(nullable: false)
class Lesson {
  @JsonKey(name: 'lesson_id')
  final String id;
  @JsonKey(name: 'lesson_code')
  final String code;
  @JsonKey(name: 'lesson_title')
  final String title;
  @JsonKey(name: 'lesson_image')
  final String image;
  @JsonKey(name: 'lesson_descript')
  final String descript;

  Lesson(this.id, this.code, this.title, this.image, this.descript);
  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
  Map<String, dynamic> toJson() => _$LessonToJson(this);
}
