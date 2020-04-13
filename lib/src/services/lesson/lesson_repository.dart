import '../../models/lesson.dart';

abstract class LessonRepository {
  Future<List<Lesson>> getDataByTab(String tabName, int page, int limit);
  Future<List<Lesson>> getDataByTabname(String tabName);
}
