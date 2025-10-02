// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:notes/features/home/model/note_model.dart';
import 'package:notes/core/styling/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({super.key});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  TimeOfDay _selectedTime = TimeOfDay.now();

  final TextEditingController _titleController = TextEditingController();
  final List<TextEditingController> _taskControllers = [
    TextEditingController(),
  ];

  final List<Color> availableColors = [
    Colors.pink.shade200,
    Colors.orange,
    AppColors.travelling,
    Colors.purple.shade200,
    Colors.blue.shade200,
    Colors.green.shade200,
    Colors.yellow.shade600,
  ];
  Color? _selectedCardColor;
  Color? _selectedTitleColor;

  /// Format time like "08:30"
  String _formatTime(TimeOfDay time) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    return "$hours:$minutes";
  }

  /// Pick time
  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) setState(() => _selectedTime = picked);
  }

  /// Save manually entered note
  void _saveManualNote() {
    if (_titleController.text.isEmpty ||
        _selectedDay == null ||
        _selectedCardColor == null ||
        _taskControllers.every((c) => c.text.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
      return;
    }

    final note = Note(
      id: DateTime.now().millisecondsSinceEpoch,
      title: _titleController.text,
      type: "Custom",
      time: _formatTime(_selectedTime),
      date: _selectedDay!.toIso8601String().split("T")[0],
      tasks: _taskControllers
          .map((c) => c.text)
          .where((t) => t.isNotEmpty)
          .toList(),
      color: "#${_selectedCardColor!.value.toRadixString(16)}",
      cardColor: _selectedCardColor!,
      titleColor: _selectedTitleColor ?? Colors.black,
    );

    Navigator.pop(context, note);
  }

  @override
  void dispose() {
    _titleController.dispose();
    for (var c in _taskControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("Create New Task"),
        backgroundColor: theme.primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 📅 Date Picker
            Text("Date", style: theme.textTheme.bodyLarge),
            const SizedBox(height: 8),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: theme.textTheme.bodyLarge!,
              ),
            ),
            const SizedBox(height: 20),

            // ⏰ Time Picker
            Text("Time", style: theme.textTheme.bodyLarge),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _pickTime,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: theme.cardColor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _selectedTime.format(context),
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 📝 Title input
            Text("Title", style: theme.textTheme.bodyLarge),
            const SizedBox(height: 10),
            TextField(
              controller: _titleController,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              decoration: const InputDecoration(
                hintText: "Write the note title",
              ),
            ),
            const SizedBox(height: 20),

            // ✅ Task list
            Text("Tasks", style: theme.textTheme.bodyLarge),
            const SizedBox(height: 10),
            Column(
              children: List.generate(_taskControllers.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _taskControllers[index],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            hintText: "Task ${index + 1}",
                          ),
                        ),
                      ),
                      if (_taskControllers.length > 1)
                        IconButton(
                          icon: Icon(
                            Icons.remove_circle,
                            color: theme.colorScheme.error,
                          ),
                          onPressed: () =>
                              setState(() => _taskControllers.removeAt(index)),
                        ),
                    ],
                  ),
                );
              }),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () => setState(
                  () => _taskControllers.add(TextEditingController()),
                ),
                icon: const Icon(Icons.add, size: 18),
                label: const Text("Add Task"),
              ),
            ),
            const SizedBox(height: 20),

            // 🎨 Color picker
            Text("Pick Colors", style: theme.textTheme.bodyLarge),
            const SizedBox(height: 10),
            Wrap(
              spacing: 12,
              children: availableColors.map((color) {
                final isSelected = _selectedCardColor == color;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCardColor = color;
                      _selectedTitleColor = color.withOpacity(0.8);
                    });
                  },
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: isSelected
                          ? Border.all(
                              color: theme.colorScheme.onSurface,
                              width: 2,
                            )
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),

            // 💾 Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.bottomNavBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: _saveManualNote,
                child: const Text(
                  "Save",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
