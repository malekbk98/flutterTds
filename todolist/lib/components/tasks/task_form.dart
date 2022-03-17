import 'package:flutter/material.dart';
import 'package:todolist/models/Task.dart';
import 'package:select_form_field/select_form_field.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({
    Key? key,
    this.task,
    required this.updateTask,
  }) : super(key: key);

  final Task? task;
  final Function updateTask;

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  String taskStatus = "false";
  TextEditingController taskDesc = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      taskDesc = TextEditingController(text: widget.task!.content);
      taskStatus = widget.task!.completed.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Lorem ipsum',
                  labelText: 'Task Description',
                ),
                controller: taskDesc,
                validator: (description) {
                  if (description!.isEmpty) {
                    return 'Description is required';
                  }
                  return null;
                },
              ),
              SelectFormField(
                type: SelectFormFieldType.dropdown, // or can be dialog
                initialValue: taskStatus,
                labelText: 'Shape',
                onChanged: (val) => taskStatus = val,
                items: const [
                  {
                    'value': true,
                    'label': 'Completed',
                    'icon': Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    'textStyle': TextStyle(color: Colors.green),
                  },
                  {
                    'value': false,
                    'label': 'Pending',
                    'icon': Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                    'textStyle': TextStyle(color: Colors.red),
                  }
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (widget.task != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            const Text('Please confirm deleting this task'),
                        action: SnackBarAction(
                          label: 'Confirm',
                          onPressed: () {
                            widget.updateTask(
                              taskDesc.text,
                              taskStatus.toLowerCase() == 'true',
                            );
                            Navigator.pushNamed(
                              context,
                              '/',
                            );
                          },
                        ),
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Task updated"),
                        ),
                      );
                    } else {
                      widget.updateTask(
                        taskDesc.text,
                        taskStatus.toLowerCase() == 'true',
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Task added"),
                        ),
                      );
                      Navigator.pushNamed(
                        context,
                        '/',
                      );
                    }
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
