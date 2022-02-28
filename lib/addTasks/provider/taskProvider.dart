import 'package:dailytasksssss/constants/colors.dart';
import 'package:dailytasksssss/models/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TasksProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(
        title: "Personal",
        bgColor: kYellowLight,
        iconColor: kYellowDark,
        btnColor: kYellow,
        left: 3,
        done: 1,
        iconData: Icons.person_rounded,
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
        ]),
    Task(
        iconData: Icons.cases_rounded,
        title: "Work",
        bgColor: kRedLight,
        iconColor: kRedDark,
        btnColor: kRed,
        left: 0,
        done: 0,
        desc: [
          {
            "time": "13:00",
            "title": "  ",
            "slot": " ",
            "tlColor": Colors.grey.withOpacity(0.1)
          },
          {
            "time": "14:00",
            "title": " ",
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
            "tlColor": kYellowDark,
            "bgColor": kYellowLight,
          },
          {
            "time": "17:00",
            "title": "  ",
            "slot": " ",
            "tlColor": Colors.grey.withOpacity(0.1)
          },
          {
            "time": "18:00",
            "title": "  ",
            "slot": " ",
            "tlColor": Colors.grey.withOpacity(0.1)
          },
          {
            "time": "19:00",
            "title": "doing something",
            "slot": "19:00 - 20:00",
            "tlColor": kBlueDark,
            "bgColor": kBlueLight,
          },
          {
            "time": "20:00",
            "title": "something  ",
            "slot": "20:00 - 21:00",
            "tlColor": kBlueDark,
            "bgColor": kBlueLight,
          }
        ]),
    Task(
      iconData: Icons.favorite_rounded,
      title: "Health",
      bgColor: kBlueLight,
      iconColor: kBlueDark,
      btnColor: kBlue,
      left: 0,
      done: 0,
    ),
    Task(isLast: true)
  ];
  List<Task> get tasks => _tasks.where((task) => task.isDone == false).toList();

  List<Task> get tasksCompleted =>
      _tasks.where((task) => task.isDone == true).toList();

  void addTask(Task task) {
    _tasks.add(task);

    notifyListeners();
  }

  void updateTask(Task task, String title, String description) {
    task.title = title;
    task.desc = description as List<Map<String, dynamic>>?;

    notifyListeners();
  }
}
