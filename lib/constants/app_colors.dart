import 'package:flutter/material.dart';

class AppColors {
  static const black = Colors.black;
  static const white = Colors.white;
  static const background = Color(0xFFF5FAFB);
  static const grey = Color(0xFF818181);
  static const green = Color(0xFF43D77C);
  static const lightBlue = Colors.lightBlueAccent;
  static const transparent = Colors.transparent;
  static const errorRed = Color(0xFFC35656);
  static const blueGradientDark = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF2596BE),
        Color(0xFF114558),
      ]);
  static const blueGradientLight = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF7CC5FA),
        Color(0xFF497594),
      ]);
  static const greenGradient =
      RadialGradient(center: Alignment.bottomRight, radius: 1.5, colors: [
    AppColors.white,
    AppColors.green,
  ]);
  static const redGradient =
      RadialGradient(center: Alignment.bottomRight, radius: 1.5, colors: [
    AppColors.white,
    AppColors.errorRed,
  ]);
  
}
