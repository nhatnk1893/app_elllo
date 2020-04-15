import 'package:app_elllo/src/models/course/course.dart';
import 'package:app_elllo/src/models/lesson/lesson.dart';
import 'package:app_elllo/src/models/session/session.dart';

abstract class NetWorkRepository {
  Future<List<Course>> getCourse(String tabName);
  Future<List<Lesson>> getLesson(String url, String id);
  Future<List<Session>> getSession(String url, String id);
}
