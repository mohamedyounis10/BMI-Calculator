import 'package:bmi/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import '../../../cubit/logic.dart';
import '../../screen_2/ui/screen_2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Animation setup
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward(); // Start animation

    // Timer to move to next screen after 3 seconds
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Screen2()),
        );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Center(
        child: FadeTransition( // You can change this to ScaleTransition or SlideTransition
          opacity: _animation,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'BMI',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontFamily: 'RobotoSemiBold',
                  color: Color(0xffFFB534),
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                'Calculator',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontFamily: 'RobotoSemiBold',
                  color: Color(0xff65B741),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
