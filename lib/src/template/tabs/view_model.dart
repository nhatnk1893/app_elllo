import 'package:app_elllo/src/models/category/category.dart';
import 'package:app_elllo/src/models/tab.dart';
import 'package:app_elllo/src/services/network/network_repository.dart';
import 'package:app_elllo/src/services/network/network_repositoryImpl.dart';
import 'package:app_elllo/src/utils/constants.dart';
import 'package:flutter/cupertino.dart';

class TabViewModel extends ChangeNotifier {
  NetWorkRepository _repository = NetworkRepositoryImpl();

  List<Category> listCategoryTutorial = [];
  List<Category> listCategoryLevel = [];
  List<Category> listCategoryAudio = [];
  List<Category> listCategoryVideo = [];
  List<Category> listCategoryMixer = [];

  bool isLoading = true;
  int tabIndex = 0;

  TabViewModel() {
    fetchData();
  }

  fetchData() async {
    setLoading(true);
    String tabName = tabs[2].title.toLowerCase();
    final data = await _repository.getCategory(tabName);
    switch (tabName) {
      case CategoryName.CATEGORY_TUTORIAL:
        setTutorialData(data);
        break;
      case CategoryName.CATEGORY_LEVEL:
        setLevelData(data);
        break;
      case "audio":
        setAudioData(data);
        break;
      case CategoryName.CATEGORY_VIDEO:
        setVideoData(data);
        break;
      case CategoryName.CATEGORY_MIXER:
        setMixerData(data);
        break;
      default:
        setTutorialData(data);
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

  void setTutorialData(value) async {
    if (value != null) {
      listCategoryTutorial = value;
    }
    notifyListeners();
  }

  void setLevelData(value) async {
    if (value != null) {
      listCategoryLevel = value;
    }
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

  void setMixerData(value) async {
    if (value != null) {
      listCategoryMixer = value;
    }
    notifyListeners();
  }
}
