import 'package:flutter/material.dart';
import 'package:todolist/screens/all_tasks.dart';
import 'package:todolist/screens/create_task.dart';
import 'package:todolist/screens/one_task.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Sans Serif',
      ),
      initialRoute: '/',
      routes: {
        '/all_tasks': (context) => const AllTasks(
              title: 'All tasks',
            ),
        '/one_task': (context) => const OneTask(
              title: 'Task preview',
            ),
        '/create_task': (context) => const CreateTask(
              title: 'Add new task',
            ),
      },
      home: const AllTasks(title: 'All tasks'),
    );
  }
}
