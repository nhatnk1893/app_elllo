// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return Lesson(
    json['id'] as String,
    json['parentId'] as String,
    json['title'] as String,
    json['thumnailUrl'] as String,
    json['subTitle'] as String,
  );
}

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'title': instance.title,
      'thumnailUrl': instance.thumnailUrl,
      'subTitle': instance.subTitle,
    };
