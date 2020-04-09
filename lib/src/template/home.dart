import 'package:app_elllo/src/models/tab.dart';
import 'package:app_elllo/src/template/tutorial/tutorial_screen.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ello English'),
        actions: <Widget>[
          IconButton(icon: Icon(FeatherIcons.sun), onPressed: () {})
        ],
        bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.pinkAccent,
            tabs: tabs
                .map((TabChoice tab) => Tab(
                      text: tab.title,
                    ))
                .toList()),
      ),
      drawer: Drawer(),
      body: TabBarView(children: [
        TutorialScreen(),
        TutorialScreen(),
        TutorialScreen(),
        TutorialScreen(),
        TutorialScreen(),
      ]),
    );
  }
}
