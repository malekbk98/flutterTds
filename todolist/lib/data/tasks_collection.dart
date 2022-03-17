import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/Task.dart';

class TasksCollection extends ChangeNotifier {
  final List<Task> _tasks = [];

  //Add task
  void addTask(Task task) {
    _tasks.insert(0, task);
    notifyListeners();
  }

  //get all tasks
  List<Task> getAllTasks() {
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

  //Fetch tasks
  fetchTasks() async {
    var response =
        await Dio().get("https://jsonplaceholder.typicode.com/todos");
    if (response.statusCode == 200) {
      var data = response.data;
      for (var t in data) {
        addTask(
          Task(t["id"], t["title"], t["completed"], DateTime.now()),
        );
      }
    } else {
      throw Exception('Failed to load main zone');
    }
  }
}
