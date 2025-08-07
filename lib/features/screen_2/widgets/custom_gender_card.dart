import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGenderCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String iconPath;
  final Color selectedColor;
  final Color defaultColor;
  final Color borderColor;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomGenderCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.iconPath,
    required this.selectedColor,
    required this.defaultColor,
    required this.borderColor,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(25.r),
        child: Container(
          width: 400.w,
          height: 150.h,
          decoration: BoxDecoration(
            color: isSelected ? selectedColor : defaultColor,
            borderRadius: BorderRadius.circular(25.r),
            border: isSelected ? Border.all(color: borderColor, width: 3.w) : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 35.sp,
                  fontFamily: 'RobotoSemiBold',
                  color: borderColor,
                ),
              ),
              SizedBox(width: 40.w),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 114.w,
                    height: 114.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.r,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child: Transform.scale(
                        scale: 1.3,
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -15,
                    left: -15,
                    child: Container(
                      width: 56.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(iconPath),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4.r,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
