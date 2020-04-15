import 'package:app_elllo/src/models/lesson/lesson.dart';
import 'package:app_elllo/src/template/lesson/view_model_lesson.dart';
import 'package:app_elllo/src/template/utils/fetch_fail.dart';
import 'package:app_elllo/src/template/utils/list_item_course.dart';
import 'package:app_elllo/src/utils/constants_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SessionView extends StatelessWidget {
  final String title;
  final String idCourse;

  const SessionView({Key key, this.title, this.idCourse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LessonViewModel>(
      builder: (BuildContext context, LessonViewModel value, Widget child) {
        return Scaffold(
            appBar: AppBar(
              title: Text('$title'),
            ),
            drawer: Drawer(),
            body: value.isLoading
                ? Center(child: CircularProgressIndicator())
                : value.lstLesson.isEmpty
                    ? FailApi()
                    : RefreshIndicator(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 13, vertical: 8.0),
                          shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          itemCount: value.lstLesson.length,
                          itemBuilder: (BuildContext context, int index) {
                            Lesson lesson = value.lstLesson[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 8),
                              child: CourseItem(
                                  img: lesson.thumnailUrl,
                                  title: lesson.title,
                                  subTitle: lesson.subTitle,
                                  tabName: TABTUTORIAL),
                            );
                          },
                        ),
                        onRefresh: () => value.fetchData('url', idCourse)));
      },
    );
  }
}
