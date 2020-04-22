import 'package:app_elllo/src/models/chapter/quiz_model.dart';
import 'package:flutter/material.dart';

class QuizView extends StatelessWidget {
  final List<QuizModel> quizs;

  const QuizView({Key key, this.quizs}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemCount: quizs.length,
            itemBuilder: (BuildContext context, int index) {
              QuizModel quiz = quizs[index];
              List<QuizQuestion> questions = quiz.quizQuestion;
              return Column(
                children: [
                  for (var i in questions)
                    InkWell(
                      onTap: () {},
                      child: Text(
                        '${i.questionName}',
                        style: TextStyle(color: i.color),
                      ),
                    )
                ],
              );
            })
      ],
    );
  }
}
