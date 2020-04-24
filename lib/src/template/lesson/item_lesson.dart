import 'package:app_elllo/src/template/chapter/view_chapter.dart';
import 'package:app_elllo/src/template/chapter/view_model_chapter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LessonItem extends StatelessWidget {
  final String img;
  final String title;
  final String subTitle;
  final String id;

  const LessonItem({Key key, this.img, this.title, this.subTitle, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Provider.of<ChapterViewModel>(context, listen: false).setCleanData();
          Provider.of<ChapterViewModel>(context, listen: false).fetchData(id);
          Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft,
                child: ChapterView(
                  title: title,
                )),
          );
        },
        child: Container(
            height: 56,
            child: new Material(
              color: Colors.white,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blue[400],
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '$title',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue[300]),
                        ),
                      ))
                    ],
                  )),
            )));
  }
}
