// Task class with task name , task persentage, daily task, task time, task date,task cat
import 'dart:convert';
import 'dart:io';

class Task {
  String taskName;
  int taskPersentage;
  bool dailyTask;
  String taskTime;
  String taskDate;
  String taskCat;

  Task({
    required this.taskName,
    required this.taskCat,
    this.taskPersentage = 0,
    this.dailyTask = false,
    this.taskTime = '',
    this.taskDate = '',
  });
  // inc persentage
  void incPersentage() {
    taskPersentage += 10;
  }

  void printAllInOneLine() {
    print(
        'Task name: $taskName, Task catgery: $taskCat, Task persentage: $taskPersentage, Daily task: $dailyTask, Task time: $taskTime, Task date: $taskDate');
  }

  Map<String, dynamic> toMap() {
    return {
      'taskName': taskName,
      'taskPersentage': taskPersentage,
      'dailyTask': dailyTask,
      'taskTime': taskTime,
      'taskDate': taskDate,
      'taskCaption': taskCat,
    };
  }

  // from map
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      taskName: map['taskName'],
      taskPersentage: map['taskPersentage'],
      dailyTask: map['dailyTask'],
      taskTime: map['taskTime'],
      taskDate: map['taskDate'],
      taskCat: map['taskCaption'],
    );
  }
}

class TaskArry {
  List<Task> taskList = [
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
  TaskArry({required this.taskList});
  void addTask(Task task) {
    taskList.add(task);
  }

  void removeTask(int index) {
    taskList.removeAt(index);
  }

  void incertTask(int index, Task task) {
    taskList.insert(index, task);
  }

  void incPersentage(int index) {
    taskList[index].incPersentage();
  }

  //save
  List<Map<String, dynamic>> save() {
    List<Map<String, dynamic>> _taskListMap = [];
    for (var i = 0; i < taskList.length; i++) {
      _taskListMap.add(taskList[i].toMap());
    }
    return _taskListMap;
  }

  // load
  void load(List<Map<String, dynamic>> _taskListMap) {
    for (var i = 0; i < _taskListMap.length; i++) {
      taskList.add(Task.fromMap(_taskListMap[i]));
    }
  }

  //  save to file
  void saveToFile() async {
    final _localFile = File('assets/data/task.json');
    final file = await _localFile;
    await file.writeAsString(jsonEncode(save()));

    print('saved to file');
  }

  // load from file
  void loadFromFile() async {
    final _localFile = File('assets/data/task.json');
    final file = await _localFile;
    final _taskListMap = jsonDecode(await file.readAsString());
    load(_taskListMap);
    print('loaded from file');
  }

  //use
}
