// import 'package:app_elllo/src/models/lesson.dart';
// import 'package:app_elllo/src/models/tab.dart';
// import 'package:app_elllo/src/services/lesson/lesson_repository.dart';
// import 'package:app_elllo/src/services/lesson/lesson_repositoryImpl.dart';
// import 'package:app_elllo/src/template/tabLesson/tab_provider.dart';
// import 'package:app_elllo/src/template/utils/lesson_item.dart';
// import 'package:app_elllo/src/utils/constants_api.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class TabScreen extends StatefulWidget {
//   @override
//   _TabScreenState createState() => _TabScreenState();
// }

// class _TabScreenState extends State<TabScreen> {
//   LessonRepository _lessonRepo = LessonRepositoryImpl();
//   Future<List<Lesson>> futureLesson;

//   @override
//   void initState() {
//     super.initState();
//     futureLesson = _lessonRepo.getLessonsByTab(LESSONSTUTORIAL, 1, 10);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<TabProvider>(
//       builder: (BuildContext context, TabProvider tabProvider, Widget child) {
//         return Scaffold(
//             body: new FutureBuilder<List<Lesson>>(
//                 future: futureLesson,
//                 builder: (BuildContext context, AsyncSnapshot snapshot) {
//                   if (snapshot.hasData) {
//                     return ListView(
//                       children: <Widget>[
//                         ListView.builder(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 15, vertical: 18),
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemCount: tabProvider.list.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             Lesson lesson = tabProvider.list[index];
//                             return Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 5, vertical: 8),
//                               child: LessonItem(
//                                 img: lesson.thumnailUrl,
//                                 title: lesson.title,
//                                 subTitle: lesson.subTitle,
//                                 lesson: lesson,
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     );
//                   } else if (snapshot.hasError) {
//                     return Text("${snapshot.error}");
//                   }
//                   return CircularProgressIndicator();
//                 }));
//       },
//     );
//   }
// }
