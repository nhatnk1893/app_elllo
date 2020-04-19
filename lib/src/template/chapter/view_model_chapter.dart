import 'dart:convert';

import 'package:app_elllo/src/models/chapter/chapter_api.dart';
import 'package:app_elllo/src/models/chapter/quiz_model.dart';
import 'package:flutter/cupertino.dart';

import '../../services/network/network_repository.dart';
import '../../services/network/network_repositoryImpl.dart';

class ChapterViewModel extends ChangeNotifier {
  NetWorkRepository _repository = NetworkRepositoryImpl();
  ChapterApi chapter;
  List<QuizModel> lstQuizData = new List<QuizModel>();
  bool isLoading = true;

  fetchData(id) async {
    setLoading(true);
    final data = await _repository.getChapter(id);
    getQuiz(data.quiz as dynamic, data.ans as dynamic);
    setData(data);
    setLoading(false);
  }

  getQuiz(dynamic jsonQuiz, dynamic jsonAns) async {
    var quiz = json.decode(jsonQuiz);
    var ans = json.decode(jsonAns);

    var lstQuiz = quiz.values.toList();
    var lstAns = ans.values.toList();

    int countQuiz = lstQuiz.length;
    for (int i = 0; i < countQuiz; i++) {
      String keyQuiz = "data$i";
      String question = quiz[keyQuiz]['quiz'];
      String anwsome = lstAns[i].toString();
      List<QuizQuestion> lstQusestion = new List<QuizQuestion>();
      var quizQuestion = quiz[keyQuiz]['ans'];
      var lstQuestionKey = quizQuestion.keys.toList();
      for (var key in lstQuestionKey) {
        var questionQuiz = quizQuestion[key];
        lstQusestion
            .add(new QuizQuestion(key: key, questionName: questionQuiz));
      }
      lstQuizData.add(new QuizModel(
          keyQuiz: keyQuiz,
          question: question,
          ans: anwsome,
          quizQuestion: lstQusestion));
    }
  }

  void setLoading(value) {
    isLoading = value;
    notifyListeners();
  }

  void setData(value) {
    if (value != null) {
      chapter = value;
    }
    notifyListeners();
  }
}
