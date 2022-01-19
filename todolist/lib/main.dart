import 'package:flutter/material.dart';
import 'package:todolist/screens/all_tasks.dart';

void main() {
  runApp(const TodoList());
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AllTasks(title: 'Flutter Demo Home Page'),
    );
  }
}
