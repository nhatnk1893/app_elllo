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
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: quizs.length,
                    itemBuilder: (BuildContext context, int index) {
                      QuizModel quiz = quizs[index];
                      List<QuizQuestion> questions = quiz.quizQuestion;
                      return Column(
                        children: [
                          Text('${quiz.question}'),
                          for (var i in questions)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 8),
                              child: InkWell(
                                  onTap: () {
                                    Provider.of<ChapterViewModel>(context,
                                            listen: false)
                                        .choiceAns(quiz.keyQuiz, i.key);
                                  },
                                  child: Container(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width,
                                      child: new Material(
                                        color: i.color,
                                        elevation: 10.0,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Text('${i.questionName}'),
                                      ))),
                            )
                        ],
                      );
                    })),
            Container(
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    children: <Widget>[Icon(Icons.check), Text('Check result')],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
