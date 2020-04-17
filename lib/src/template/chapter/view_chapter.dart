import 'package:app_elllo/src/models/tab_chapter.dart';
import 'package:app_elllo/src/utils/constants.dart';
import 'package:flutter/material.dart';

import 'tab/view_script.dart';

class ChapterView extends StatefulWidget {
  @override
  _ChapterViewState createState() => _ChapterViewState();
}

class _ChapterViewState extends State<ChapterView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabsChapter.length);
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
          title: Text('data'),
          actions: [
            IconButton(icon: Icon(Icons.file_download), onPressed: null),
            IconButton(icon: Icon(Icons.share), onPressed: null)
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
                        0.0,
                        0.70,
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
                    tabs: tabsChapter
                        .map((TabChapterChoice tab) => Tab(
                              text: tab.title,
                            ))
                        .toList()),
              ),
              preferredSize: const Size.fromHeight(48.0))),
      body: TabBarView(controller: _tabController, children: [ScriptView()]),
    );
  }
}
