import 'package:dailytasksssss/addTasks/TasksFormWidget.dart';
import 'package:dailytasksssss/addTasks/provider/taskProvider.dart';
import 'package:dailytasksssss/models/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTasks extends StatefulWidget {
  const AddTasks({Key? key}) : super(key: key);

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Tasks',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 8),
              TasksFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onSavedTasks: addTask,
              ),
            ],
          ),
        ),
      );
  void addTask() {
    final isVaild = _formKey.currentState!.validate();
    if (!isVaild) {
      return;
    } else {
      final task = Task(
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );
      final provider = Provider.of<TasksProvider>(context, listen: false);
      provider.addTask(task);
      Navigator.of(context).pop();
    }
  }
}
