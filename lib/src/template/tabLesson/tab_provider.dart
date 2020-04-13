// import 'package:app_elllo/src/models/lesson.dart';
// import 'package:app_elllo/src/models/tab.dart';
// import 'package:app_elllo/src/services/lesson/lesson_repository.dart';
// import 'package:app_elllo/src/services/lesson/lesson_repositoryImpl.dart';
// import 'package:app_elllo/src/utils/constants_api.dart';
// import 'package:flutter/material.dart';

// class TabProvider extends ChangeNotifier {
//   LessonRepository _lessonRepo = LessonRepositoryImpl();
//   List<Lesson> list = new List<Lesson>();
//   int _tabIndex = 0;
//   int get tabIndex => _tabIndex;
//   bool isLoading = true;

//   TabProvider() {
//     fetchData;
//   }

//   Future<List<Lesson>> get fetchData async {
//     String valueIndex = tabs[_tabIndex].value;
//     setLoading(true);
//     list = await _lessonRepo.getLessonsByTab(valueIndex, 1, LIMIT);
//     setLesson(list);
//     setLoading(false);
//     return list;
//   }

//   void updateLesson(value) async {
//     cleanOldLesson();
//     String valueIndex = tabs[_tabIndex].value;
//     setLoading(true);
//     setTabIndex(value);
//     list = await _lessonRepo.getLessonsByTab(valueIndex, 1, LIMIT);
//     setLesson(list);
//     setLoading(false);
//   }

//   void setLoading(value) async {
//     isLoading = value;
//     notifyListeners();
//   }

//   void setLesson(value) async {
//     list = value;
//     notifyListeners();
//   }

//   void cleanOldLesson() async {
//     list = [];
//     notifyListeners();
//   }

//   void setTabIndex(value) async {
//     _tabIndex = value;
//     notifyListeners();
//   }
// }
