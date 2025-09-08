
# 📒 Notes / Tasks App

A Flutter + Django-based productivity app to manage daily tasks and notes. The app supports **beautiful pastel UI**, **animated notes list**, and a **persistent navigation bar**.

---

## 🚀 Features

* ✅ **Create, Edit, Delete Notes**
* ✅ **Pastel Color-coded Notes** (Meeting, Study, Travelling, etc.)
* ✅ **Animated Notes List**

  * Add → slides in from bottom
  * Remove → curvy throw-away animation
* ✅ **Custom Note Structure**

  * Title
  * Time
  * Date
  * Tasks (multiple subtasks per note)
  * Card color + Label color
* ✅ **Persistent Bottom Navigation** (Dashboard, Bookmarks, Notifications, Profile)
* ✅ **Beautiful Splash Screen** with animation

---

## 🛠️ Tech Stack

* **Frontend:** Flutter (Dart)
* **Backend:** Django REST Framework
* **Database:** PostgreSQL (configurable)
* **Routing:** GoRouter (Flutter)
* **Animations:** AnimatedList, SlideTransition, ScaleTransition
* **Styling:** Pastel Color Palette + Google Fonts

---

## 📂 Project Structure

### Flutter

```
lib/
 ├─ core/
 │   ├─ routing/        # App routes
 │   ├─ styling/        # Colors, TextStyles, Themes
 ├─ features/
 │   ├─ home/
 │   │   ├─ model/      # Note model
 │   │   ├─ widgets/    # NoteCard, SingleNote, etc.
 │   │   └─ view/       # HomeView, AddNewNote
 └─ main.dart
```

### Django

```
notes_api/
 ├─ notes/              # App for Notes
 │   ├─ models.py       # Note model
 │   ├─ serializers.py  # API serialization
 │   ├─ views.py        # CRUD endpoints
 │   ├─ urls.py
 ├─ settings.py
 └─ manage.py
```

---

## ⚙️ Installation

### Flutter

```bash
git clone <repo-url>
cd flutter_app
flutter pub get
flutter run
```

### Django

```bash
git clone <repo-url>
cd notes_api
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver
```

---

## 🖼️ Screenshots (Current UI)

* 🟣 Splash Screen with pop animation
* 🟡 Home Screen with animated notes
* 🟢 Add New Note Screen with:

  * Date picker
  * Time picker
  * Title input
  * Subtasks input
  * Alarm toggle
  * Color picker with **blow-up animation**

---

## 🤖 Planned AI Features (Future)

* 🎤 **Voice → Notes**: Speak and let AI transcribe into text notes.
* 📝 **AI Summarization**: Generate quick summaries for long notes.
* 🏷️ **Auto-tagging**: AI categorizes notes into work, personal, study.
* 🔍 **Smart Search**: Natural language search across notes.
* 🌍 **Translation**: Translate notes between languages.

---

## 📌 Next Steps

* [ ] Integrate **OpenAI Whisper API** for Voice → Notes.
* [ ] Add Summarization API endpoint in Django.
* [ ] Update Flutter UI with “AI Actions” menu per note.
* [ ] Store AI-enhanced metadata in DB.
