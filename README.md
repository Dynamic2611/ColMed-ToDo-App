# ColMed Task Manager 📝

A simple **To-Do App** built with **Flutter**, using **BLoC (Business Logic Component)** for state management and **Hive Database** for local storage.  
This project is a part of my interview assignment.

---

## ✨ Features
- ➕ Add Tasks Easily
- ✅ Mark Tasks as Completed
- 🗑️ Delete Tasks
- 🌗 Light & Dark Mode Support
- ⚡ State Management with BLoC
- 💾 Persistent Storage using Hive

---

## 🛠️ Tech Stack
- **Flutter (Dart)**
- **BLoC (flutter_bloc package)**
- **Hive (Local NoSQL Database)**
- **Material Design UI**

---


## 📊 App Flow (High-Level)

1. **main.dart**  
   - Initializes Hive database  
   - Registers Task model adapter  
   - Opens a Hive box (`tasks`)  
   - Provides `TaskBloc` with repository  

2. **HomeScreen**  
   - Displays task list using `BlocBuilder`  
   - Floating button → Opens Add Task dialog  
   - Theme toggle button  

3. **TaskBloc**  
   - Handles events (AddTask, DeleteTask, ToggleTask, LoadTasks)  
   - Updates Hive via repository  
   - Emits updated state  

4. **TaskRepository**  
   - Communicates with Hive DB for CRUD operations  

5. **Hive DB**  
   - Persists tasks locally (even after app restart)  


