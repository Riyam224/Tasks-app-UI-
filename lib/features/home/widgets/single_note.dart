// todo note card

import 'package:flutter/material.dart';
import 'package:notes/features/home/model/note_model.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left vertical label
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          decoration: BoxDecoration(
            color: note.titleColor ?? Colors.grey,
            boxShadow: [
              BoxShadow(
                color: note.titleColor ?? Colors.grey,
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: RotatedBox(
            quarterTurns: 3,
            child: Text(
              note.title,
              style: TextStyle(
                // color: Colors.white, // dynamic contrast
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 25),

        // Right card
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: note.cardColor ?? Colors.grey.shade300,
              boxShadow: [
                BoxShadow(
                  color: note.cardColor ?? Colors.grey.shade300,
                  blurRadius: 4,
                  offset: const Offset(0, 10),
                ),
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 20,
                      color: Color(0xFF9C5C59),
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      note.time,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF9C5C59),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ...note.tasks.map(
                  (task) => Text(
                    "• $task",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
