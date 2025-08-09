import 'dart:ui';
import 'package:bmi/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/bmi_calculator.dart';

class BmiLogic extends Cubit<BmiState>{
  BmiLogic() : super(InitState());

  // Variables
  String? gender;
  int age = 25;
  int height = 170;
  int weight  = 65;

  void select_Gender(String selectedGender) {
    gender = selectedGender;
    emit(SelectGender(gender!));
  }

  void Increment_Age(){
    age++;
    emit(IncrementAge(age));
  }

  void Decrement_Age(){
    if (age <= 0) {
      age = 0;
    } else {
      age--;
    }
    emit(DecrementAge(age));
  }

  void Increment_Weight(){
    weight++;
    emit(IncrementWeight(weight));
  }

  void Decrement_Weight(){
    if (weight <= 0) {
      weight = 0;
    } else {
      weight--;
    }
    emit(DecrementWeight(weight));
  }

  void Increment_height(int newHeight){
    height = newHeight;
    emit(IncrementHeight(height));
  }

  void Decrement_height(){
    if (height <= 0) {
      height = 0;
    } else {
      height--;
    }
    emit(DecrementHeight(height));
  }

  double calculateBMI() {
    BMICalculator calc = BMICalculator(
      weightKg: weight,
      heightCm: height.toDouble(),
    );
    return calc.bmi;
  }

  String getBMICategory() {
    return BMICalculator.getBMICategory(calculateBMI());
  }

  Color getBMIColor() {
    return BMICalculator.getBMIColor(calculateBMI());
  }
}