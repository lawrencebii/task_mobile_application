import 'package:flutter/material.dart';
import 'package:task_mobile_application/blocs/bloc_exports.dart';
import 'package:task_mobile_application/models/task.dart';
import 'package:task_mobile_application/services/uuid_gen.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTaskWidget> createState() =>
      _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const Text(
          'Add Task',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 50,
          child: TextField(
            autofocus: true,
            controller: titleController,
            decoration: InputDecoration(
                label: const Text('Title'),
                border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(8))),
          ),
        ),
        Row(
          children: [
            const Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel')),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  var task = Task(
                      title: titleController.text,
                      id: GUIDGen.generate());
                  context
                      .read<TaskBloc>()
                      .add(AddTask(task: task));
                  Navigator.pop(context);
                },
                child: const Text('Add')),
            const Spacer(),
          ],
        )
      ]),
    );
  }
}
