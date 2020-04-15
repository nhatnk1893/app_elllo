import 'package:json_annotation/json_annotation.dart';
part 'course.g.dart';

@JsonSerializable(nullable: false)
class Course {
  final String id, title, thumnailUrl, subTitle;

  Course({this.id, this.title, this.thumnailUrl, this.subTitle});

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
