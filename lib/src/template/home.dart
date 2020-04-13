import 'package:app_elllo/src/models/tab.dart';
import 'package:app_elllo/src/template/tabLesson/tab_provider.dart';
import 'package:app_elllo/src/template/tabLesson/tab_screen.dart';
import 'package:app_elllo/src/template/tabs/tab_audio.dart';
import 'package:app_elllo/src/template/tabs/tab_level.dart';
import 'package:app_elllo/src/template/tabs/tab_mixer.dart';
import 'package:app_elllo/src/template/tabs/tab_tutorial.dart';
import 'package:app_elllo/src/template/tabs/tab_video.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elllo english'),
        actions: <Widget>[
          IconButton(icon: Icon(FeatherIcons.sun), onPressed: () {})
        ],
        bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.pinkAccent,
            tabs: tabs
                .map((TabChoice tab) => Tab(
                      text: tab.title,
                    ))
                .toList()),
      ),
      drawer: Drawer(),
      body: TabBarView(controller: _tabController, children: [
        TabTutorial(),
        TabLevel(),
        TabAudio(),
        TabVideo(),
        TabMixer()
      ]),
    );
  }
}
