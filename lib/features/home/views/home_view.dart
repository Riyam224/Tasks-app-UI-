// ignore_for_file: deprecated_member_use, unused_field, unused_element
import 'package:flutter/material.dart';
import 'package:notes/features/home/model/note_model.dart';
import 'package:notes/features/home/widgets/add_new_note.dart'
    as add; // 👈 alias
import 'package:notes/features/home/widgets/single_note.dart'
    as single; // 👈 alias

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  int _currentIndex = 0;
  int? _animatingIndex;

  List<Note> notes = [
    Note(
      id: 1,
      title: "Meeting",
      type: "Work",
      time: "10:00",
      date: "2025-10-02",
      tasks: ["Business Meeting", "  Team Meeting"],
      color: "#F59CAB",
      cardColor: const Color(0xFFF59CAB),
      titleColor: const Color(0xFF9C5C59),
    ),
    Note(
      id: 2,
      title: "Study",
      type: "Education",
      time: "08:00",
      date: "2025-10-02",
      tasks: ["Read Notes", "Go to Study", "University Homework"],
      color: "#C78CF2",
      cardColor: const Color(0xFFC78CF2),
      titleColor: const Color(0xFF8D4FB1),
    ),
    Note(
      id: 3,
      title: "Travelling",
      type: "Personal",
      time: "05:00",
      date: "2025-10-02",
      tasks: ["Garden Visit", "Union/Family Visit"],
      color: "#F8D272",
      cardColor: const Color(0xFFF8D272),
      titleColor: const Color(0xFFD9A628),
    ),
  ];

  /// Remove note with animation
  void _cutNote(int index) async {
    // Check if index is valid
    if (index < 0 || index >= notes.length) return;

    // Mark this note as animating
    setState(() {
      _animatingIndex = index;
    });

    final wasLastNote = notes.length == 1;

    // Wait for animation to complete
    await Future.delayed(const Duration(milliseconds: 700));

    setState(() {
      notes.removeAt(index);
      _animatingIndex = null;
    });

    // Show celebration when all tasks are completed
    if (wasLastNote) {
      await Future.delayed(const Duration(milliseconds: 200));
      _showCelebration();
    }
  }

  /// Show celebration animation
  void _showCelebration() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 800),
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: Opacity(
                opacity: value,
                child: Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple.shade300,
                        Colors.pink.shade300,
                        Colors.orange.shade300,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.5),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Animated celebration icon
                      TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0.0, end: 1.0),
                        duration: const Duration(milliseconds: 600),
                        builder: (context, iconValue, child) {
                          return Transform.rotate(
                            angle: iconValue * 2 * 3.14159,
                            child: Icon(
                              Icons.celebration,
                              size: 80,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        '🎉 Amazing! 🎉',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'All tasks completed!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.purple,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          'Awesome!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );

    // Auto dismiss after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    });
  }

  /// Add new note
  void _addNote(Note newNote) {
    setState(() {
      notes.add(newNote);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'what to do today?',
          style: TextStyle(
            fontSize: 20,
            shadows: [Shadow(blurRadius: 10.0, offset: Offset(2.0, 2.0))],
          ),
        ),
      ),

      body: notes.isEmpty
          ? const Center(child: Text("No notes yet"))
          : ReorderableListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: notes.length,
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  final note = notes.removeAt(oldIndex);
                  notes.insert(newIndex, note);
                });
              },
              itemBuilder: (context, index) {
                final note = notes[index];
                final isAnimating = _animatingIndex == index;

                return Padding(
                  key: ValueKey(note.id),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: GestureDetector(
                    onTap: () => _cutNote(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeInOut,
                      transform: isAnimating
                          ? (Matrix4.identity()
                              ..rotateZ(0.2)
                              ..scale(0.7, 0.7)
                              ..translate(200.0, -100.0))
                          : Matrix4.identity(),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 700),
                        opacity: isAnimating ? 0.0 : 1.0,
                        child: single.NoteCard(note: note),
                      ),
                    ),
                  ),
                );
              },
            ),

      /// Floating add button
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF9C5C59),
        shape: const CircleBorder(),
        onPressed: () async {
          final newNote = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const add.AddNewNote(), // 👈 use alias
            ),
          );

          if (newNote != null && newNote is Note) {
            _addNote(newNote);
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      /// Bottom nav bar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.pink.shade200,
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.grid_view,
                  color: _currentIndex == 0 ? Colors.white : Colors.white70,
                ),
                onPressed: () => setState(() => _currentIndex = 0),
              ),
              IconButton(
                icon: Icon(
                  Icons.bookmark,
                  color: _currentIndex == 1 ? Colors.white : Colors.white70,
                ),
                onPressed: () => setState(() => _currentIndex = 1),
              ),
              const SizedBox(width: 40),
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: _currentIndex == 2 ? Colors.white : Colors.white70,
                ),
                onPressed: () => setState(() => _currentIndex = 2),
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: _currentIndex == 3 ? Colors.white : Colors.white70,
                ),
                onPressed: () => setState(() => _currentIndex = 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// // ignore_for_file: deprecated_member_use
