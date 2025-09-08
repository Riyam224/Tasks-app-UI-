import 'package:flutter/material.dart';

class Note {
  final int id;
  final String title;
  final String type;
  final String time;
  final List<String> tasks;
  final String date;
  final Color? cardColor;
  final Color? titleColor;
  final String color; // hex string from API

  Note({
    required this.id,
    required this.title,
    required this.type,
    required this.time,
    required this.tasks,
    required this.color,
    this.date = '',
    this.cardColor,
    this.titleColor,
  });

  // Factory to parse from JSON
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      time: json['time'],
      tasks: List<String>.from(json['tasks']),
      color: json['color'],
      date: json['date'],
      cardColor: Color(int.parse(json['cardColor'])),
      titleColor: Color(int.parse(json['titleColor'])),
    );
  }
}
