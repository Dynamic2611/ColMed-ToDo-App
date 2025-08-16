import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/task_bloc.dart';
import '../bloc/task_state.dart';
import '../widgets/add_task_dialog.dart';
import '../widgets/task_item.dart';

class HomeScreen extends StatelessWidget {
  final bool isDark;
  final VoidCallback onThemeToggle;

  const HomeScreen({super.key, required this.isDark, required this.onThemeToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: isDark ? Colors.white :Colors.black,
        title: const Text("ColMed  To-Do App"),
        actions: [
          IconButton(
            onPressed: onThemeToggle,
            icon: Icon(isDark ? Icons.wb_sunny : Icons.dark_mode),
          ),
        ],
      ),

      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoaded) {
            if (state.tasks.isEmpty) {
              return const Center(child: Text("No tasks yet"));
            }
            return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                return TaskItem(task: state.tasks[index], index: index);
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierColor: Colors.black.withOpacity(0.3),
            builder: (BuildContext context) {
              return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: AddTaskDialog(),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
