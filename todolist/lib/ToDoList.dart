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
        AllTasks.route: (context) => const AllTasks(
              title: 'All tasks',
            ),
        OneTask.route: (context) => const OneTask(
              title: 'Task Update',
            ),
        CreateTask.route: (context) => const CreateTask(
              title: 'Add new task',
            ),
      },
      home: const AllTasks(title: 'All tasks'),
    );
  }
}
