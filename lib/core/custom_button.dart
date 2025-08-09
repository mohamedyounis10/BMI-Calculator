import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 63.h,
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(const Color(0xff65B741)),
        ),
        child: Text(
          title,
          style:  TextStyle(
            fontSize: 32.sp,
            fontFamily: 'RobotoSemiBold',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
