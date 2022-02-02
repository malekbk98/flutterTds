import 'package:flutter/material.dart';
import 'package:todolist/components/tasks/task_preview.dart';
import 'package:todolist/models/Task.dart';

class TaskMaster extends StatelessWidget {
  const TaskMaster({Key? key, required this.tasks}) : super(key: key);
  //constrcuteur
  final List<Task> tasks;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskPreview(task: tasks[index]);
        },
      ),
    );
  }
}
