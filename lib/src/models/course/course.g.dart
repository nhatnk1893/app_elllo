// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) {
  return Course(
    id: json['id'] as String,
    title: json['title'] as String,
    thumnailUrl: json['thumnailUrl'] as String,
    subTitle: json['subTitle'] as String,
  );
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumnailUrl': instance.thumnailUrl,
      'subTitle': instance.subTitle,
    };
