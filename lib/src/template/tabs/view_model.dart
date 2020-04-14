import 'package:app_elllo/src/models/lesson.dart';
import 'package:app_elllo/src/services/lesson/lesson_repository.dart';
import 'package:app_elllo/src/services/lesson/lesson_repositoryImpl.dart';
import 'package:app_elllo/src/utils/constants_api.dart';
import 'package:flutter/cupertino.dart';

class TabViewModel extends ChangeNotifier {
  LessonRepository _lessonRepository = LessonRepositoryImpl();

  List<Lesson> tutorialDataLst = [];
  List<Lesson> levelDataLst = [];
  List<Lesson> audioDataLst = [];
  List<Lesson> videoDataLst = [];
  List<Lesson> mixerDataLst = [];

  bool isLoading = true;
  int tabIndex = 0;

  TabViewModel() {
    fetchData();
  }

  void fetchData() async {
    setLoading(true);
    var tutorial = await _lessonRepository.getDataByTabname(TABTUTORIAL);
    var level = await _lessonRepository.getDataByTabname(TABLEVEL);
    var audio = await _lessonRepository.getDataByTabname(TABAUDIO);
    var video = await _lessonRepository.getDataByTabname(TABVIDEO);
    var mixer = await _lessonRepository.getDataByTabname(TABMIXER);

    setTutorialData(tutorial);
    setLevelData(level);
    setAudioData(audio);
    setVideoData(video);
    setMixerData(mixer);
  }

  void setLoading(value) async {
    isLoading = value;
    notifyListeners();
  }

  void setTutorialData(value) async {
    if (value == null) {
      tutorialDataLst = [];
    }
    tutorialDataLst = value;
    notifyListeners();
  }

  void setLevelData(value) async {
    if (value == null) {
      levelDataLst = [];
    }
    levelDataLst = value;
    notifyListeners();
  }

  void setAudioData(value) async {
    if (value == null) {
      audioDataLst = [];
    }
    audioDataLst = value;
    notifyListeners();
  }

  void setVideoData(value) async {
    if (value == null) {
      videoDataLst = [];
    }
    videoDataLst = value;
    notifyListeners();
  }

  void setMixerData(value) async {
    if (value == null) {
      mixerDataLst = [];
    }
    mixerDataLst = value;
    notifyListeners();
  }
}
