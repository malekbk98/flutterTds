import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
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
              'Screens CreateTask',
            ),
          ],
        ),
      ),
    );
  }
}
