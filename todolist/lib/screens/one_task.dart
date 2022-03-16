import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/Task.dart';
import 'package:select_form_field/select_form_field.dart';

import '../components/tasks/task_form.dart';
import '../data/tasks_collection.dart';

class OneTask extends StatefulWidget {
  const OneTask({Key? key, required this.title})
      : super(key: key); //constrcuteur

  final String title;

  @override
  _OneTaskState createState() => _OneTaskState();
}

class _OneTaskState extends State<OneTask> {
  Task? clickedTask;

  @override
  Widget build(BuildContext context) {
    final Task? task = ModalRoute.of(context)!.settings.arguments as Task?;

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<TasksCollection>(
        builder: (context, tasksCollection, child) {
          return TaskForm(
            updateTask: (newTask) {
              setState(() {
                tasksCollection.updateTask(newTask);
              });
            },
          );
        },
      ),
    );
  }
}
