import 'package:app_elllo/src/models/lesson.dart';
import 'package:app_elllo/src/services/lesson/lesson_repository.dart';
import 'package:app_elllo/src/services/lesson/lesson_repositoryImpl.dart';
import 'package:app_elllo/src/utils/constants_api.dart';
import 'package:flutter/cupertino.dart';

class TabViewModel1 extends ChangeNotifier {
  LessonRepository _lessonRepository = LessonRepositoryImpl();

  List<Lesson> tutorialDataLst = new List<Lesson>();
  List<Lesson> levelDataLst = new List<Lesson>();
  List<Lesson> audioDataLst = new List<Lesson>();
  List<Lesson> videoDataLst = new List<Lesson>();
  List<Lesson> mixerDataLst = new List<Lesson>();

  bool isLoading = true;
  int tabIndex = 0;

  TabViewModel1() {
    fetchData();
  }

  fetchData() async {
    setLoading(true);
    final tutorial = await _lessonRepository.getDataByTabname(TABLEVEL);

    setLevelData(tutorial);
    // var level = await _lessonRepository.getDataByTabname(TABLEVEL) == null
    //     ? []
    //     : _lessonRepository.getDataByTabname(TABLEVEL);
    // setLevelData(level);
    // var audio = await _lessonRepository.getDataByTabname(TABAUDIO) == null
    //     ? []
    //     : _lessonRepository.getDataByTabname(TABAUDIO);
    // setAudioData(audio);
    // var video = await _lessonRepository.getDataByTabname(TABVIDEO) == null
    //     ? []
    //     : _lessonRepository.getDataByTabname(TABVIDEO);
    // setVideoData(video);
    // var mixer = await _lessonRepository.getDataByTabname(TABMIXER) == null
    //     ? []
    //     : _lessonRepository.getDataByTabname(TABMIXER);
    // setMixerData(mixer);

    setLoading(false);
  }

  void setLoading(value) async {
    isLoading = value;
    notifyListeners();
  }

  void setTutorialData(value) async {
    tutorialDataLst = [];
    if (value != null) {
      tutorialDataLst = value;
    }
    notifyListeners();
  }

  void setLevelData(value) async {
    levelDataLst = value;
    notifyListeners();
  }

  void setAudioData(value) async {
    audioDataLst = value;
    notifyListeners();
  }

  void setVideoData(value) async {
    videoDataLst = value;
    notifyListeners();
  }

  void setMixerData(value) async {
    mixerDataLst = value;
    notifyListeners();
  }
}
