abstract class TaskEvent {}

class LoadTasks extends TaskEvent {}

class AddTask extends TaskEvent {
  final String title;
  AddTask(this.title);
}

class DeleteTask extends TaskEvent {
  final int index;
  DeleteTask(this.index);
}

class ToggleTask extends TaskEvent {
  final int index;
  ToggleTask(this.index);
}
