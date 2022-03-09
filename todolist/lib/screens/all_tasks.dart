import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_detail.dart';
import 'package:todolist/data/tasks.dart' as data;
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/data/tasks_collection.dart';
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

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksCollection>(
      builder: (context, tasksCollection, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                if (clickedTask != null)
                  TaskDetail(
                    task: clickedTask,
                    deletedTask: () {
                      setState(
                        () {
                          tasksCollection.del(clickedTask!);
                          //Hide task details
                          clickedTask = null;
                        },
                      );
                    },
                  ),
                Flexible(
                  child: TaskMaster(
                    tasks: tasksCollection.getAllTasks(),
                    clicked: clickedTask,
                    clickedTask: (Task task) {
                      setState(
                        () {
                          //click 1 to show task | click 2 to hide task
                          if (task == clickedTask) {
                            clickedTask = null;
                          } else {
                            clickedTask = task;
                          }
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
              addRandTask();
            },
            tooltip: 'Add a task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  void addRandTask() {
    var faker = Faker();
    var task = Task(
      random.integer(9999),
      faker.lorem.sentence(),
      random.boolean(),
      faker.date.dateTime(minYear: 2020, maxYear: 2022),
    );
    setState(() {
      data.tasks.insert(0, task);
    });
  }
}
