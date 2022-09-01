import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_mobile_application/models/task.dart';
import 'package:task_mobile_application/presentation/my_drawer.dart';

import '../blocs/bloc_exports.dart';
import '../widgets/add_task.dart';
import '../widgets/task_list.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);
  static const id = 'task_screen';
  TextEditingController titleController =
      TextEditingController();
  void _addTask(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom:
                      MediaQuery.of(ctx).viewInsets.bottom),
              child: const AddTaskWidget(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.allTasks;
        return Scaffold(
          drawer: const DrawerWidget(),
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.orangeAccent,
                statusBarBrightness: Brightness.light),
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                onPressed: () => _addTask(context),
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.allTasks.length} Tasks',
                  ),
                ),
              ),
              TaskList(taskList: taskList)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
