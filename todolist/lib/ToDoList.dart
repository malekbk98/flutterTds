import 'package:flutter/material.dart';
import 'package:todolist/data/tasks.dart';
import 'package:todolist/screens/all_tasks.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'ShadowsIntoLight',
      ),
      home: new AllTasks(),
    );
  }
}
