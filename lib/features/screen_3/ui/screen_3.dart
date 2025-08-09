import 'package:bmi/core/app_color.dart';
import 'package:bmi/cubit/logic.dart';
import 'package:bmi/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ruler_picker/simple_ruler_picker.dart';
import '../../../core/custom_button.dart';
import '../../../logic/bmi_calculator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../screen_result/ui/bmi_result.dart';
import '../widgets/custom_counter_box.dart';


class Screen3 extends StatelessWidget {

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

                  BlocBuilder<BmiLogic,BmiState>(
                      builder: (context,state){
                        return Column(
                          children: [
                            // Weight & Age
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Weight
                                Expanded(
                                  child:
                                  CustomCounterBox(
                                    label: 'Weight',
                                    value: context.read<BmiLogic>().weight.toString(),
                                    onMinus: () {
                                      context.read<BmiLogic>().Decrement_Weight();
                                    },
                                    onPlus: () {
                                      context.read<BmiLogic>().Increment_Weight();
                                    },
                                  ),
                                ),

                                SizedBox(width: 10.w),

                                // Age
                                Expanded(child:
                                CustomCounterBox(
                                  label: 'Age',
                                  value: context.read<BmiLogic>().age.toString(),
                                  onMinus: () {
                                    context.read<BmiLogic>().Decrement_Age();
                                  },
                                  onPlus: () {
                                    context.read<BmiLogic>().Increment_Age();
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
                                  Text('${context.read<BmiLogic>().height.toInt()}',
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
                                      initialValue: context.read<BmiLogic>().height.toInt(),
                                      selectedColor: Color(0xffCE922A),
                                      lineStroke: 3,
                                      longLineHeight: 50.h,
                                      shortLineHeight: 25.h,
                                      scaleItemWidth: 20,
                                      lineColor: Color(0xffC4C4C4),
                                      onValueChanged: (value) {
                                        context.read<BmiLogic>().Increment_height(value.toInt());
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
                                final cubit = context.read<BmiLogic>();

                                final calculator = BMICalculator(
                                  weightKg: cubit.weight,
                                  heightCm: cubit.height.toDouble(),
                                );

                                final bmi = calculator.bmi;
                                final category = BMICalculator.getBMICategory(bmi);
                                final color = BMICalculator.getBMIColor(bmi);

                                showDialog(
                                  context: context,
                                  builder: (_) => BMIResultDialog(
                                    bmi: bmi,
                                    weight: cubit.weight.toDouble(),
                                    height: cubit.height.toDouble(),
                                    age: cubit.age,
                                    gender: cubit.gender ?? 'not selected',
                                    category: category,
                                    color: color,
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      }
                  ),
                ],
              ),
            ),
          ),
        ));
  }

}
