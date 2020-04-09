import 'package:app_elllo/src/template/splash/splash_screen.dart';
import 'package:app_elllo/src/template/tutorial/tutorial_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TutorialProvider()),
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
            .pink[800], //Changing this will change the color of the TabBar
        accentColor: Colors.cyan[600],
      ),
      title: 'APP',
      home: SplashScreen(),
    );
  }
}