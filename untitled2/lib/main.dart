import 'package:flutter/material.dart';
import 'package:untitled2/questions.dart';
import 'answers.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  void _iWasTapped() {
    setState(() {
      if (_questionIndex < questions.length - 1) {
        _questionIndex += 1;
      } else {
        _isFinished = true; // Set a flag to indicate the order is finished
      }
    });
  }

  var questions = [
    {
      'question': 'Select cloth size',
      'answer': ['XS', 'S', 'M', 'L', 'XL']
    },
    {
      'question': 'Select cloth season type',
      'answer': ['Winter', 'Summer']
    },
    {
      'question': 'Select cloth type:',
      'answer': ['T-Shirt', 'Pajamas']
    },
  ];
  var _questionIndex = 0;
  bool _isFinished = false; // Flag to indicate if the order is finished

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lab 2",
      home: Scaffold(
        appBar: AppBar(
          title: Text("19400 Bojan Radevski"),
        ),
        body: Column(
          children: [
            if (!_isFinished)
              Questions(questions[_questionIndex]['question'] as String),
            if (!_isFinished)
              ...((questions[_questionIndex]['answer'] as List<String>).map((answer) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: Answers(_iWasTapped, answer),
                );
              })).toList(),
            if (_isFinished)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Your order is done!',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
