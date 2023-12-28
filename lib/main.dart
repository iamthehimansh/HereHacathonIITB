import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/core.engine.dart';
import 'package:here_sdk/core.errors.dart';
import 'package:heres_hacathon_iitb_team_5g_only/pages/map_route.dart';
import 'package:heres_hacathon_iitb_team_5g_only/pages/profile_page.dart';
import 'package:heres_hacathon_iitb_team_5g_only/pages/task_page.dart';
import '../pages/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void _initializeHERESDK() async {
  // Needs to be called before accessing SDKOptions to load necessary libraries.
  SdkContext.init(IsolateOrigin.main);

  // Set your credentials for the HERE SDK.
  String accessKeyId = "J5rjN0er4W5VjpwMuLAUUg";
  String accessKeySecret =
      "wYOPHcnrmulpk6WD-3TFwnnjgIUaw9WPsYzhFIdee3MvwJ0QkPmAX9Xm59LuwY-FWLcuFcQgaaDw_SPFcE4gYQ";
  SDKOptions sdkOptions =
      SDKOptions.withAccessKeySecret(accessKeyId, accessKeySecret);

  try {
    await SDKNativeEngine.makeSharedInstance(sdkOptions);
  } on InstantiationException {
    throw Exception("Failed to initialize the HERE SDK.");
  }
}

void main() {
  _initializeHERESDK();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),

          initialRoute: '/home',
          routes: {
            '/home': (context) => const HomePage(),
            '/task': (context) => const TaskPage(),
            '/profile': (context) => const ProfilePage(),
            '/map': (context) => MapRoute()
          },
        );
      },
    );
  }
}
