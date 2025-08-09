import 'package:bmi/core/app_color.dart';
import 'package:bmi/features/screen_result/widgets/info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/custom_button.dart';

class BMIResultDialog extends StatelessWidget {
  final double bmi;
  final double weight;
  final double height;
  final int age;
  final String gender;
  final String category;
  final Color color;

  const BMIResultDialog({
    Key? key,
    required this.bmi,
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
    required this.category,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double minWeight = 18.5 * (height / 100) * (height / 100);
    double maxWeight = 24.9 * (height / 100) * (height / 100);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      backgroundColor: AppColor.background_dialog,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Container(
            width: 480.w,
            height: 400.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // BMI
                Text(
                  'Your BMI:',
                  style: TextStyle(fontSize: 20.sp, fontFamily: 'RobotoMedium', color: Colors.black87),
                ),
                SizedBox(height: 8.h),
                Text(bmi.toStringAsFixed(1),
                  style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.bold, color: color),
                ),
                SizedBox(height: 4.h),

                // Category
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: color),
                  ),
                ),
                SizedBox(height: 10.h),

                Divider(),
                SizedBox(height: 8.h),

                // Info.
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16,
                  runSpacing: 8,
                  children: [
                    InfoItem(label: 'Weight', value: '${weight.toStringAsFixed(0)} kg'),
                    InfoItem(label: 'Height', value: '${height.toStringAsFixed(0)} cm'),
                    InfoItem(label: 'Age', value: '$age'),
                    InfoItem(label: 'Gender',value:  gender),
                  ],
                ),
                SizedBox(height: 10.h),

                // Healthy
                Text(
                  'Healthy weight for the height:',
                  style: TextStyle(fontFamily: 'RobotoMedium', fontSize: 16.sp, color: Colors.black),
                ),
                Text(
                  '${minWeight.toStringAsFixed(1)} kg - ${maxWeight.toStringAsFixed(1)} kg',
                  style: TextStyle(fontFamily: 'RobotoSemiBold', fontSize: 16.sp, color: Colors.green[800]),
                ),
                SizedBox(height: 20.h),

                // Button
                CustomButton(
                  title: 'Close',
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
