// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../auth.dart';
import 'addExam.dart';
import 'calendar.dart';
import 'exam.dart';

void main() {
  runApp(
      MaterialApp(
        home: MyApp(),
      )
  );
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Exam> exams= [];

  @override
  void initState() {
    //adding item to list, you can add using json from network
    exams.add(Exam( subject: "WP", datetime: DateTime(2022, 6, 6), time: TimeOfDay(hour: 11, minute: 00), duration: 1, id: '', date: ''));
    exams.add(Exam( subject: "EMT", datetime: DateTime(2022, 7, 1), time: TimeOfDay(hour: 12, minute: 00), duration: 1, id: '', date: ''));

    super.initState();
  }

  void deleteItem(String id){
    setState((){
      exams.removeWhere((element) => element.id == id);
    });
  }

  void _addItemFunction(BuildContext ct) {
    showModalBottomSheet(
        context: ct,
        builder: (_) {
          return GestureDetector(onTap: () {}, child: NewExam(_addNewItemToList), behavior: HitTestBehavior.opaque);
        });
  }

  // List<Appointment> getAllAppointments(){
  //   List<Appointment> appointments = [];
  //   exams.forEach((exam) {
  //     appointments.add(Appointment(startTime: DateTime(exam.datetime.year, exam.datetime.month,
  //         exam.datetime.day, exam.time.hour, exam.time.minute),
  //         endTime: DateTime(exam.datetime.year, exam.datetime.month,
  //             exam.datetime.day, exam.time.hour, exam.time.minute)
  //             .add(Duration(hours: exam.duration)),
  //         subject: exam.subject));
  //   });
  //   return appointments;
  // }

  List<Exam> getExams(){
    return exams;
  }

  void showCalendar(BuildContext ct){
    showModalBottomSheet(context: ct,
        builder: (_){
          return GestureDetector(onTap: (){}, behavior: HitTestBehavior.opaque, child: Calendar(getAllAppointments()));
        });
  }

  void _addNewItemToList(Exam item) {
    setState(() {
      exams.add(item);
    });
  }

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget examsPage() {
    return MyApp();
  }


  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercise 4 - Student exams"),
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          icon: const Icon(Icons.add_circle),
          tooltip: "Add new exam",
          onPressed: () => _addItemFunction(context),),
        actions: [
          PopupMenuButton(itemBuilder: (context){
            return [
              PopupMenuItem<int>(
                value: 1,
                child: ElevatedButton.icon(onPressed: () => _addItemFunction(context), icon: Icon(Icons.add), label: Text('Add new exam')),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: ElevatedButton.icon(onPressed: () => signOut(), icon: Icon(Icons.logout), label: Text('Log out')),
              )
            ];
          },
            onSelected: (value){
              if(value == 1){
                _addItemFunction(context);
              }else if(value == 2){
                signOut();
              }
            },)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: exams.map((e){
              return Container(
                child: Card(
                  child:ListTile(
                    title: Text(e.subject),
                    subtitle: Text("${DateFormat("dd/MM/yyyy").format(e.datetime).toString()} ${e.time.hour}:${e.time.minute} "),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red
                      ),
                      child: Icon(Icons.delete),
                      onPressed: (){
                        deleteItem(e.id) ;
                      },
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showCalendar(context),
        child: const Icon(Icons.calendar_month_sharp),),
    );
  }
}

class Appointment {
}

