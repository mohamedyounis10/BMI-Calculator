import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const InfoItem({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style:  TextStyle(
            fontFamily: 'RobotoSemiBold',
            color: Color(0xff519234),
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'RobotoSemiBold',
            fontSize: 14.sp,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
