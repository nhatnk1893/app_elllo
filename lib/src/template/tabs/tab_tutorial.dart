import 'package:app_elllo/src/models/lesson.dart';
import 'package:app_elllo/src/services/lesson/lesson_repository.dart';
import 'package:app_elllo/src/services/lesson/lesson_repositoryImpl.dart';
import 'package:app_elllo/src/template/utils/lesson_item.dart';
import 'package:app_elllo/src/utils/constants_api.dart';
import 'package:flutter/material.dart';

class TabTutorial extends StatefulWidget {
  @override
  _TabTutorialState createState() => _TabTutorialState();
}

class _TabTutorialState extends State<TabTutorial> {
  LessonRepository _lessonRepo = LessonRepositoryImpl();
  Future<List<Lesson>> tutorialData;

  @override
  void initState() {
    super.initState();
    tutorialData = _lessonRepo.getDataByTabname(TABTUTORIAL);
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: tutorialData,
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
                      tabName: TABTUTORIAL),
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
