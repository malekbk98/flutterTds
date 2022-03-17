import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/data/tasks_collection.dart';

import 'ToDoList.dart';

Future<void> main() async {
  var tasksCollection = TasksCollection();
  await tasksCollection.fetchTasks();

  runApp(
    ChangeNotifierProvider(
      create: (context) => tasksCollection,
      child: const TodoList(),
    ),
  );
}
