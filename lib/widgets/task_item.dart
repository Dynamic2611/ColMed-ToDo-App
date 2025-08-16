import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/task_bloc.dart';
import '../bloc/task_event.dart';
import '../models/task_model.dart';
import 'delete_task_dialog.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  final int index;

  const TaskItem({super.key, required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Card(
        elevation: 3,

        shadowColor: theme.shadowColor.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Checkbox(
            value: task.isCompleted,
            activeColor: theme.colorScheme.primary,
            onChanged: (_) {
              context.read<TaskBloc>().add(ToggleTask(index));
            },
          ),
          title: Text(
            task.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: theme.textTheme.bodyLarge?.copyWith(

              fontWeight: FontWeight.w500,
              decoration: task.isCompleted ? TextDecoration.lineThrough : null,
              color: task.isCompleted
                  ? theme.disabledColor
                  : theme.textTheme.bodyLarge?.color,
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
            onPressed: () {
              showDialog(
                context: context,
                barrierColor: Colors.black.withOpacity(0.3),
                builder: (BuildContext context) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: DeleteTaskDialog(index: index),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
