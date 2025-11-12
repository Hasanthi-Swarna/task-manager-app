# 🧩 Task Manager App

## 📘 Description
A simple Flutter application for managing tasks.  
It allows users to log in with an email, add, edit, delete, and mark tasks as complete or pending.  
The project follows the **MVVM (Model-View-ViewModel)** architecture pattern.  

---
## 🚀 Features  
- 🔐 **Email-based Login** (no password required)  
- 📝 **Add, Edit, Delete Tasks**  
- ✅ **Mark Tasks as Complete or Pending**  
- 🌗 **Supports Light & Dark Themes**  
- 🧠 **MVVM Architecture** for clean and scalable code  
- ⚡ **Responsive UI** across devices  

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
|   ├── login_view.dart     # Login screen
|    └── task_list_view.dart # Task management screen
└── theme/
    └── theme.dart # Theme data

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

## App UI Preview

### Login Page-Dark Mode, Light Mode
<img width="450" height="500" alt="Login Page-Dark Mode" src="https://github.com/user-attachments/assets/006c2a93-f44a-44db-adb2-85ddc6293308" />

<img width="450" height="500" alt="Login Page-Light Mode" src="https://github.com/user-attachments/assets/ee39f335-be9d-419d-8496-b1de29d8eb60" />


### Task Page 
<img width="450" height="500" alt="Task Page-Dark Mode" src="https://github.com/user-attachments/assets/02be17a9-a475-490e-b4cd-e422bd47b333" />

<img width="450" height="500" alt="Task Page-Light Mode" src="https://github.com/user-attachments/assets/cbf48acc-5bad-4b9c-ba86-eab83bfc4c84" />

### Add Task
<img width="450" height="500" alt="Add Task-Dark Mode" src="https://github.com/user-attachments/assets/180efe56-5b14-4bd9-9a4c-bfbe96776532" />
<img width="450" height="500" alt="Add Task-Light Mode" src="https://github.com/user-attachments/assets/8de63945-4322-4f7b-a3d2-40e040fdaf9d" />


### Task List
<img width="450" height="500" alt="Task-List-Dark Mode" src="https://github.com/user-attachments/assets/79456901-ea0d-45ed-8ee6-0f57c4d8d86c" />
<img width="450" height="500" alt="Task-List-Light Mode" src="https://github.com/user-attachments/assets/c5913d83-860d-40d1-a281-7072793634d2" />


### Edit Task
<img width="450" height="500" alt="Edit Task-Dark Mode" src="https://github.com/user-attachments/assets/c69c6b21-addc-48fd-9c8a-c9b26c0d388e" />
<img width="450" height="500" alt="Edit Task-Light Mode" src="https://github.com/user-attachments/assets/68446d03-000e-42a7-afb4-d0bf7d2c1ea4" />


### Marked Tasks
<img width="450" height="500" alt="Marked Task-Dark Mode" src="https://github.com/user-attachments/assets/085d6e77-5cc0-437c-8ea9-cfa6a4105122" />
<img width="450" height="500" alt="Marked Task-Light Mode" src="https://github.com/user-attachments/assets/9c37953d-d324-4cf6-869f-f9c41310d10d" />

## 💡 Future Improvements

- 🔔 Add push notifications for reminders

- 🗂️ Add task categories or tags

- 📅 Integrate a calendar view

- ☁️ Sync tasks with Firebase or local storage

### 🧾 License

This project is licensed under the MIT License.
You are free to use, modify, and distribute it with attribution.
