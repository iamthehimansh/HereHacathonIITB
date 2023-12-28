// import all
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heres_hacathon_iitb_team_5g_only/modals/task_model.dart';
import '../comp/bottom_nav_comp.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double long = 0;
  double lat = 0;
  @override
  Widget build(BuildContext context) {
    // Sacfold page with floating  tab bar at bottom with three icons
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(children: [
            Text(
              "Explore Possibilities,\nAchieve Tasks Here!",
              style: TextStyle(color: Colors.blue, fontSize: 30.sp),
            ),
            // Show the location of the user by city name
            Text(
              "IITB H14",
              style: TextStyle(color: Colors.grey, fontSize: 18.sp),
            ),

            Expanded(
                child: TaskDo(
              name: "You can do these tasks now!",
              lat: lat,
              long: long,
            )),
          ]),
        ),
        bottomNavigationBar: BottomNav(
          activeIndex: 0,
        ),
      ),
    );
  }
}

class TaskDo extends StatefulWidget {
  final String name;
  double long;
  double lat;
  TaskDo({
    super.key,
    required this.name,
    required this.long,
    required this.lat,
    // this.taskList,
  });

  @override
  State<TaskDo> createState() => _TaskDoState();
}

class _TaskDoState extends State<TaskDo> {
  List<dynamic> taskList = [
    {
      "canDo": true,
      "task": {
        "name": "Fix a bug in Here's Hackathon app",
        "category": "Office work",
        "percentage": 30,
        "daily": true,
        "time": "10:00",
        "date": "10/10/2021"
      },
      "location": {
        "name": "Sai Aashirwad Co op Housing Society",
        "latitude": 19.18754,
        "longitude": 72.83815
      },
      "estimatedTime": 60,
      "instructions":
          "Head to Sai Aashirwad Co op Housing Society. Find a comfortable spot and connect to the available Wi-Fi. Open the Here's Hackathon app and start debugging the identified bug. Refer to the bug report for details on the issue and follow the debugging process outlined in the project's documentation."
    },
    {
      "canDo": true,
      "task": {
        "name": "Buy Apple 2kg",
        "category": "Home",
        "percentage": 0,
        "daily": true,
        "time": "10:00",
        "date": "10/10/2021"
      },
      "location": {
        "name": "Scharmi Foods",
        "latitude": 19.18749,
        "longitude": 72.83813
      },
      "estimatedTime": 15,
      "instructions":
          "Visit Scharmi Foods to purchase 2kg of apples. Look for the Fresh Fruits section and choose the best-quality apples available. Use the provided weighing scale to measure 2kg and proceed to the billing counter for payment."
    },
    {
      "canDo": true,
      "task": {
        "name": "Win IITB Here's Hackathon",
        "category": "Hackathon",
        "percentage": 95,
        "daily": true,
        "time": "10:00",
        "date": "10/10/2021"
      },
      "location": {
        "name": "Augustin Tea Stall",
        "latitude": 19.18749,
        "longitude": 72.83813
      },
      "estimatedTime": 120,
      "instructions":
          "Head to Augustin Tea Stall and find a comfortable seating area. Use the available Wi-Fi to access the Here's Hackathon platform. Review the hackathon challenges and start working on your project. Make sure to allocate enough time for brainstorming, coding, and testing to increase your chances of winning."
    },
    {
      "canDo": true,
      "task": {
        "name": "Pick up Son from School",
        "category": "Child",
        "percentage": 100,
        "daily": true,
        "time": "10:00",
        "date": "10/10/2021"
      },
      "location": {
        "name": "Jagmagia Centre",
        "latitude": 19.18759,
        "longitude": 72.83818
      },
      "estimatedTime": 30,
      "instructions":
          "Head to Jagmagia Centre, which is the location of your son's school. Ensure that you arrive on time to pick up your son. Coordinate with the school staff to collect your son from his classroom and complete any necessary sign-out procedures."
    }
  ];

//init method

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    var headersList = {
      'Accept': '*/*',
    };
    var url = Uri.parse(
        'https://9eaac3b30c29046cb758d9273bdf2832.serveo.net/AiGetSearchQueries/suggest/');
    TaskArry arr = TaskArry(taskList: []);
    // arr.loadFromFile();
    List<Map> _taskList = [
      Task(
        taskName: 'cafe',
        taskPersentage: 75,
        dailyTask: true,
        taskTime: '10:00',
        taskDate: '10/10/2021',
        taskCat: 'Personal',
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
    ].map((e) => e.toMap()).toList();
    arr.taskList.forEach((element) {
      _taskList.add(element.toMap());
    });
    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
// position.latitude.toString()
// position.longitude.toString()
    var body = {
      'userTask': json.encode(_taskList),
      'lat': '19.129872',
      'long': '72.918697'
    };
    var l = false;
    while (l != true) {
      var res = await http
          .post(
            url,
            headers: headersList,
            body: body,
          )
          .then((value) => value.body)
          .then((value) {
        print("loadData");

        final resBody = value;
        l = true;
        setState(() {
          try {
            taskList = jsonDecode(resBody);
          } catch (e) {
            print(e);
          }
        });

        // if (res.statusCode >= 200 && res.statusCode < 300) {
        //   print(resBody);
        // } else {
        //   print(res.reasonPhrase);
        // }
      });
    }
    // req.headers.addAll();
    // req.fields.addAll(body);
    // print("loadData");

    // var res = await req.send();
  }

  @override
  Widget build(BuildContext context) {
    // Sacfold page with floating  tab bar at bottom with three icons
    return Container(
      color: Color(0xffeeeeee),
      child: SingleChildScrollView(
        child: Column(children: [
          Text(
            widget.name,
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
          for (var i = 0; i < taskList.length; i++)
            if (taskList[i]["canDo"] == true)
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/map',
                      arguments: taskList[i]["location"]);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        taskList[i]["task"]["name"],
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 25),
                      ),
                      Text(
                        taskList[i]["instructions"],
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                      Text(
                        "${taskList[i]["estimatedTime"]} minutes",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ],
                  ),
                ),
              ),
        ]),
      ),
    );
  }
}
