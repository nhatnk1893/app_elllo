import 'package:app_elllo/src/models/lesson.dart';
import 'package:app_elllo/src/models/tab.dart';
import 'package:app_elllo/src/services/lesson/lesson_repository.dart';
import 'package:app_elllo/src/services/lesson/lesson_repositoryImpl.dart';
import 'package:app_elllo/src/utils/constants_api.dart';
import 'package:flutter/cupertino.dart';

class TabProvider extends ChangeNotifier {
  LessonRepository _lessonRepo = LessonRepositoryImpl();
  List<Lesson> list = new List<Lesson>();
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  TabProvider() {
    fetchData;
  }

  Future<List<Lesson>> get fetchData async {
    String valueIndex = tabs[_tabIndex].value;
    list = await _lessonRepo.getLessonsByTab(valueIndex, 1, LIMIT);
    setLesson(list);
    return list;
  }

  void updateLesson(value) async {
    String valueIndex = tabs[_tabIndex].value;
    setTabIndex(value);
    list = await _lessonRepo.getLessonsByTab(valueIndex, 1, LIMIT);
    setLesson(list);
  }

  void setLesson(value) async {
    list = value;
    notifyListeners();
  }

  void setTabIndex(value) async {
    _tabIndex = value;
    notifyListeners();
  }
}
