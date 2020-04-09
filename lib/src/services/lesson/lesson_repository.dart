import '../../models/lesson.dart';

abstract class LessonRepository {
  Future<List<Lesson>> getLessonsByTab(String tabName, int page, int limit);
}
