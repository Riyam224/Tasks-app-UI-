import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:notes/core/styling/colors.dart';
import 'package:notes/core/styling/text_styles.dart';
import 'package:notes/features/home/model/note_model.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({super.key});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool _alarmEnabled = false;

  final TextEditingController _titleController = TextEditingController();

  // 🔹 Dynamic tasks list
  final List<TextEditingController> _taskControllers = [
    TextEditingController(),
  ];

  // 🔹 Colors
  final List<Color> availableColors = [
    Colors.pink.shade200, // pastel pink
    const Color.fromARGB(255, 227, 103, 41), // pastel purple
    AppColors.travelling, // pastel yellow
    const Color.fromARGB(255, 204, 164, 211), // soft lavender
    Colors.blue.shade200, // pastel blue
    Colors.green.shade200, // pastel green
    Colors.orange.shade200, // pastel orange
  ];
  Color? _selectedCardColor;
  Color? _selectedTitleColor;

  // open native time picker
  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() => _selectedTime = picked);
    }
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
    return Scaffold(
      backgroundColor: const Color(0xffFFE5E4),
      appBar: AppBar(
        backgroundColor: AppColors.travelling.withOpacity(0.2),
        elevation: 0,
        titleSpacing: 0,

        title: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: const [
              // Icon(Icons.close, color: Colors.black87),
              // SizedBox(width: 6),
              Text(
                'Back',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Create New Task", style: AppTextStyles.titleLarge),
            const SizedBox(height: 20),

            // Date Picker
            const Text("Date", style: TextStyle(fontWeight: FontWeight.w600)),
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
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  border: Border.all(color: AppColors.meeting, width: 2),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: AppColors.meeting,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Time Picker
            const Text("Time", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _pickTime,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.travelling.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _selectedTime.format(context),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Note Title
            const Text("Title", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "Write the note title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Tasks
            const Text("Tasks", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Column(
              children: List.generate(_taskControllers.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _taskControllers[index],
                          decoration: InputDecoration(
                            hintText: "Task ${index + 1}",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (_taskControllers.length > 1)
                        IconButton(
                          icon: const Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() => _taskControllers.removeAt(index));
                          },
                        ),
                    ],
                  ),
                );
              }),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () {
                  setState(() => _taskControllers.add(TextEditingController()));
                },
                icon: const Icon(Icons.add, size: 18),
                label: const Text("Add Task"),
              ),
            ),

            const SizedBox(height: 20),

            // Alarm
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Alarm",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Switch(
                  value: _alarmEnabled,
                  onChanged: (val) => setState(() => _alarmEnabled = val),
                  activeColor: AppColors.meeting,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Color Picker
            const Text(
              "Pick Colors",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
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
                          ? Border.all(color: Colors.black, width: 2)
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 30),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.meeting,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  if (_titleController.text.isEmpty ||
                      _selectedDay == null ||
                      _selectedCardColor == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please fill all required fields"),
                      ),
                    );
                    return;
                  }

                  final newNote = Note(
                    id: DateTime.now().millisecondsSinceEpoch,
                    title: _titleController.text,
                    type: "Custom",
                    time: _selectedTime.format(context),
                    tasks: _taskControllers
                        .map((c) => c.text)
                        .where((t) => t.isNotEmpty)
                        .toList(),
                    color: "#${_selectedCardColor!.value.toRadixString(16)}",
                    cardColor: _selectedCardColor,
                    titleColor: _selectedTitleColor,
                    date: _selectedDay.toString(),
                  );

                  Navigator.pop(context, newNote);
                },
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
