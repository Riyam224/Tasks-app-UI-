# 📝 Tasks App UI - Flutter

A beautiful, lightweight Flutter task management app with stunning animations and an intuitive user interface. Manage your daily tasks with style!

---

## ✨ Features

### 🎨 **Beautiful UI**
- **Pastel Color-coded Tasks** - Visual categorization with gorgeous colors
- **Dynamic Text Contrast** - Automatically adjusts text color for optimal readability on any background
- **Smooth Animations** - Delightful completion animations and transitions
- **Responsive Design** - Works seamlessly across all devices

### 🎯 **Task Management**
- ✅ **Create Tasks** - Add new tasks with title, time, date, and subtasks
- 📅 **Calendar Integration** - Pick dates with an elegant calendar picker
- ⏰ **Time Selection** - Choose specific times for your tasks
- 🎨 **Color Customization** - Pick from 7 beautiful pastel colors
- ✏️ **Multiple Subtasks** - Add unlimited subtask items to each task

### 🎬 **Animations & Interactions**
- 🎊 **Completion Animation** - Satisfying rotate, scale, and fade animation when marking tasks complete
- 🎉 **Celebration Dialog** - Colorful celebration popup when all tasks are completed
- 🔄 **Drag & Drop Reordering** - Long-press and drag to reorder your tasks
- 💫 **Smooth Transitions** - Beautiful animations throughout the app

### 📱 **Navigation**
- **Persistent Bottom Navigation Bar** - Easy access to all app sections
  - Dashboard (Home)
  - Bookmarks
  - Notifications
  - Profile
- **Floating Action Button** - Quick access to add new tasks

---

## 🛠️ Tech Stack

- **Frontend:** Flutter (Dart)
- **State Management:** setState (simple and effective)
- **Routing:** GoRouter
- **UI Components:** Material Design 3
- **Fonts:** Google Fonts (Inter)
- **Animations:**
  - AnimatedContainer
  - AnimatedOpacity
  - TweenAnimationBuilder
  - ReorderableListView
- **Styling:** Custom pastel color palette with theme support

---

## 📂 Project Structure

```
lib/
├─ core/
│   ├─ helpers/
│   │   └─ constract_text_color.dart    # Text contrast helper
│   ├─ routing/
│   │   ├─ app_routes.dart              # Route definitions
│   │   └─ routes_generated.dart        # Generated routes
│   ├─ styling/
│   │   ├─ colors.dart                  # Color palette
│   │   ├─ text_styles.dart             # Text styles
│   │   └─ themes.dart                  # Light/Dark themes
│   └─ utils/
│       └─ assets.dart                  # Asset management
├─ features/
│   ├─ home/
│   │   ├─ model/
│   │   │   └─ note_model.dart          # Task/Note model
│   │   ├─ views/
│   │   │   └─ home_view.dart           # Main home screen
│   │   └─ widgets/
│   │       ├─ add_new_note.dart        # Add task screen
│   │       └─ single_note.dart         # Task card widget
│   └─ splash/
│       ├─ views/
│       │   └─ splash_view.dart         # Splash screen
│       └─ widgets/
│           └─ splash_view_body.dart    # Splash content
└─ main.dart                            # App entry point
```

---

## ⚙️ Installation

### Prerequisites
- Flutter SDK (^3.9.0)
- Dart SDK
- An IDE (VS Code, Android Studio, or IntelliJ)

### Steps

1. **Clone the repository**
   ```bash
   git clone <repo-url>
   cd Tasks-app-UI-
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

4. **Build for production**
   ```bash
   # Android
   flutter build apk --release

   # iOS
   flutter build ios --release
   ```

---

## 📦 Dependencies

```yaml
dependencies:
  cupertino_icons: ^1.0.8
  flutter:
    sdk: flutter
  go_router: ^16.2.1           # Routing
  google_fonts: ^6.3.1         # Custom fonts
  table_calendar: ^3.2.0       # Calendar picker
```

---

## 🎨 Color Palette

The app uses a beautiful pastel color scheme:

- **Pink** (#F59CAB) - Meetings
- **Orange** (#FF8C42) - Work tasks
- **Yellow** (#F8D272) - Travelling/Personal
- **Purple** (#C78CF2) - Education
- **Blue** (#90CAF9) - General
- **Green** (#A5D6A7) - Health/Fitness

All colors feature **automatic text contrast** for optimal readability!

---

## 🎯 Key Features Explained

### 1. **Task Completion Animation**
When you tap on a task to mark it complete:
- Card rotates slightly (0.2 radians)
- Scales down to 70% size
- Slides to the right and up
- Fades to transparent
- Duration: 700ms with smooth easing

### 2. **Celebration Dialog**
When all tasks are completed:
- Beautiful gradient background (purple → pink → orange)
- Spinning celebration icon
- Animated scale and fade-in entrance
- Auto-dismisses after 3 seconds
- Can be dismissed by tapping button or outside dialog

### 3. **Drag & Drop Reordering**
- Long-press any task card to start dragging
- Drag up or down to reorder
- Visual feedback during drag
- Smooth reordering animation

### 4. **Smart Text Contrast**
Uses `getContrastingTextColor()` helper:
- Analyzes background brightness
- Automatically sets white text on dark backgrounds
- Black text on light backgrounds
- Ensures text is always readable

---

## 🖼️ Screenshots

### Home Screen
- Displays all tasks in a scrollable list
- Color-coded task cards with vertical title labels
- Task time and subtask items clearly visible
- Drag handles for reordering

### Add Task Screen
- Calendar date picker
- Time selection
- Title input field
- Dynamic subtask list (add/remove)
- Color picker with 7 options
- Save button

### Completion Flow
- Tap to complete with animation
- Celebration dialog on all tasks complete
- Smooth transitions throughout

---

## 🚀 Recent Updates (v2.0)

### ✅ Removed
- ❌ AI integration (audio recording, speech-to-text)
- ❌ Backend API dependencies (now fully offline)
- ❌ HTTP requests (dio, http packages)
- ❌ Audio recording features

### ✅ Added
- ✨ Drag & drop task reordering
- 🎉 Celebration animation on task completion
- 🎨 Dynamic text contrast for all backgrounds
- 🔄 Smooth completion animations
- 📱 Static data model (no backend required)

### ✅ Improved
- 🎯 Simplified codebase
- 🚀 Better performance (no network calls)
- 💾 Reduced app size (fewer dependencies)
- 🎨 Enhanced user experience
- 🐛 Fixed RangeError on task deletion

---

## 🔮 Future Enhancements

- [ ] **Local Storage** - Persist tasks using Hive or SharedPreferences
- [ ] **Categories/Tags** - Filter tasks by category
- [ ] **Search Functionality** - Find tasks quickly
- [ ] **Dark Mode** - Full dark theme support
- [ ] **Task Statistics** - Completion rates and productivity insights
- [ ] **Notifications** - Reminders for upcoming tasks
- [ ] **Recurring Tasks** - Daily/weekly task repetition
- [ ] **Task Priority** - High/medium/low priority levels
- [ ] **Archive** - Move completed tasks to archive

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

## 👤 Author

Created with ❤️ using Flutter

---

## 🎉 Acknowledgments

- Flutter team for the amazing framework
- Material Design for the design guidelines
- Google Fonts for beautiful typography
- The Flutter community for inspiration and support

---

**Enjoy managing your tasks with style! 🚀✨**
