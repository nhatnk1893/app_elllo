// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) {
  return Session(
    json['id'] as String,
    json['lessonId'] as String,
    json['title'] as String,
    json['subTitle'] as String,
    json['thumnailUrl'] as String,
  );
}

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'id': instance.id,
      'lessonId': instance.lessonId,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'thumnailUrl': instance.thumnailUrl,
    };
