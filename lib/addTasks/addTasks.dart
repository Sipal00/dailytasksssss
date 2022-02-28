import 'package:dailytasksssss/addTasks/TasksFormWidget.dart';
import 'package:dailytasksssss/addTasks/provider/taskProvider.dart';
import 'package:dailytasksssss/constants/colors.dart';
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
              const Text(
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
        iconData: Icons.favorite_border,
        title: title,
        description: description,
        bgColor: kRedLight,
        iconColor: kRedDark,
        btnColor: kRed,
        left: 0,
        done: 10,
        desc: [
          {
            "time": "09:00",
            "title": " something ",
            "slot": "09:00 - 10:00",
            "tlColor": kBlueDark,
            "bgColor": kBlueLight,
          },
          {
            "time": "11:00",
            "title": "Work at Computer",
            "slot": "11:00 - 12:00",
            "tlColor": kYellowDark,
            "bgColor": kYellowLight,
          },
          {
            "time": "13:00",
            "title": "  ",
            "slot": " ",
            "tlColor": Colors.grey.withOpacity(0.1)
          },
          {
            "time": "14:00",
            "title": "Eat Something",
            "slot": "14:00 - 15:00",
            "tlColor": kRedDark,
            "bgColor": kRedLight,
          },
          {
            "time": "15:00",
            "title": "  ",
            "slot": " ",
            "tlColor": Colors.grey.withOpacity(0.1)
          },
          {
            "time": "16:00",
            "title": "  ",
            "slot": " ",
            "tlColor": Colors.grey.withOpacity(0.1)
          },
          {
            "time": "17:00",
            "title": "  ",
            "slot": " ",
            "tlColor": Colors.grey.withOpacity(0.1)
          },
          {
            "time": "18:00",
            "title": "Use social media",
            "slot": "18:00 - 19:00",
            "tlColor": kRedDark,
            "bgColor": kRedLight,
          },
        ],
        createdTime: DateTime.now(),
      );
      final provider = Provider.of<TasksProvider>(context, listen: false);
      provider.addTask(task);

      Navigator.of(context).pop();
    }
  }
}
