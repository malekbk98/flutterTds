import 'package:flutter/material.dart';
import 'package:todolist/data/tasks.dart' as data;

import '../models/Task.dart';

class TasksCollection extends ChangeNotifier {
  final List<Task> _tasks = data.tasks;

  //Add task
  void add(Task task) {
    _tasks.insert(0, task);
    notifyListeners();
  }

  //get all tasks
  List<Task> getAllTasks() {
    print('ok');
    return _tasks;
  }

  //Update task
  void updateTask(Task task) {
    int index = _tasks.indexWhere((t) => t.id == task.id);
    _tasks[index] = task;
    notifyListeners();
  }

  //Delete task
  void del(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
