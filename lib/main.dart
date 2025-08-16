import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/task_model.dart';
import 'data/task_repository.dart';
import 'bloc/task_bloc.dart';
import 'bloc/task_event.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  final taskBox = await Hive.openBox<TaskModel>('tasks');
  runApp(MyApp(repository: TaskRepository(taskBox)));
}

class MyApp extends StatefulWidget {
  final TaskRepository repository;
  const MyApp({super.key, required this.repository});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  void toggleTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskBloc(widget.repository)..add(LoadTasks()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ColMed To-Do App",
        theme: isDark ? ThemeData.dark() : ThemeData.light(),
        home: HomeScreen(
          isDark: isDark,
          onThemeToggle: toggleTheme,
        ),
      ),
    );
  }
}
