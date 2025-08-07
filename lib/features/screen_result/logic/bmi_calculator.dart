import 'package:flutter/material.dart';

class BMICalculator {
  final int weightKg;
  final double heightCm;

  BMICalculator({
    required this.weightKg,
    required this.heightCm,
  });

  // BMI Calculation
  double get bmi {
    double heightM = heightCm / 100;
    return weightKg / (heightM * heightM);
  }

  static String getBMICategory(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  static Color getBMIColor(double bmi) {
    if (bmi < 18.5) return Color(0xff84CDEE);
    if (bmi < 25) return Color(0xff519234);
    if (bmi < 30) return Color(0xffFFDF32);
    return Color(0xffF5554A);
  }
}
