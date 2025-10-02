import 'package:flutter/material.dart';

class Note {
  final int id;
  final String title;
  final String? type;
  final String time;
  final String date;
  final List<String> tasks;
  final String color;
  final Color cardColor;
  final Color titleColor;

  Note({
    required this.id,
    required this.title,
    this.type,
    required this.time,
    required this.date,
    required this.tasks,
    required this.color,
    required this.cardColor,
    required this.titleColor,
  });
}
