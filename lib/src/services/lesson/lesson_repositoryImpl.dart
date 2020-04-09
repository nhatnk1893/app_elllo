import 'package:app_elllo/src/services/lesson/lessong_api.dart';

import '../../models/lesson.dart';
import 'lesson_repository.dart';

class LessonRepositoryImpl with LessonRepository {
  LessonApi lessonApi = LessonApi();

  @override
  Future<List<Lesson>> getLessonsByTab(String tabName, int page, int limit) {
    var a = lessonApi.getLessonByTabName(tabName, page, limit);
    return a;
  }
}
