// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return Lesson(
    id: json['id'] as int,
    title: json['title'] as String,
    thumnailUrl: json['thumnailUrl'] as String,
    subTitle: json['subTitle'] as String,
  );
}

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumnailUrl': instance.thumnailUrl,
      'subTitle': instance.subTitle,
    };
