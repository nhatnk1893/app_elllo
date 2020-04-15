import 'package:app_elllo/src/models/tab.dart';
import 'package:app_elllo/src/template/tabs/views/tab_audio.dart';
import 'package:app_elllo/src/template/tabs/views/tab_level.dart';
import 'package:app_elllo/src/template/tabs/views/tab_mixer.dart';
import 'package:app_elllo/src/template/tabs/views/tab_tutorial.dart';
import 'package:app_elllo/src/template/tabs/views/tab_video.dart';
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
          bottom: PreferredSize(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink[200],
                      offset: Offset(
                        0.0, // horizontal, move right 10
                        0.70, // vertical, move down 10
                      ),
                    )
                  ],
                ),
                child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    unselectedLabelColor: Colors.pink[200],
                    indicatorColor: Colors.pinkAccent,
                    labelColor: Colors.pink[400],
                    tabs: tabs
                        .map((TabChoice tab) => Tab(
                              text: tab.title,
                            ))
                        .toList()),
              ),
              preferredSize: const Size.fromHeight(48.0))),
      drawer: Drawer(),
      body: TabBarView(controller: _tabController, children: [
        TabTutorial(),
        TabLevel(),
        TabTutorial(),
        TabTutorial(),
        TabTutorial(),
      ]),
    );
  }
}
