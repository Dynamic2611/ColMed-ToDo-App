import 'package:hive/hive.dart';
import '../models/task_model.dart';

class TaskRepository {
  final Box<TaskModel> taskBox;

  TaskRepository(this.taskBox);

  List<TaskModel> getTasks() => taskBox.values.toList();

  void addTask(TaskModel task) => taskBox.add(task);

  void deleteTask(int index) => taskBox.deleteAt(index);

  void toggleTask(int index) {
    final task = taskBox.getAt(index);
    if (task != null) {
      task.isCompleted = !task.isCompleted;
      taskBox.putAt(index, task);
    }
  }
}
