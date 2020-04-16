import 'package:app_elllo/src/models/category/category.dart';
import 'package:app_elllo/src/models/lesson/lesson.dart';
import 'package:app_elllo/src/services/network/network_api.dart';
import 'package:app_elllo/src/services/network/network_repository.dart';

class NetworkRepositoryImpl with NetWorkRepository {
  NetworkApi _api = new NetworkApi();

  @override
  Future<List<Lesson>> getLesson(String code) {
    return _api.getLesson(code);
  }

  @override
  Future<List<Category>> getCategory(String category) {
    return _api.getCategory(category);
  }
}
