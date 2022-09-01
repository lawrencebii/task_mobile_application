import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        task.title,
        style: TextStyle(
            decorationColor:
                task.isDone! ? Colors.green : Colors.red,
            decorationThickness: task.isDone! ? 3 : 1,
            decoration: task.isDone!
                ? TextDecoration.lineThrough
                : TextDecoration.underline),
      ),
      trailing: IconButton(
          onPressed: () => context
              .read<TaskBloc>()
              .add(DeleteTask(task: task)),
          icon: const Icon(Icons.delete)),
      leading: Checkbox(
          onChanged: ((value) {
            context
                .read<TaskBloc>()
                .add(UpdateTask(task: task));
          }),
          value: task.isDone),
    );
  }
}

