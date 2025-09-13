import 'package:flutter/material.dart';
import 'package:notes/features/home/model/note_model.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:notes/core/styling/colors.dart';

import 'package:speech_to_text/speech_to_text.dart' as stt;

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
  final List<TextEditingController> _taskControllers = [
    TextEditingController(),
  ];

  final List<Color> availableColors = [
    Colors.pink.shade200,
    const Color.fromARGB(255, 227, 103, 41),
    AppColors.travelling,
    const Color.fromARGB(255, 204, 164, 211),
    Colors.blue.shade200,
    Colors.green.shade200,
    Colors.orange.shade200,
  ];
  Color? _selectedCardColor;
  Color? _selectedTitleColor;

  // 🎤 Speech-to-text
  late stt.SpeechToText _speech;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  Future<void> _startListening(TextEditingController controller) async {
    bool available = await _speech.initialize();
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (result) {
          setState(() {
            controller.text = result.recognizedWords;
          });
        },
      );
    }
  }

  void _stopListening() {
    setState(() => _isListening = false);
    _speech.stop();
  }

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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
        title: Text(
          'Create New Task',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
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
            const SizedBox(height: 10),
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

            // 📝 Title with Mic
            Text("Title", style: theme.textTheme.bodyLarge),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      hintText: "Write the note title",
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    _isListening ? Icons.mic : Icons.mic_none,
                    color: AppColors.meeting,
                  ),
                  onPressed: () {
                    if (_isListening) {
                      _stopListening();
                    } else {
                      _startListening(_titleController);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ✅ Tasks with Mic
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
                          decoration: InputDecoration(
                            hintText: "Task ${index + 1}",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          _isListening ? Icons.mic : Icons.mic_none,
                          color: AppColors.meeting,
                        ),
                        onPressed: () {
                          if (_isListening) {
                            _stopListening();
                          } else {
                            _startListening(_taskControllers[index]);
                          }
                        },
                      ),
                      if (_taskControllers.length > 1)
                        IconButton(
                          icon: Icon(
                            Icons.remove_circle,
                            color: theme.colorScheme.error,
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

            // ⏰ Alarm
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Alarm", style: theme.textTheme.bodyLarge),
                Switch(
                  value: _alarmEnabled,
                  onChanged: (val) => setState(() => _alarmEnabled = val),
                  activeColor: AppColors.meeting,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 🎨 Color Picker
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
