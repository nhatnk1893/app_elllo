import 'package:app_elllo/src/models/category/category.dart';
import 'package:app_elllo/src/template/lesson/view_lesson.dart';
import 'package:app_elllo/src/template/lesson/view_model_lesson.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String img;
  final Category category;

  const CategoryItem({Key key, this.name, this.img, this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<LessonViewModel>(context, listen: false)
            .fetchData(category.code);
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeft,
              child: LessonView(title: name, lessonCode: category.code)),
        );
      },
      child: Container(
          height: 64,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue[200], width: 1.0)),
          child: new Material(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blue[400],
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$name',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue[300]),
                      ),
                    ))
                  ],
                )),
          )),
    );
  }
}
