import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/task_list.dart';
import 'my_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);
  static const id = 'bin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor:
                Color.fromARGB(255, 170, 155, 135),
            statusBarBrightness: Brightness.light),
        title: const Text('Recycle Bin'),
        actions: [
          IconButton(
            onPressed: () => null,
            // _addTask(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: Chip(
              label: Text(
                '{state.allTasks.length} Tasks',
              ),
            ),
          ),
          TaskList(taskList: [])
        ],
      ),
    );
  }
}
