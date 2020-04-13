import 'package:app_elllo/src/models/lesson.dart';
import 'package:app_elllo/src/services/lesson/lesson_repository.dart';
import 'package:app_elllo/src/services/lesson/lesson_repositoryImpl.dart';
import 'package:app_elllo/src/template/utils/lesson_item.dart';
import 'package:app_elllo/src/utils/constants_api.dart';
import 'package:flutter/material.dart';

class TabAudio extends StatefulWidget {
  @override
  _TabAudioState createState() => _TabAudioState();
}

class _TabAudioState extends State<TabAudio> {
  LessonRepository _lessonRepo = LessonRepositoryImpl();
  Future<List<Lesson>> audioData;

  @override
  void initState() {
    super.initState();
    audioData = _lessonRepo.getDataByTabname(TABAUDIO);
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: audioData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Lesson lesson = snapshot.data[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: LessonItem(
                      img: lesson.thumnailUrl,
                      title: lesson.title,
                      subTitle: lesson.subTitle,
                      lesson: lesson,
                      tabName: TABAUDIO),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }
}
