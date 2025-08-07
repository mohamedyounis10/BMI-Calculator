import 'package:bmi/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCounterBox extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  const CustomCounterBox({
    Key? key,
    required this.label,
    required this.value,
    required this.onMinus,
    required this.onPlus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 150.h,
      decoration: BoxDecoration(
        color: AppColor.background_card,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style:  TextStyle(
                fontSize: 16.sp,
                fontFamily: 'RobotoMedium',
                color: Color(0xffACACAC),
              ),
            ),
            Text(
              value,
              style:  TextStyle(
                fontSize: 48.sp,
                fontFamily: 'RobotoSemiBold',
                fontWeight: FontWeight.bold,
                color: Color(0xffCE922A),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(onTap: onMinus, child: _buildMinusIcon()),
                 SizedBox(width: 25.w),
                InkWell(onTap: onPlus, child: _buildPlusIcon()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMinusIcon() {
    return _buildCircularIcon(
      child: Container(
        width: 30.w,
        height: 6.h,
        decoration: BoxDecoration(
          color: const Color(0xFFA07B3F),
          borderRadius: BorderRadius.circular(3.r),
        ),
      ),
    );
  }

  Widget _buildPlusIcon() {
    return _buildCircularIcon(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 30.w,
            height: 6.h,
            decoration: BoxDecoration(
              color: const Color(0xFFA07B3F),
              borderRadius: BorderRadius.circular(3.r),
            ),
          ),
          Container(
            width: 6.w,
            height: 30.h,
            decoration: BoxDecoration(
              color:  Color(0xFFA07B3F),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularIcon({required Widget child}) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}
