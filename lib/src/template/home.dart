import 'package:app_elllo/src/models/tab.dart';
import 'package:app_elllo/src/template/tabLesson/tab_provider.dart';
import 'package:app_elllo/src/template/tabLesson/tab_screen.dart';
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
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _handleTabSelection() {
    Provider.of<TabProvider>(context, listen: false)
        .updateLesson(_tabController.index);
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
        TabScreen(),
        TabScreen(),
        TabScreen(),
        TabScreen(),
        TabScreen(),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<TabProvider>(context, listen: false).setTabIndex(10);
        },
        child: Text('${Provider.of<TabProvider>(context).tabIndex}'),
      ),
    );
  }
}
