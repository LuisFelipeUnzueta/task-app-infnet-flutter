import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app_infnet/components/task_list_tile.dart';
import 'package:task_app_infnet/models/task.dart';
import 'package:task_app_infnet/providers/task_provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    final List<Task>? taskList = taskProvider.taskList;

    return ListView.builder(
      itemCount: taskList?.length,
      itemBuilder: ((context, index) {
        Task task = taskList![index];
        return TaskListTile(task: task);
      }),
    );
  }
}
