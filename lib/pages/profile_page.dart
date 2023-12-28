// import all
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../comp/bottom_nav_comp.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = '';
  String gender = '';
  int age = 0;

  @override
  Widget build(BuildContext context) {
    // Sacfold page with floating  tab bar at bottom with three icons
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNav(
        activeIndex: 2,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile Details',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.h),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            SizedBox(height: 16.h),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Gender',
              ),
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
            SizedBox(height: 16.h),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Age',
              ),
              onChanged: (value) {
                setState(() {
                  age = int.parse(value);
                });
              },
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                // Save profile details offline
                // TODO: Implement offline storage logic here
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
