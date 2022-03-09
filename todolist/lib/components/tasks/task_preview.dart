import 'package:flutter/material.dart';
import 'package:todolist/models/Task.dart';

typedef void IntCallback(int id);

class TaskPreview extends StatelessWidget {
  const TaskPreview(
      {Key? key,
      required this.task,
      required this.clickedTask,
      required this.selected})
      : super(key: key);
  final Task task;
  final Function clickedTask;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: selected ? Color.fromARGB(255, 204, 211, 205) : Colors.white,
      title: Text(
        task.content,
        style: const TextStyle(fontFamily: 'arial', fontSize: 20),
      ),
      subtitle: Text('Created at ${task.createdAt}'),
      trailing: task.completed
          ? const Icon(
              Icons.check_box_rounded,
              color: Colors.green,
            )
          : const Icon(
              Icons.check_box_outline_blank_rounded,
              color: Colors.red,
            ),
      onTap: () {
        clickedTask(task);
      },
    );
  }
}
