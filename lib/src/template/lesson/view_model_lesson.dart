import 'package:app_elllo/src/models/lesson/lesson.dart';
import 'package:app_elllo/src/services/network/network_repository.dart';
import 'package:app_elllo/src/services/network/network_repositoryImpl.dart';
import 'package:flutter/cupertino.dart';

class LessonViewModel extends ChangeNotifier {
  NetWorkRepository _repository = NetworkRepositoryImpl();
  List<Lesson> lstLesson = [];
  bool isLoading = true;

  fetchData(url, id) async {
    setLoading(true);
    final data = await _repository.getLesson(url, id);
    setDataLesson(data);
    setLoading(false);
  }

  void setLoading(value) {
    isLoading = value;
    notifyListeners();
  }

  void setDataLesson(value) {
    if (value != null) {
      lstLesson = value;
    }
    notifyListeners();
  }
}
