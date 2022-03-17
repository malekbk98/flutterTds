import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_detail.dart';
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:todolist/models/Task.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key, required this.title})
      : super(key: key); //constrcuteur

  final String title;
  static String get route => '/all_tasks';

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
                          String msg = "";
                          //Wait until api response (async)
                          tasksCollection.del(clickedTask!).then((value) {
                            if (value == true) {
                              //Success delete from api
                              msg = "Task deleted";
                            } else {
                              //Api response !=200
                              msg = "Ops! Something went wrong, Try again";
                            }

                            //Show msg
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(msg),
                              ),
                            );
                          });

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
    Navigator.pushNamed(
      context,
      '/create_task',
    );
  }
}
