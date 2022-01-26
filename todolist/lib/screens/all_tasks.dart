// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todolist/data/tasks.dart';

class AllTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tasks = getRandTasks();
    return Scaffold(
      appBar: AppBar(title: Text("All tasks")),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            trailing: Text(
              "${tasks[index].createdAt}",
              style: TextStyle(
                  color: tasks[index].completed ? Colors.green : Colors.red,
                  fontSize: 15),
            ),
            title: Text(
              "${tasks[index].content}",
              style: TextStyle(fontFamily: 'arial', fontSize: 20),
            ),
          );
        },
      ),
    );
  }
}
