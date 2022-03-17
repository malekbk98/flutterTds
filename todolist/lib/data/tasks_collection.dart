import 'dart:convert';

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
    var response = await Dio().get(
      "https://jsonplaceholder.typicode.com/todos",
      options: Options(
        headers: {
          Headers.contentTypeHeader: 'application/json',
          Headers.acceptHeader: 'application/json'
        },
      ),
    );

    if (response.statusCode == 200) {
      List data = response.data;
      _tasks.addAll(data.map((i) => Task.fromJson(i)).toList());
    } else {
      throw Exception('Failed to load main zone');
    }
  }
}
