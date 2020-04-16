// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return Lesson(
    json['lesson_id'] as String,
    json['lesson_code'] as String,
    json['lesson_title'] as String,
    json['lesson_image'] as String,
    json['lesson_descript'] as String,
  );
}

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'lesson_id': instance.id,
      'lesson_code': instance.code,
      'lesson_title': instance.title,
      'lesson_image': instance.image,
      'lesson_descript': instance.descript,
    };
