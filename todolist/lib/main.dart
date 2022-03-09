import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/data/tasks_collection.dart';

import 'ToDoList.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TasksCollection(),
      child: const TodoList(),
    ),
  );
}
