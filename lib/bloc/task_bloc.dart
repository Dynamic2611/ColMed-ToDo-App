import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/task_repository.dart';
import '../models/task_model.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository repository;

  TaskBloc(this.repository) : super(TaskInitial()) {
    on<LoadTasks>((event, emit) {
      final tasks = repository.getTasks();
      emit(TaskLoaded(tasks));
    });

    on<AddTask>((event, emit) {
      repository.addTask(TaskModel(title: event.title));
      emit(TaskLoaded(repository.getTasks()));
    });

    on<DeleteTask>((event, emit) {
      repository.deleteTask(event.index);
      emit(TaskLoaded(repository.getTasks()));
    });

    on<ToggleTask>((event, emit) {
      repository.toggleTask(event.index);
      emit(TaskLoaded(repository.getTasks()));
    });
  }
}
