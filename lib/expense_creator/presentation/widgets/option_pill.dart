import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';
import 'package:flutter/material.dart';

class OptionPill extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onTap;
  const OptionPill({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      AnimatedContainer(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? AppColors.black : AppColors.transparent,
        ),
        duration: Duration(milliseconds: 300),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              text,
              style: isSelected ? Font.h4BrightMedium : Font.h4DarkMedium,
            ),
          ),
        ),
      ),
      Positioned.fill(
          child: Material(
        color: AppColors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => onTap(),
        ),
      ))
    ]);
  }
}
