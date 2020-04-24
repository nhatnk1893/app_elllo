import 'package:app_elllo/src/models/tab_chapter.dart';
import 'package:app_elllo/src/template/chapter/tab/view_quiz.dart';
import 'package:app_elllo/src/template/chapter/view_model_chapter.dart';
import 'package:app_elllo/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'tab/view_script.dart';
import 'tab/view_vocab_grammar.dart';

class ChapterView extends StatefulWidget {
  final String title;

  const ChapterView({Key key, this.title}) : super(key: key);
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
    return Consumer<ChapterViewModel>(
      builder: (BuildContext context, ChapterViewModel value, Widget child) {
        var chapter = value.chapter;
        var quizs = value.lstQuizData;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              title: Text(
                '${widget.title}',
                style: TextStyle(color: Colors.blue),
              ),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.bookmark_border,
                      color: Colors.blue,
                    ),
                    onPressed: () {})
              ],
              bottom: PreferredSize(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: TabBar(
                          controller: _tabController,
                          isScrollable: true,
                          unselectedLabelColor: Colors.blue[200],
                          indicatorColor: Colors.blue,
                          labelColor: Colors.blue[400],
                          tabs: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Tab(
                                  text: TabChapterName.TAB_SCRIPT,
                                ),
                                Tab(
                                  text: TabChapterName.TAB_SCRIPT,
                                ),
                                Tab(
                                  text: TabChapterName.TAB_VOCABFRAMMAR,
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                  preferredSize: const Size.fromHeight(48.0))),
          body: value.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : TabBarView(controller: _tabController, children: [
                  ScriptView(
                    script: chapter.script,
                    url: chapter.mp3,
                  ),
                  VocabView(
                    vocabu: chapter.voca,
                  ),
                  QuizView(
                    quizs: quizs,
                  ),
                ]),
        );
      },
    );
  }
}
