import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/Task.dart';
import '../components/tasks/task_form.dart';
import '../data/tasks_collection.dart';

class OneTask extends StatefulWidget {
  const OneTask({Key? key, required this.title})
      : super(key: key); //constrcuteur

  final String title;
  static String get route => '/one_task';

  @override
  _OneTaskState createState() => _OneTaskState();
}

class _OneTaskState extends State<OneTask> {
  Task? clickedTask;

  @override
  Widget build(BuildContext context) {
    final Task? task = ModalRoute.of(context)!.settings.arguments as Task?;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<TasksCollection>(
        builder: (context, tasksCollection, child) {
          return TaskForm(
            task: task,
            updateTask: (text, status) {
              setState(() {
                tasksCollection.updateTask(
                  Task(task!.id, text, status, task.createdAt),
                );
              });
            },
          );
        },
      ),
    );
  }
}
