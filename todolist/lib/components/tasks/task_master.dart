import 'package:flutter/material.dart';
import 'package:todolist/components/tasks/task_preview.dart';
import 'package:todolist/models/Task.dart';

class TaskMaster extends StatelessWidget {
  const TaskMaster(
      {Key? key, required this.tasks, required this.clickedTask, this.clicked})
      : super(key: key);
  //constrcuteur
  final List<Task> tasks;
  final Function clickedTask;
  final Task? clicked;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskPreview(
            task: tasks[index],
            clickedTask: (Task task) {
              clickedTask(task);
            },
            selected: tasks[index] == clicked,
          );
        },
      ),
    );
  }
}
