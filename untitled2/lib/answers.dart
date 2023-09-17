import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  String answerText;
  VoidCallback tapped;

  Answers(this.tapped, this.answerText);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: tapped,
      child:
      Text(answerText, style: TextStyle(fontSize: 20, color: Colors.red)),
      style: ElevatedButton.styleFrom(
          primary: Colors.green
      ),
    );
  }
}