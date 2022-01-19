import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
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
              'Models Task',
            ),
          ],
        ),
      ),
    );
  }
}
