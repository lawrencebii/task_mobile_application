import 'package:flutter/material.dart';
import 'package:task_mobile_application/presentation/bin.dart';
import 'package:task_mobile_application/presentation/task_screen.dart';

import '../blocs/bloc_exports.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 14, horizontal: 10),
              child: Text(
                'Drawer',
                style:
                    Theme.of(context).textTheme.headline6,
              ),
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return ListTile(
                  onTap: () => Navigator.pushNamed(
                      context, TasksScreen.id),
                  leading: const Icon(Icons.folder_special),
                  title: const Text('My tasks'),
                  trailing:
                      Text('${state.allTasks.length}'),
                );
              },
            ),
            const Divider(),
            ListTile(
              onTap: () => Navigator.pushNamed(
                  context, RecycleBin.id),
              leading: const Icon(Icons.delete),
              title: const Text('Bin'),
              trailing: const Text('5'),
            )
          ],
        ),
      ),
    );
  }
}
