import 'package:flutter/cupertino.dart';
import 'package:task_app_infnet/models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task>? taskList = [
    Task("Escovar os dentes", "escova pasta etc"),
    Task("Dog", "levar o cachorro pra passear")
  ];

  void addTask(Task task) {
    if (taskList!.isEmpty || taskList == null) {
      List<Task>? taskList = [];
      taskList.add(task);
    }
    taskList!.add(task);
    notifyListeners();
  }
}
