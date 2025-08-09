import 'package:bmi/cubit/logic.dart';
import 'package:bmi/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/custom_button.dart';
import '../../screen_3/ui/screen_3.dart';
import '../widgets/custom_gender_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Screen2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h,),

                      // Text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('BMI' , style: TextStyle(
                              fontSize: 32.sp,
                              fontFamily: 'RobotoSemiBold',
                              color: Color(0xffFFB534)
                          ),),
                          SizedBox(width: 5.w,),
                          Text('Calculator' , style: TextStyle(
                              fontSize: 32.sp,
                              fontFamily: 'RobotoSemiBold',
                              color: Color(0xff65B741)
                          ),),
                        ],
                      ),
                      SizedBox(height:30.h,),

                      // Text
                      Text('Please choose your gender' , style: TextStyle(
                          fontSize: 24.sp,
                          fontFamily: 'RobotoMedium',
                          color: Colors.black
                      ),),
                      SizedBox(height:20.h,),

                      BlocBuilder<BmiLogic,BmiState>(
                        builder: (context,state){
                          return Column(
                            children: [
                              // Male
                              CustomGenderCard(
                                title: 'Male',
                                imagePath: 'assets/images/img.png',
                                iconPath: 'assets/images/img_2.png',
                                selectedColor: Color(0xffDFF0D8),
                                defaultColor: Color(0xffF0F8EC),
                                borderColor: Color(0xff65B741),
                                isSelected: context.read<BmiLogic>().gender == 'male',
                                onTap: () {
                                  context.read<BmiLogic>().select_Gender('male');
                                },
                              ),

                              // Female
                              CustomGenderCard(
                                title: 'Female',
                                imagePath: 'assets/images/img_1.png',
                                iconPath: 'assets/images/img_3.png',
                                selectedColor: Color(0xffFFF8E1),
                                defaultColor: Color(0xffFBF6EE),
                                borderColor: Color(0xffCE922A),
                                isSelected: context.read<BmiLogic>().gender == 'female',
                                onTap: () {
                                  context.read<BmiLogic>().select_Gender('female');
                                },
                              ),

                              SizedBox(height:5.h,),

                              // Button
                              CustomButton(
                                title: 'Continue',
                                onPressed: () {
                                  if (context.read<BmiLogic>().gender != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Screen3(),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Please select your gender first')),
                                    );
                                  }
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
          )
      )
    );
  }
}