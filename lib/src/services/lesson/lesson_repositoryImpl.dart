import '../../models/lesson.dart';
import 'lesson_repository.dart';
import 'lessong_api.dart';

class LessonRepositoryImpl with LessonRepository {
  LessonApi lessonApi = LessonApi();
  @override
  Future<List<Lesson>> getDataByTab(String tabName, int page, int limit) {
    return lessonApi.getLessonByTabNamePage(tabName, page, limit);
  }

  @override
  Future<List<Lesson>> getDataByTabname(String tabName) {
    return lessonApi.getLessonByTabName(tabName);
  }
}
