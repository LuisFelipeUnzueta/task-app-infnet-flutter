import 'package:flutter/material.dart';
import 'package:task_app_infnet/screens/details_screen.dart';
import '../models/task.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.task),
      title: Text(task.name),
      subtitle: Text(task.description),
      onTap: () {
        Navigator.pushNamed(context, 'details_screen', arguments: task);
      },
    );
  }
}
