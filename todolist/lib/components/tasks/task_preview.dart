import 'package:flutter/material.dart';
import 'package:todolist/models/Task.dart';

class TaskPreview extends StatelessWidget {
  const TaskPreview({Key? key, required this.task}) : super(key: key);
  final Task task;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.content,
        style: const TextStyle(fontFamily: 'arial', fontSize: 20),
      ),
      subtitle: Text('Created at ${task.createdAt}'),
      trailing: task.completed
          ? const Icon(
              Icons.check_box_outline_blank_rounded,
              color: Colors.red,
            )
          : const Icon(
              Icons.check_box_rounded,
              color: Colors.green,
            ),
      onTap: () {},
    );
  }
}
