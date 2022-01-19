import 'package:flutter/material.dart';

class TaskPreview extends StatefulWidget {
  const TaskPreview({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<TaskPreview> createState() => _TaskPreviewState();
}

class _TaskPreviewState extends State<TaskPreview> {
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
              'Components/Tasks TaskPreview',
            ),
          ],
        ),
      ),
    );
  }
}
