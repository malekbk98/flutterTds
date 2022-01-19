import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Components/Tasks TaskForm',
            ),
          ],
        ),
      ),
    );
  }
}
