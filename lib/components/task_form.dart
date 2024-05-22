import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app_infnet/models/task.dart';

import '../providers/task_provider.dart';

class Taskform extends StatelessWidget {
  Taskform({super.key});

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    final addTask = taskProvider.addTask;

    return Container(
      color: Colors.black12,
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Task name'),
            controller: nameController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Description'),
            controller: descriptionController,
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
              onPressed: () {
                var name = nameController.text;
                var description = descriptionController.text;

                if (name.isNotEmpty && description.isNotEmpty) {
                  final task = Task(name, description);
                  addTask(task);
                }
              },
              child: const Text('Save'))
        ],
      ),
    );
  }
}
