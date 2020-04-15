import 'package:app_elllo/src/models/lesson.dart';
import 'package:app_elllo/src/template/tabs/view_model.dart';
import 'package:app_elllo/src/template/utils/lesson_item.dart';
import 'package:app_elllo/src/utils/constants_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabAudio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TabViewModel>(builder:
        (BuildContext context, TabViewModel tabViewModel, Widget child) {
      return Scaffold(
        body: tabViewModel.isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: tabViewModel.audioDataLst.length,
                itemBuilder: (BuildContext context, int index) {
                  Lesson lesson = tabViewModel.audioDataLst[index];
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
              ),
      );
    });
  }
}
