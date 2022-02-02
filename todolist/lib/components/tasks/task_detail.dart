import 'package:flutter/material.dart';
import 'package:todolist/models/Task.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({Key? key, required this.task}) : super(key: key);
  final Task task;

  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          task.content,
          style: const TextStyle(fontFamily: 'arial', fontSize: 20),
        ),
        Text(
          task.createdAt.toString(),
        ),
        Text(
          task.completed.toString(),
          style: TextStyle(color: task.completed ? Colors.green : Colors.red),
        ),
      ],
    ));
  }
}
