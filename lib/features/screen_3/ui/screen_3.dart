import 'package:bmi/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:simple_ruler_picker/simple_ruler_picker.dart';
import '../../../core/custom_button.dart';
import '../../screen_result/logic/bmi_calculator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../screen_result/ui/bmi_result.dart';
import '../widgets/custom_counter_box.dart';


class Screen3 extends StatefulWidget {
  final String gender;

  const Screen3({Key? key, required this.gender}) : super(key: key);

  @override
  State<Screen3> createState() => _Screen_3State();
}

class _Screen_3State extends State<Screen3> {
  // Initial  Values
  int weight = 65;
  int age = 25;
  double height = 170;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),

                  // Title and Back Icon
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('BMI',
                              style: TextStyle(
                                  fontSize: 32.sp,
                                  fontFamily: 'RobotoSemiBold',
                                  color: Color(0xffFFB534))),
                          SizedBox(width: 5.w),
                          Text('Calculator',
                              style: TextStyle(
                                  fontSize: 32.sp,
                                  fontFamily: 'RobotoSemiBold',
                                  color: Color(0xff65B741))),
                        ],
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.arrow_back_ios, color: Color(0xff65B741), size: 28),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 2),
                          child: TextButton(
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                            child:InkWell(
                              onTap: (){
                                SystemNavigator.pop();
                              },
                              borderRadius: BorderRadius.circular(12.r),
                              child:Text(
                                'Exit',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontFamily: 'RobotoMedium',
                                  color: Color(0xff65B741),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  Text('Please Modify the values',
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontFamily: 'RobotoMedium',
                          color: Colors.black)),
                  SizedBox(height: 30.h),

                  // Weight & Age
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Weight
                      Flexible(
                        flex:1,
                        child:
                      CustomCounterBox(
                        label: 'Weight',
                        value: weight.toString(),
                        onMinus: () {
                          setState(() {
                            if (weight > 0) weight--;
                          });
                        },
                        onPlus: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                      ),

                      SizedBox(width: 10.w),

                      // Age
                      Flexible(
                        flex:1,
                        child:
                      CustomCounterBox(
                        label: 'Age',
                        value: age.toString(),
                        onMinus: () {
                          setState(() {
                            if (age > 0) age--;
                          });
                        },
                        onPlus: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  // Height
                  Container(
                    width: 370.w,
                    height: 220.h,
                    decoration: BoxDecoration(
                      color: AppColor.background_card,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 5.h),
                        Text('Height (cm)',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'RobotoMedium',
                                color: Color(0xffACACAC))),
                        SizedBox(height: 5.h),
                        Text('${height.toInt()}',
                            style: TextStyle(
                                fontSize: 48.sp,
                                fontFamily: 'RobotoSemiBold',
                                fontWeight: FontWeight.bold,
                                color: Color(0xffCE922A))),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SimpleRulerPicker(
                            height: 120.h,
                            minValue: 50,
                            maxValue: 300,
                            initialValue: height.toInt(),
                            selectedColor: Color(0xffCE922A),
                            lineStroke: 3,
                            longLineHeight: 50.h,
                            shortLineHeight: 25.h,
                            scaleItemWidth: 20,
                            lineColor: Color(0xffC4C4C4),
                            onValueChanged: (value) {
                              setState(() {
                                height = value.toDouble();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15.h),

                  // Continue Button
                  CustomButton(
                    title: 'Calculate',
                    onPressed: () {
                      final calculator = BMICalculator(weightKg: weight, heightCm: height);
                      final bmi = calculator.bmi;
                      final category = BMICalculator.getBMICategory(bmi);
                      final color = BMICalculator.getBMIColor(bmi);

                      showDialog(
                        context: context,
                        builder: (_) => BMIResultDialog(
                          bmi: bmi,
                          weight: weight.toDouble(),
                          height: height.toDouble(),
                          age: age,
                          gender: widget.gender,
                          category: category,
                          color: color,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }

}
