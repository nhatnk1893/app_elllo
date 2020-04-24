import 'package:app_elllo/src/models/category/category.dart';
import 'package:app_elllo/src/models/tab.dart';
import 'package:app_elllo/src/services/network/network_repository.dart';
import 'package:app_elllo/src/services/network/network_repositoryImpl.dart';
import 'package:app_elllo/src/utils/constants.dart';
import 'package:flutter/cupertino.dart';

class TabViewModel extends ChangeNotifier {
  NetWorkRepository _repository = NetworkRepositoryImpl();

  List<Category> listCategoryAudio = [];
  List<Category> listCategoryVideo = [];

  bool isLoading = true;

  TabViewModel() {
    fetchData();
  }

  fetchData() async {
    setLoading(true);
    for (var tab in tabs) {
      tab.title == CategoryName.CATEGORY_AUDIO
          ? setVideoData(await _repository.getCategory(tab.value))
          : setAudioData(await _repository.getCategory(tab.value));
    }
    setLoading(false);
  }

  refreshData(tab) async {
    setLoading(true);
    tab == CategoryName.CATEGORY_AUDIO
        ? setVideoData(await _repository.getCategory(tab))
        : setAudioData(await _repository.getCategory(tab));
    setLoading(false);
  }

  void setLoading(value) async {
    isLoading = await value;
    notifyListeners();
  }

  void setAudioData(value) async {
    if (value != null) {
      listCategoryAudio = value;
    }
    notifyListeners();
  }

  void setVideoData(value) async {
    if (value != null) {
      listCategoryVideo = value;
    }
    notifyListeners();
  }
}
