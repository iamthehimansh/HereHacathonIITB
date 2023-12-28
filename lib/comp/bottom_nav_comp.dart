import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNav extends StatelessWidget {
  int activeIndex = 0;
  BottomNav({
    super.key,
    this.activeIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 104.w, bottom: 5.h, right: 104.w),
        // margin: EdgeInsets.only(left: 104.w, bottom: 46.h, right: 104.w),
        height: 51.h,
        width: 195.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            navBtn(() {
              Navigator.pushNamed(
                context,
                '/home',
              );
            }, Icons.home, activeIndex == 0),
            navBtn(() {
              Navigator.pushNamed(context, '/task');
            }, Icons.task_alt, activeIndex == 1),
            navBtn(() {
              Navigator.pushNamed(context, '/profile');
            }, Icons.person, activeIndex == 2)
          ],
        ));
  }

  Expanded navBtn(Function onPressed, IconData icon, bool active) {
    return Expanded(
      child: Container(
        //boder radius 30px
        decoration: BoxDecoration(
          color: active ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: IconButton(
          onPressed: () {
            onPressed();
          },
          icon: Icon(
            icon,
            color: active ? Colors.white : Color(0xff9299A1),
          ),
        ),
      ),
    );
  }
}
