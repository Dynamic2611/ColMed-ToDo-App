import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/task_bloc.dart';
import '../bloc/task_event.dart';

class DeleteTaskDialog extends StatefulWidget {
  final int index;
  const DeleteTaskDialog({super.key, required this.index});

  @override
  State<DeleteTaskDialog> createState() => _DeleteTaskDialogState();
}

class _DeleteTaskDialogState extends State<DeleteTaskDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delete Task"),
      content: Text("Do you really want to delete the task ??"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<TaskBloc>().add(DeleteTask(widget.index));
            Navigator.pop(context);
          },
          child: const Text("Delete"),
        )
      ],
    );
  }
}
