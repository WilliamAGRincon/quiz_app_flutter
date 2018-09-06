import 'package:flutter/material.dart';
import '../UI/styles.dart';

class AnswerButton extends StatelessWidget {
  final bool answer;
  final VoidCallback _onTap;
  AnswerButton(this.answer,  this._onTap);
  

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child:new Material(
        color: answer == true ? Colors.greenAccent : Colors.redAccent,
        child: new InkWell(
          onTap: () => _onTap(),
          child: new Center(
            child: new Container(
              child: new Text(answer == true ? "Verdad" : "Falso",
              style: new Styles().textStyleItalic()),
            ),
          ),
        ),
      ), 
    );
  }

}
