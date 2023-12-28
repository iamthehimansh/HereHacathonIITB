// import all
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heres_hacathon_iitb_team_5g_only/modals/task_model.dart';
import '../comp/bottom_nav_comp.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  // List of task
  List<Task> _taskList = [
    // Task(
    //   taskName: 'Canteeen',
    //   taskPersentage: 75,
    //   dailyTask: true,
    //   taskTime: '10:00',
    //   taskDate: '10/10/2021',
    //   taskCat: 'Personal',
    // ),
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
    // Task(
    //   taskName: 'Library',
    //   taskPersentage: 75,
    //   dailyTask: true,
    //   taskTime: '10:00',
    //   taskDate: '10/10/2021',
    //   taskCat: 'Personal',
    // ),
  ];
  //
  TextEditingController _taskNameController = TextEditingController();
  TextEditingController _taskNameController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Sacfold page with floating  tab bar at bottom with three icons
    return Scaffold(
      body: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Top bar with title Your Task
          Container(
            margin: EdgeInsets.only(top: 67.h, left: 24.w),
            child: Text(
              'Your Task',
              style: TextStyle(
                fontSize: 29.sp,
                color: Colors.black,
                fontFamily: 'Krona One',
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          // Container for task list
          SizedBox(
            height: 680.h,
            child: ReorderableListView.builder(
                itemBuilder: buildItems,
                itemCount: _taskList.length,
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final Task item = _taskList.removeAt(oldIndex);
                    _taskList.insert(newIndex, item);
                  });
                }),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTask();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildItems(context, index) {
    return Container(
        key: ValueKey(index),
        margin: EdgeInsets.only(bottom: 24.h, right: 8.w, left: 8.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Container(
          padding: EdgeInsets.all(10.r),
          child: Container(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Text(_taskList[index].taskCat,
                          style: TextStyle(
                              fontSize: 12.sp, color: Color(0xff9299A1))),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 13.w, top: 10.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.task_alt,
                            color: Color(0xff9299A1),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(_taskList[index].taskName,
                                      overflow: TextOverflow.clip,
                                      softWrap: true,
                                      maxLines: 3,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Color(0xff3F3F3F))),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
                // bg filled x %
                ,

                // Positioned(
                //   right: 0,
                //   top: 0,
                //   child: Container(
                //     height: double.infinity,
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       color: Color(0xffFFD600),
                //     ),
                //     child: Center(),
                //   ),
                // )
              ],
            ),
          ),
        ));
  }

  void _addTask() {
    // Show a dialog to add a new task
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _taskNameController,
                decoration: InputDecoration(hintText: 'Enter task name'),
              ),
              TextField(
                controller: _taskNameController2,
                decoration: InputDecoration(hintText: 'Enter task Catagory'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add the new task to the list
                setState(() {
                  _taskList.add(
                    Task(
                      taskName: _taskNameController.text,
                      taskPersentage: 0,
                      dailyTask: false,
                      taskCat: _taskNameController2.text,
                    ),
                  );
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
