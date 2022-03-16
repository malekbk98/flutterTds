import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/Task.dart';
import '../components/tasks/task_form.dart';
import '../data/tasks_collection.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key, required this.title})
      : super(key: key); //constrcuteur

  final String title;

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  Task? clickedTask;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<TasksCollection>(
        builder: (context, tasksCollection, child) {
          return TaskForm(
            updateTask: (desc, status) {
              setState(() {
                int id = tasksCollection.getAllTasks().length + 1;
                tasksCollection.addTask(
                  Task(id, desc, status, DateTime.now()),
                );
              });
            },
          );
        },
      ),
    );
  }
}
