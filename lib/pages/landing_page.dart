import 'package:flutter/material.dart';
import '../UI/styles.dart';
import '../pages/quiz_page.dart';

class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.greenAccent,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Quiz App",style: Styles().textStyle_50(),),
            new Text("Presione para iniciar", style: Styles().textStyle_20(),),
          ],
        ),
      ),
    );
  }
}