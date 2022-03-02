import 'package:flutter/material.dart';
import 'package:todolist/models/Task.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({Key? key, required this.task}) : super(key: key);
  final Task? task;

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
            )
          ],
        ),
      ),
    );
  }
}
