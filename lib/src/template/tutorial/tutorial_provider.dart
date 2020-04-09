import 'package:app_elllo/src/models/lesson.dart';
import 'package:app_elllo/src/services/lesson/lesson_repository.dart';
import 'package:app_elllo/src/services/lesson/lesson_repositoryImpl.dart';
import 'package:app_elllo/src/utils/constants_api.dart';
import 'package:flutter/cupertino.dart';

class TutorialProvider extends ChangeNotifier {
  LessonRepository _lessonRepo = LessonRepositoryImpl();
  List<Lesson> list = new List<Lesson>();

  TutorialProvider() {
    fetchData;
  }

  Future<List<Lesson>> get fetchData async {
    list = await _lessonRepo.getLessonsByTab(LESSONSTUTORIAL, 1, LIMIT);
    setLesson(list);
    return list;
  }

  void setLesson(value) async {
    list = value;
    notifyListeners();
  }
}
