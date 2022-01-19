import 'package:flutter/material.dart';

class TaskDetail extends StatefulWidget {
  const TaskDetail({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
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
              'Components/Tasks TaskDetail',
            ),
          ],
        ),
      ),
    );
  }
}
