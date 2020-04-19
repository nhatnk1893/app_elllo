import 'package:json_annotation/json_annotation.dart';
part 'chapter_api.g.dart';

@JsonSerializable(nullable: false)
class ChapterApi {
  @JsonKey(name: 'dt_lesson_id')
  final String id;
  @JsonKey(name: 'dt_lesson_mp3')
  final String mp3;
  @JsonKey(name: 'dt_lesson_script')
  final String script;
  @JsonKey(name: 'dt_lesson_voca')
  final String voca;
  @JsonKey(name: 'dt_lesson_quiz')
  final String quiz;
  @JsonKey(name: 'dt_lesson_ans')
  final String ans;

  ChapterApi(this.id, this.mp3, this.script, this.voca, this.quiz, this.ans);

  factory ChapterApi.fromJson(Map<String, dynamic> json) =>
      _$ChapterApiFromJson(json);
  Map<String, dynamic> toJson() => _$ChapterApiToJson(this);
}
