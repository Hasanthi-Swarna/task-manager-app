# 🧩 Task Manager App

## 📘 Description
A simple Flutter application for managing tasks.  
It allows users to log in with an email, add, edit, delete, and mark tasks as complete or pending.  
The project follows the **MVVM (Model-View-ViewModel)** architecture pattern.  

---
## 🚀 Features
- Email-based login 
- Create, read, update, and delete tasks
- Mark tasks as complete or pending
- Clean MVVM architecture
- State management with Provider
- Simple, user-friendly UI

---
## 🛠️ Technology Stack
- Flutter 3.x
- Provider for state management
- Dart for business logic

---
## 📂 File Structure
```
lib/
├── main.dart               # App entry point
│
├── models/
│   └── task_model.dart     # Task data model
│
├── viewmodels/
│   └── task_viewmodel.dart # App logic and task handling
│
└── views/
    ├── login_view.dart     # Login screen
    └── task_list_view.dart # Task management screen

```

---
## 🌐 How to View Online
You can view the complete project structure and source code directly on GitHub:  
👉 [https://github.com/hasanthi-swarna/task-manager-app](https://github.com/hasanthi-swarna/task-manager-app)

## ⚙️ How to Download & Run Locally
1. Install [Flutter SDK](https://flutter.dev/docs/get-started/install)
2. Clone the repository:
   ```bash
   git clone https://github.com/hasanthi-swarna/task-manager-app.git
3. Open the folder:
   ```bash
   cd task-manager-app
4. Get dependencies:
   ```bash
   flutter pub get
5. Run the app:
   ```bash
   flutter run
