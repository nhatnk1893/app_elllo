import 'package:app_elllo/src/template/chapter/view_model_chapter.dart';
import 'package:app_elllo/src/template/splash/splash_screen.dart';
import 'package:app_elllo/src/template/tabs/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/template/lesson/view_model_lesson.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabViewModel()),
        ChangeNotifierProvider(create: (_) => LessonViewModel()),
        ChangeNotifierProvider(create: (_) => ChapterViewModel())
        // add more provider.
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors
            .lightBlue[800], //Changing this will change the color of the TabBar
        accentColor: Colors.cyan[600],
      ),
      title: 'APP',
      home: SplashScreen(),
    );
  }
}
