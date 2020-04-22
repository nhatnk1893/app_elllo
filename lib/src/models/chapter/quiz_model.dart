import 'package:flutter/material.dart';

class QuizModel {
  String keyQuiz;
  String question;
  List<QuizQuestion> quizQuestion;
  QuizModel({this.keyQuiz, this.question, this.quizQuestion});
}

class QuizQuestion {
  String key;
  String questionName;
  Color color;
  QuizQuestion({this.key, this.questionName, this.color});
}
