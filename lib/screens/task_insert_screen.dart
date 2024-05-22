import 'package:flutter/material.dart';
import 'package:task_app_infnet/components/task_form.dart';
import 'package:task_app_infnet/models/task.dart';

class TaskInsertScreen extends StatelessWidget {
  TaskInsertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Insert New Task'),
      ),
      body: Taskform(),
    );
  }
}
