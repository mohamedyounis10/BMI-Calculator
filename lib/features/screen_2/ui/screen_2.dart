import 'package:flutter/material.dart';
import '../../../core/custom_button.dart';
import '../../screen_3/ui/screen_3.dart';
import '../widgets/custom_gender_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Screen2 extends StatefulWidget{
  @override
  State<Screen2> createState() => _Screen_2State();
}

class _Screen_2State extends State<Screen2> {
  // Variables
  String? selectedGender;

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

              // Male
              CustomGenderCard(
                title: 'Male',
                imagePath: 'assets/images/img.png',
                iconPath: 'assets/images/img_2.png',
                selectedColor: Color(0xffDFF0D8),         // اللون لما يكون مختار
                defaultColor: Color(0xffF0F8EC),          // اللون العادي
                borderColor: Color(0xff65B741),           // لون البوردر + النص
                isSelected: selectedGender == 'male',
                onTap: () {
                  setState(() {
                    selectedGender = 'male';
                  });
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
                isSelected: selectedGender == 'female',
                onTap: () {
                  setState(() {
                    selectedGender = 'female';
                  });
                },
              ),

              SizedBox(height:5.h,),

              // Button
              CustomButton(
                title: 'Continue',
                onPressed: () {
                  if (selectedGender != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Screen3(gender: selectedGender!),
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
          ),
        )
      )
    );
  }
}
