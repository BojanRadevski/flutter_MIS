import 'package:flutter/material.dart';
import 'package:untitled3/addExam.dart';

import 'exam.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Exam> exams = [];

  @override
  void initState() {
    // Adding items to the list; you can add items from a network source as well
    exams.add(Exam(subject: "MIS", date: "10.07.2023 16:10:00"));
    exams.add(Exam(subject: "VBS", date: "11.07.2023 17:20:00"));

    super.initState();
  }

  void _addItemFunction(BuildContext ct) {
    showModalBottomSheet(
      context: ct,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewExam(_addNewItemToList),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _addNewItemToList(Exam item) {
    setState(() {
      exams.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("194009 Bojan Radevski"),
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          icon: const Icon(Icons.add_circle),
          tooltip: "Add New Exam",
          onPressed: () => _addItemFunction(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: exams.map((e) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      e.subject,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      e.date,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
