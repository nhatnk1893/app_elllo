import 'package:app_elllo/src/models/category/category.dart';
import 'package:app_elllo/src/models/tab.dart';
import 'package:app_elllo/src/services/network/network_repository.dart';
import 'package:app_elllo/src/services/network/network_repositoryImpl.dart';
import 'package:flutter/cupertino.dart';

class TabViewModel extends ChangeNotifier {
  NetWorkRepository _repository = NetworkRepositoryImpl();

  List<Category> listCategoryAudio = [];
  List<Category> listCategoryVideo = [];

  bool isLoading = true;
  int tabIndex = 0;

  TabViewModel() {
    fetchData();
  }

  fetchData() async {
    setLoading(true);
    String tabName = tabs[tabIndex].title.toLowerCase();
    final data = await _repository.getCategory(tabName);
    switch (tabName) {
      case "audio":
        setAudioData(data);
        break;
      case "video":
        setVideoData(data);
        break;
      default:
        setAudioData(data);
        break;
    }
    setLoading(false);
  }

  void setTabIndex(value) async {
    tabIndex = value;
    notifyListeners();
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
