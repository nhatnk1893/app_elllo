import 'package:app_elllo/src/models/tab.dart';
import 'package:app_elllo/src/template/tabs/views/tab_audio.dart';
import 'package:app_elllo/src/template/tabs/views/tab_video.dart';
import 'package:app_elllo/src/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            APP_TITLE,
            style: TextStyle(color: Colors.blueAccent),
          ),
          actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () {})],
          bottom: TabBar(
            tabs: tabs
                .map((tab) => Tab(
                      text: tab.title,
                    ))
                .toList(),
            indicatorColor: Colors.blueAccent,
            indicatorPadding: EdgeInsets.only(top: 8),
            labelColor: Colors.blue[300],
          ),
        ),
        body: TabBarView(children: [TabAudio(), TabVideo()]),
      ),
    );
  }
}
