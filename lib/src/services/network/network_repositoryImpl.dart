import 'package:app_elllo/src/models/session/session.dart';
import 'package:app_elllo/src/models/lesson/lesson.dart';
import 'package:app_elllo/src/models/course/course.dart';
import 'package:app_elllo/src/services/network/network_api.dart';
import 'package:app_elllo/src/services/network/network_repository.dart';

class NetworkRepositoryImpl with NetWorkRepository {
  NetworkApi _api = new NetworkApi();

  @override
  Future<List<Course>> getCourse(String tabName) {
    return _api.getCourse(tabName);
  }

  @override
  Future<List<Lesson>> getLesson(String url, String id) {
    return _api.getLesson(url, id);
  }

  @override
  Future<List<Session>> getSession(String url, String id) {
    return _api.getSession(url, id);
  }
}
