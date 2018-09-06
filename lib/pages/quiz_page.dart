import 'package:flutter/material.dart';

import '../utils/questions.dart';
import '../utils/quiz.dart';

import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_answer.dart';
import '../pages/score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Elon Musk is a Doctor?", false),
    new Question("Elon Musk is a Scientist?", true),
    new Question("Elon Musk is a Man?", true),
    new Question("Elon Musk is a Woman?", false),
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
    void initState() {
      currentQuestion = quiz.nextQuestion;
      questionText = currentQuestion.question;
      questionNumber = quiz.questionNumber;
      super.initState();
    }

  void handleAnswer(bool answer){
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(
              questionText,
              questionNumber,
            ),
            new AnswerButton(false, () => handleAnswer(false)),
          ],
        ),
        overlayShouldBeVisible == true ? new CorrectWrongAnswer(
          isCorrect,
          () {
              if(quiz.lenght == questionNumber){
                Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.lenght)), (Route route) => route == null);
                return;
              }
              currentQuestion = quiz.nextQuestion;
              this.setState((){
                overlayShouldBeVisible = false;
                questionText = currentQuestion.question;
                questionNumber = quiz.questionNumber;
            });
          }
          ) : new Container(),
      ],
    );
  }
}
