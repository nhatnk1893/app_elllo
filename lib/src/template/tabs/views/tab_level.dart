import 'package:app_elllo/src/models/lesson.dart';
import 'package:app_elllo/src/template/tabs/view_model.dart';
import 'package:app_elllo/src/template/tabs/view_model1.dart';
import 'package:app_elllo/src/template/utils/fetch_fail.dart';
import 'package:app_elllo/src/template/utils/lesson_item.dart';
import 'package:app_elllo/src/utils/constants_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabLevel extends StatefulWidget {
  @override
  _TabLevelState createState() => _TabLevelState();
}

class _TabLevelState extends State<TabLevel> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TabViewModel1>(builder:
        (BuildContext context, TabViewModel1 tabViewModel, Widget child) {
      return Scaffold(
        body: tabViewModel.isLoading
            ? Center(child: CircularProgressIndicator())
            : tabViewModel.levelDataLst.isEmpty
                ? FailApi()
                : ListView.builder(
                    padding:
                        EdgeInsets.symmetric(horizontal: 13, vertical: 8.0),
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: tabViewModel.levelDataLst.length,
                    itemBuilder: (BuildContext context, int index) {
                      Lesson lesson = tabViewModel.levelDataLst[index];
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 8),
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
