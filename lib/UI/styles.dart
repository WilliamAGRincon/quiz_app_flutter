import 'package:flutter/material.dart';

class Styles{  
  TextStyle textStyle_50(){
    return new TextStyle(
      color: Colors.white,
      fontSize: 50.0,
      fontWeight: FontWeight.bold
    );
  }

  TextStyle textStyleItalic(){
    return new TextStyle(
      color: Colors.white,
      fontSize: 50.0,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic
    );
  }

  TextStyle textStyle_20(){
    return new TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold
    );
  }
}