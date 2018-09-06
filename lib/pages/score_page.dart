import 'package:flutter/material.dart';
import '../UI/styles.dart';
import 'landing_page.dart';

class ScorePage extends StatelessWidget{

  final int score;
  final int totalQuestions;

  ScorePage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Su puntaje: ", style: Styles().textStyle_50(),),
          new Text(score.toString()+" / "+totalQuestions.toString(), style: Styles().textStyle_50(),),
          new IconButton(
            icon: new Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new LandingPage()), (Route route) => route == null),
          )
        ],
      ),
    );
  }
  
}


