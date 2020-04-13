import 'package:app_elllo/src/models/lesson.dart';
import 'package:app_elllo/src/template/tabLesson/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LessonItem extends StatelessWidget {
  final String img;
  final String title;
  final String subTitle;
  final String tabName;
  final Lesson lesson;

  const LessonItem(
      {Key key, this.img, this.title, this.subTitle, this.tabName, this.lesson})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   PageTransition(
        //       type: PageTransitionType.rightToLeft, child: TabScreen()),
        // );
      },
      child: Container(
        height: 150,
        child: new Material(
          color: Colors.white,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.blueAccent[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 150,
                  child: ClipRRect(
                      child: Container(
                    constraints: new BoxConstraints.expand(
                      height: 150.0,
                    ),
                    alignment: Alignment.bottomLeft,
                    padding: new EdgeInsets.only(left: 16.0, bottom: 8.0),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0)),
                      image: new DecorationImage(
                        image: new NetworkImage(img),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        child: Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 16.0),
                        ),
                        padding: EdgeInsets.only(top: 8.0),
                      ),
                      Divider(),
                      Text(
                        tabName,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
