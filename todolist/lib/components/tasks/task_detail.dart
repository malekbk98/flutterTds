// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:todolist/models/Task.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({
    Key? key,
    required this.task,
    required this.deletedTask,
  }) : super(key: key);
  final Task? task;
  final Function deletedTask;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: task!.completed
            ? const Color.fromARGB(255, 96, 148, 0)
            : const Color.fromARGB(255, 255, 115, 0),
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              task!.content,
              style: const TextStyle(
                  color: Colors.white, fontFamily: 'arial', fontSize: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task!.completed ? "Done" : "Not completed",
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  task!.createdAt.toString(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 43, 43, 43),
                    fontFamily: 'arial',
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      deletedTask(task);
                    },
                    child: const Text("Delete"),
                    color: Colors.red[300],
                    textColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 50), //Spacer
                Expanded(
                  child: RaisedButton(
                    onPressed: () {},
                    child: const Text("Update"),
                    color: Colors.orange[300],
                    textColor: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
