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
          height: 56,
          child: new Material(
            color: Colors.white,
            elevation: 2.0,
            borderRadius: BorderRadius.circular(20.0),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.arrow_forward_ios),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$name',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ))
                  ],
                )),
          )),
    );
  }
}
