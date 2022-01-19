import 'package:flutter/material.dart';

class TaskMaster extends StatefulWidget {
  const TaskMaster({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<TaskMaster> createState() => _TaskMasterState();
}

class _TaskMasterState extends State<TaskMaster> {
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
              'Components/Tasks TaskMaster',
            ),
          ],
        ),
      ),
    );
  }
}
