import 'package:app_elllo/src/models/course/course.dart';
import 'package:app_elllo/src/models/tab.dart';
import 'package:app_elllo/src/services/network/network_repository.dart';
import 'package:app_elllo/src/services/network/network_repositoryImpl.dart';
import 'package:app_elllo/src/utils/constants_api.dart';
import 'package:flutter/cupertino.dart';

class TabViewModel extends ChangeNotifier {
  NetWorkRepository _repository = NetworkRepositoryImpl();

  List<Course> tutorialDataLst = [];
  List<Course> levelDataLst = [];
  List<Course> audioDataLst = [];
  List<Course> videoDataLst = [];
  List<Course> mixerDataLst = [];

  bool isLoading = true;
  int tabIndex = 0;

  TabViewModel() {
    fetchData();
  }

  fetchData() async {
    setLoading(true);
    String tabName = tabs[tabIndex].value;
    final data = await _repository.getCourse(tabName);
    switch (tabName) {
      case TABTUTORIAL:
        setTutorialData(data);
        break;
      case TABLEVEL:
        setLevelData(data);
        break;
      case TABAUDIO:
        setAudioData(data);
        break;
      case TABVIDEO:
        setVideoData(data);
        break;
      case TABMIXER:
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
      tutorialDataLst = value;
    }
    notifyListeners();
  }

  void setLevelData(value) async {
    if (value != null) {
      levelDataLst = value;
    }
    notifyListeners();
  }

  void setAudioData(value) async {
    if (value != null) {
      audioDataLst = value;
    }
    notifyListeners();
  }

  void setVideoData(value) async {
    if (value != null) {
      videoDataLst = value;
    }
    notifyListeners();
  }

  void setMixerData(value) async {
    if (value != null) {
      mixerDataLst = value;
    }
    notifyListeners();
  }
}
