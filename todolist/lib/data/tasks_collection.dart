import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/Task.dart';

class TasksCollection extends ChangeNotifier {
  List<Task> _tasks = [];

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
      print('ok--');

      _tasks = [];
      List data = response.data;
      _tasks.addAll(data.map((i) => Task.fromJson(i)).toList());
      notifyListeners();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  //Delete task from api
  Future<bool> delTaskApi(id) async {
    var response = await Dio().delete(
      "https://jsonplaceholder.typicode.com/todos/" + id.toString(),
      options: Options(
        headers: {
          Headers.contentTypeHeader: 'application/json',
          Headers.acceptHeader: 'application/json'
        },
      ),
    );

    return response.statusCode == 200;
  }

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
  Future<bool> del(Task task) async {
    //Remove task from tasks Lists (old version of code before using api)
    /**
     * Note please: I left the next line because the API doesn't support changes, so the following code line is just for demonstration :) .
     */
    _tasks.remove(task);

    //Delete task with api
    bool response = await delTaskApi(task.id);

    //Refresh tasks
    await fetchTasks();
    return response;
  }
}
