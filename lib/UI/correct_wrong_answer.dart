import 'dart:math';

import 'package:flutter/material.dart';

class CorrectWrongAnswer extends StatefulWidget {
  final bool _isCorrect;
  final VoidCallback _onTap;

  CorrectWrongAnswer(this._isCorrect, this._onTap);

  @override
  State createState() => CorrectWrongAnswerState();
}

class CorrectWrongAnswerState extends State<CorrectWrongAnswer> with SingleTickerProviderStateMixin{
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
    void initState() {
      _iconAnimationController = new AnimationController(duration: new Duration(seconds: 2), vsync: this);
      _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.elasticOut);
      _iconAnimation.addListener(() => this.setState((){}));
      _iconAnimationController.forward();
      super.initState();
    }

  @override
    void dispose() {
      _iconAnimationController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: new Transform.rotate(
                angle: _iconAnimation.value *2 * 3.141516,
                child: new Icon(
                widget._isCorrect == true ? Icons.done : Icons.error,
                size: _iconAnimation.value * 80.0,
                color: Colors.greenAccent,
              ),
              )
            ),
            new Padding(
              padding: EdgeInsets.only(bottom: 20.0),
            ),
            new Text(
              widget._isCorrect == true ? "Correcto" : "Incorrecto",
              style: new TextStyle(color: Colors.white, fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}
