// todo note card

import 'package:flutter/material.dart';
import 'package:notes/features/home/model/note_model.dart';
import 'package:notes/core/helpers/constract_text_color.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    final cardTextColor = getContrastingTextColor(note.cardColor);
    final titleTextColor = getContrastingTextColor(note.titleColor);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left vertical label
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          decoration: BoxDecoration(
            color: note.titleColor,
            boxShadow: [
              BoxShadow(
                color: note.titleColor,
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
                color: titleTextColor,
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
              color: note.cardColor,
              boxShadow: [
                BoxShadow(
                  color: note.cardColor,
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
                    Icon(
                      Icons.access_time,
                      size: 20,
                      color: cardTextColor,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      note.time,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: cardTextColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ...note.tasks.map(
                  (task) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      "• $task",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: cardTextColor,
                      ),
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
