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
          height: 150,
          child: new Material(
            color: Colors.white,
            elevation: 10.0,
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.blue[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
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
                  flex: 1,
                ),
                Expanded(
                  child: Padding(
                    padding: null,
                    child: Center(
                      child: Text(
                        '$name',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.w100),
                      ),
                    ),
                  ),
                  flex: 2,
                ),
              ],
            ),
          )),
    );
  }
}
