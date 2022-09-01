import 'package:flutter/material.dart';
import 'package:task_mobile_application/widgets/task_tile.dart';

import '../models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              var task = taskList[index];
              return TaskTile(task: task);
            }));
  }
}
