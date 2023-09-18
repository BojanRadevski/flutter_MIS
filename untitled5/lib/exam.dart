
import 'package:flutter/material.dart';

class Exam{
  String id;
  String subject;
  DateTime datetime;
  TimeOfDay time;
  int duration;
  Exam({required this.id, required this.subject, required this.datetime, required this.time, required this.duration, required String date});
}