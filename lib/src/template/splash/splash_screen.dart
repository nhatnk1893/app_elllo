import 'dart:async';

import 'package:app_elllo/src/template/home.dart';
import 'package:app_elllo/src/template/splash/widgets/splash_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimeOut() {
    return new Timer(Duration(seconds: 5), handleTimeOut);
  }

  void handleTimeOut() {
    changeScreen();
  }

  void changeScreen() {
    Navigator.pushReplacement(
        context,
        PageTransition(
            child: HomeScren(), type: PageTransitionType.leftToRight));
  }

  @override
  void initState() {
    super.initState();
    startTimeOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashWidget(),
    );
  }
}
