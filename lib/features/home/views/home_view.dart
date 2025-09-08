// ignore_for_file: deprecated_member_use, unused_field, unused_element

import 'package:flutter/material.dart';
import 'package:notes/core/styling/colors.dart';
import 'package:notes/features/home/model/note_model.dart';
import 'package:notes/features/home/widgets/add_new_note.dart';
import 'package:notes/features/home/widgets/single_note.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  int _currentIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text("Dashboard")),
    Center(child: Text("Bookmarks")),
    Center(child: Text("Notifications")),
    Center(child: Text("Profile")),
  ];

  final List<Note> notes = [
    Note(
      id: 1,
      title: "Meeting",
      type: "Work",
      time: "10:00AM - 1:00PM",
      tasks: ["Business Meeting", "Stall Meeting"],
      color: "#F59CAB",
      cardColor: const Color(0xFFF59CAB),
      titleColor: const Color(0xFF9C5C59),
    ),
    Note(
      id: 2,
      title: "Study",
      type: "Education",
      time: "8:00AM - 9:45PM",
      tasks: ["Read UK Case Study", "University Homework"],
      color: "#C78CF2",
      cardColor: const Color(0xFFC78CF2),
      titleColor: const Color(0xFF8D4FB1),
    ),
    Note(
      id: 3,
      title: "Travelling",
      type: "Personal",
      time: "5:00AM - 6:00PM",
      tasks: ["Garden Visit", "Union/Family Visit"],
      color: "#F8D272",
      cardColor: const Color(0xFFF8D272),
      titleColor: const Color(0xFFD9A628),
    ),
  ];

  // remove note with curvy animation
  void _cutNote(int index) {
    final removedNote = notes.removeAt(index);

    _listKey.currentState!.removeItem(index, (context, animation) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );

      return AnimatedBuilder(
        animation: curved,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..rotateZ(0.2 * curved.value)
              ..scale(1.0, 1.0 - 0.3 * curved.value)
              ..translate(200 * curved.value, -100 * curved.value),
            child: Opacity(
              opacity: 1.0 - curved.value,
              child: NoteCard(note: removedNote),
            ),
          );
        },
      );
    }, duration: const Duration(milliseconds: 700));
  }

  // add new note with slide-up animation
  void _addNote() {
    final newNote = Note(
      id: DateTime.now().millisecondsSinceEpoch,
      title: "New Task",
      type: "Work",
      time: "2:00PM - 3:00PM",
      tasks: ["Task item 1", "Task item 2"],
      color: "#9C5C59",
      cardColor: const Color(0xFFF59CAB),
      titleColor: const Color(0xFF9C5C59),
    );

    final insertIndex = notes.length;
    notes.add(newNote);

    _listKey.currentState!.insertItem(
      insertIndex,
      duration: const Duration(milliseconds: 600),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFE5E4),
      appBar: AppBar(
        backgroundColor: AppColors.travelling.withOpacity(0.2),
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
      body: AnimatedList(
        key: _listKey,
        padding: const EdgeInsets.all(20),
        initialItemCount: notes.length,
        itemBuilder: (context, index, animation) {
          final note = notes[index];

          // custom slide-up animation for new notes
          final slideAnimation =
              Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              );

          return GestureDetector(
            onTap: () => _cutNote(index),
            child: SlideTransition(
              position: slideAnimation,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: NoteCard(note: note),
              ),
            ),
          );
        },
      ),

      // floating add button
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF9C5C59),
        shape: const CircleBorder(),
        onPressed: () async {
          final newNote = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddNewNote()),
          );

          if (newNote != null && newNote is Note) {
            setState(() {
              notes.add(newNote);
              _listKey.currentState!.insertItem(notes.length - 1);
            });
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // bottom nav bar
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
              const SizedBox(width: 40), // gap for FAB
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
