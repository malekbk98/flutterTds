import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:todolist/components/tasks/task_detail.dart';
import 'package:todolist/data/tasks.dart' as data;
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/models/Task.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key, required this.title})
      : super(key: key); //constrcuteur

  final String title;

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  Task? clickedTask;
  bool initTask = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            if (clickedTask != null) TaskDetail(task: clickedTask),
            Flexible(
              child: TaskMaster(
                tasks: data.tasks,
                clickedTask: (Task task) {
                  setState(
                    () {
                      clickedTask = task;
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddRandTask();
        },
        tooltip: 'Add a task',
        child: const Icon(Icons.add),
      ),
    );
  }

  void AddRandTask() {
    var faker = Faker();
    var task = Task(
      random.integer(9999),
      faker.lorem.sentence(),
      random.boolean(),
      faker.date.dateTime(minYear: 2020, maxYear: 2022),
    );
    setState(() {
      data.tasks.add(task);
    });
  }
}
