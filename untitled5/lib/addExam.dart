import 'package:flutter/material.dart';
import 'package:untitled3/exam.dart';

class NewExam extends StatefulWidget {
  final Function addExam;

  const NewExam(this.addExam);

  @override
  State<StatefulWidget> createState() {
    return NewExamState();
  }
}

class NewExamState extends State<NewExam> {
  final subjectController = TextEditingController();
  final dateController = TextEditingController();

  late String subject;
  late String date;

  void submitData() {
    if (subjectController.text.isEmpty) {
      return;
    }
    final enteredSubject = subjectController.text;
    final enteredDate = dateController.text;

    if (enteredDate == null || enteredSubject == null) {
      return;
    }
    final newExam = Exam(subject: enteredSubject, date: enteredDate);
    widget.addExam(newExam);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: subjectController,
            decoration: const InputDecoration(
              labelText: "Subject",
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            onSubmitted: (_) => submitData(),
          ),
          SizedBox(height: 12), // Add some spacing
          TextField(
            controller: dateController,
            decoration: const InputDecoration(
              labelText: "Date",
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            keyboardType: TextInputType.datetime,
            onSubmitted: (_) => submitData(),
          ),
          const SizedBox(height: 16), // Add more spacing
          ElevatedButton(
            onPressed: submitData,
            child: const Text(
              "Add Exam",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
