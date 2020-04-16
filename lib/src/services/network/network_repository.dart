import 'package:app_elllo/src/models/category/category.dart';
import 'package:app_elllo/src/models/lesson/lesson.dart';

abstract class NetWorkRepository {
  Future<List<Category>> getCategory(String category);
  Future<List<Lesson>> getLesson(String code);
}
