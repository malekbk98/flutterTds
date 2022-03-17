import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/Task.dart';

class TasksCollection extends ChangeNotifier {
  List<Task> _tasks = [];

  //Fetch tasks from api
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
      //Erase previous tasks
      _tasks = [];

      //Add tasks to _tasks
      List data = response.data;
      _tasks.addAll(data.map((i) => Task.fromJson(i)).toList());
      notifyListeners();
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  //Add task
  void addTask(Task task) {
    //add task to _tasks (old version of code before using api)
    /**
     * Note please: I left the next line because the API doesn't support changes, so the following code line is just for demonstration :) .
     */
    _tasks.insert(0, task);
    //notifyListeners(); //No need for this since fetchTasks will be called
  }

  //Get all tasks (locally stored [getter])
  List<Task> getAllTasks() {
    return _tasks;
  }

  //Update task
  Future<bool> updateTask(Task task) async {
    //Update task from _tasks (old version of code before using api)
    /**
     * Note please: I left the next line because the API doesn't support changes, so the following code line is just for demonstration :) .
     */
    int index = _tasks.indexWhere((t) => t.id == task.id);
    _tasks[index] = task;
    //notifyListeners(); //No need for this since fetchTasks will be called

    //update task with api
    var taskData = {
      "id": task.id.toString(),
      "title": task.content,
      "completed": task.completed,
    };

    var response = await Dio().put(
      "https://jsonplaceholder.typicode.com/todos/" + task.id.toString(),
      options: Options(
        headers: {
          Headers.contentTypeHeader: 'application/json',
          Headers.acceptHeader: 'application/json'
        },
      ),
      data: taskData,
    );

    //Return response
    if (response.statusCode == 200) {
      //Refresh tasks
      await fetchTasks();
      return true;
    }

    return false;
  }

  //Delete task
  Future<bool> del(Task task) async {
    //Remove task from _tasks (old version of code before using api)
    /**
     * Note please: I left the next line because the API doesn't support changes, so the following code line is just for demonstration :) .
     */
    _tasks.remove(task);
    //notifyListeners(); //No need for this since fetchTasks will be called

    //Delete task with api
    var response = await Dio().delete(
      "https://jsonplaceholder.typicode.com/todos/" + task.id.toString(),
      options: Options(
        headers: {
          Headers.contentTypeHeader: 'application/json',
          Headers.acceptHeader: 'application/json'
        },
      ),
    );

    //Return response
    if (response.statusCode == 200) {
      //Refresh tasks
      await fetchTasks();
      return true;
    }
    return false;
  }
}
