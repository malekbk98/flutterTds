import 'package:flutter/material.dart';
import 'package:todolist/models/Task.dart';
import 'package:select_form_field/select_form_field.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({
    Key? key,
    required this.updateTask,
  }) : super(key: key); //constrcuteur

  final Function updateTask;

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  Task? clickedTask;
  late String taskStatus;

  @override
  Widget build(BuildContext context) {
    final Task? task = ModalRoute.of(context)!.settings.arguments as Task?;
    taskStatus = task!.completed.toString();
    final _formKey = GlobalKey<FormState>();
    TextEditingController taskDesc = TextEditingController();
    taskDesc = TextEditingController(text: task.content);

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
                    widget.updateTask(
                      Task(
                        task.id,
                        taskDesc.text,
                        taskStatus.toLowerCase() == 'true',
                        DateTime.now(),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Task updated')),
                    );
                    Navigator.pushNamed(
                      context,
                      '/',
                    );
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
