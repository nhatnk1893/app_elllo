import 'package:json_annotation/json_annotation.dart';

class QuizModel {
  String keyQuiz;
  String question;
  String ans;
  List<QuizQuestion> quizQuestion;

  QuizModel({this.keyQuiz, this.question, this.ans, this.quizQuestion});
}

class QuizQuestion {
  String key;
  String questionName;
  QuizQuestion({this.key, this.questionName});
}
