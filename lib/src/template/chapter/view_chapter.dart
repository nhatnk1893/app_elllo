import 'package:app_elllo/src/template/chapter/tab/view_quiz.dart';
import 'package:app_elllo/src/template/chapter/tab/view_script.dart';
import 'package:app_elllo/src/template/chapter/tab/view_vocab_grammar.dart';
import 'package:app_elllo/src/template/chapter/view_model_chapter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChapterView extends StatelessWidget {
  final String title;

  const ChapterView({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ChapterViewModel>(
        builder: (BuildContext context, ChapterViewModel value, Widget child) {
      var chapter = value.chapter;
      var quizs = value.lstQuizData;
      var tabbars = value.tabBars;
      return (tabbars.length > 1
          ? DefaultTabController(
              length: tabbars.length,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('$title'),
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.bookmark_border,
                          size: 32,
                        ),
                        onPressed: () {})
                  ],
                  bottom: TabBar(
                    tabs: tabbars
                        .map((tab) => Tab(
                              text: tab.title,
                            ))
                        .toList(),
                    indicatorColor: Colors.white,
                    indicatorPadding: EdgeInsets.only(top: 8),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.blue[300],
                  ),
                ),
                body: value.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : TabBarView(children: [
                        if (value.isDisplayScript)
                          ScriptView(
                            script: chapter.script,
                            url: chapter.mp3,
                          ),
                        if (value.isDisplayVoca)
                          VocabView(
                            vocabu: chapter.voca,
                          ),
                        QuizView(
                          quizs: quizs,
                        )
                      ]),
              ))
          : Scaffold(
              appBar: AppBar(
                title: Text('$title'),
                actions: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.bookmark_border,
                        size: 32,
                      ),
                      onPressed: () {})
                ],
              ),
              body: value.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : QuizView(
                      quizs: quizs,
                    ),
            ));
    });
  }
}
