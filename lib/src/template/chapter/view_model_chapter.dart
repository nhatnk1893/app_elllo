import 'package:flutter/cupertino.dart';

import '../../services/network/network_repository.dart';
import '../../services/network/network_repositoryImpl.dart';

class ChapterViewModel extends ChangeNotifier {
  NetWorkRepository _repository = NetworkRepositoryImpl();
  List<Lesson> lstLesson = [];
  bool isLoading = true;

  fetchData(code) async {
    setLoading(true);
    final data = await _repository.getLesson(code);
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
