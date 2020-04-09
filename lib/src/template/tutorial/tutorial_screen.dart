import 'package:app_elllo/src/models/lesson.dart';
import 'package:app_elllo/src/template/tutorial/tutorial_provider.dart';
import 'package:app_elllo/src/template/utils/lesson_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TutorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TutorialProvider>(
      builder: (BuildContext context, TutorialProvider tutorialProvider,
          Widget child) {
        return Scaffold(
          body: ListView(
            children: <Widget>[
              ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: tutorialProvider.list.length,
                itemBuilder: (BuildContext context, int index) {
                  Lesson lesson = tutorialProvider.list[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: LessonItem(
                      img: lesson.thumnailUrl,
                      title: lesson.title,
                      subTitle: lesson.subTitle,
                      lesson: lesson,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
