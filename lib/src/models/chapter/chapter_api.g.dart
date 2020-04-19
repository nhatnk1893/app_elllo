// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChapterApi _$ChapterApiFromJson(Map<String, dynamic> json) {
  return ChapterApi(
    json['dt_lesson_id'] as String,
    json['dt_lesson_mp3'] as String,
    json['dt_lesson_script'] as String,
    json['dt_lesson_voca'] as String,
    json['dt_lesson_quiz'] as String,
    json['dt_lesson_ans'] as String,
  );
}

Map<String, dynamic> _$ChapterApiToJson(ChapterApi instance) =>
    <String, dynamic>{
      'dt_lesson_id': instance.id,
      'dt_lesson_mp3': instance.mp3,
      'dt_lesson_script': instance.script,
      'dt_lesson_voca': instance.voca,
      'dt_lesson_quiz': instance.quiz,
      'dt_lesson_ans': instance.ans,
    };
