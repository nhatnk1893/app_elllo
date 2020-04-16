import 'package:app_elllo/src/models/lesson/lesson.dart';
import 'package:app_elllo/src/template/lesson/item_lesson.dart';
import 'package:app_elllo/src/template/lesson/view_model_lesson.dart';
import 'package:app_elllo/src/template/utils/fetch_fail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LessonView extends StatelessWidget {
  final String title;
  final String lessonCode;

  const LessonView({Key key, this.title, this.lessonCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LessonViewModel>(
      builder: (BuildContext context, LessonViewModel value, Widget child) {
        return Scaffold(
            appBar: AppBar(
              title: Text('$title'),
            ),
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
                                child: LessonItem(
                                  img: lesson.image,
                                  title: lesson.title,
                                  subTitle: lesson.descript,
                                ));
                          },
                        ),
                        onRefresh: () => value.fetchData(lessonCode)));
      },
    );
  }
}
