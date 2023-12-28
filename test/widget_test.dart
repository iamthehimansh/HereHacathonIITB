import 'dart:convert';

import '../lib/modals/task_model.dart';

void main() {
  List<Task> _taskList = [
    Task(
      taskName: 'Develop a Navbar for the Fan website',
      taskPersentage: 75,
      dailyTask: true,
      taskTime: '10:00',
      taskDate: '10/10/2021',
      taskCat: 'Office work',
    ),
    Task(
      taskName: 'Fix a bug in Here’s Hackathon app',
      taskPersentage: 30,
      dailyTask: true,
      taskTime: '10:00',
      taskDate: '10/10/2021',
      taskCat: 'Office work',
    ),
    Task(
      taskName: 'Buy Apple 2kg',
      taskPersentage: 0,
      dailyTask: true,
      taskTime: '10:00',
      taskDate: '10/10/2021',
      taskCat: 'Home',
    ),
    Task(
      taskName: 'Win IITB Here’s Hackathon',
      taskPersentage: 95,
      dailyTask: true,
      taskTime: '10:00',
      taskDate: '10/10/2021',
      taskCat: 'Hackathon',
    ),
    Task(
      taskName: 'Pick up Son from School',
      taskPersentage: 100,
      dailyTask: true,
      taskTime: '10:00',
      taskDate: '10/10/2021',
      taskCat: 'Child',
    ),
  ];
  List<Map<String, dynamic>> _taskListMap = [];
  for (var i = 0; i < _taskList.length; i++) {
    _taskListMap.add(_taskList[i].toMap());
  }
  print(json.encode(_taskListMap));
}
