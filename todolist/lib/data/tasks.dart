import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
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
              'Data tasks',
            ),
          ],
        ),
      ),
    );
  }
}
