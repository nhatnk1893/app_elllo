import 'package:app_elllo/src/models/lesson.dart';
import 'package:app_elllo/src/services/lesson/lesson_repository.dart';
import 'package:app_elllo/src/services/lesson/lesson_repositoryImpl.dart';
import 'package:app_elllo/src/template/utils/lesson_item.dart';
import 'package:app_elllo/src/utils/constants_api.dart';
import 'package:flutter/material.dart';

class TabMixer extends StatefulWidget {
  @override
  _TabMixerState createState() => _TabMixerState();
}

class _TabMixerState extends State<TabMixer> {
  LessonRepository _lessonRepo = LessonRepositoryImpl();
  Future<List<Lesson>> mixerData;

  @override
  void initState() {
    super.initState();
    mixerData = _lessonRepo.getDataByTabname(TABMIXER);
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: mixerData,
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
                      tabName: TABMIXER),
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
