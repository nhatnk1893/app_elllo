import 'package:app_elllo/src/models/chapter/quiz_model.dart';
import 'package:app_elllo/src/template/chapter/view_model_chapter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizView extends StatelessWidget {
  final List<QuizModel> quizs;

  const QuizView({Key key, this.quizs}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: quizs.length,
                    itemBuilder: (BuildContext context, int index) {
                      QuizModel quiz = quizs[index];
                      List<QuizQuestion> questions = quiz.quizQuestion;
                      return Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${quiz.question}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w300),
                            ),
                          ),
                          for (var i in questions)
                            InkWell(
                                onTap: () {
                                  Provider.of<ChapterViewModel>(context,
                                          listen: false)
                                      .choiceAns(quiz.keyQuiz, i.key);
                                },
                                child: Container(
                                    height: 56,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      child: new Material(
                                        color: i.color,
                                        elevation: 1,
                                        child: Padding(
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child:
                                                    Text('${i.questionName}')),
                                            padding: EdgeInsets.only(left: 16)),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 4),
                                    ))),
                        ],
                      );
                    })),
            Container(
              height: 64,
              child: Center(
                child: RaisedButton.icon(
                  onPressed: () {
                    Provider.of<ChapterViewModel>(context, listen: false)
                        .checkResult();
                  },
                  icon: Icon(Icons.check),
                  label: Text('Check quiz'),
                  color: Colors.blue[300],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
