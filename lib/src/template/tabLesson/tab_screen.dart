import 'package:app_elllo/src/models/lesson.dart';
import 'package:app_elllo/src/models/tab.dart';
import 'package:app_elllo/src/template/tabLesson/tab_provider.dart';
import 'package:app_elllo/src/template/utils/lesson_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(
      builder: (BuildContext context, TabProvider tabProvider, Widget child) {
        return Scaffold(
          body: tabProvider.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: <Widget>[
                    ListView.builder(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: tabProvider.list.length,
                      itemBuilder: (BuildContext context, int index) {
                        Lesson lesson = tabProvider.list[index];
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                          child: LessonItem(
                            img: lesson.thumnailUrl,
                            title: lesson.title,
                            subTitle: lesson.subTitle,
                            lesson: lesson,
                            tabValue: tabs[tabProvider.tabIndex].value,
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
