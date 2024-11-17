import 'package:flutter/material.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';

class Button extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final bool maxWidth;

  const Button({
    super.key,
    this.onPressed,
    required this.text,
    this.maxWidth = true,
  });
  
  @override
  Widget build(BuildContext context) {
    final child = Text(
      text,
      style: Font.h4Bright,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(12),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: AppColors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: onPressed,
        child: maxWidth
            ? SizedBox(width: double.infinity, child: Center(child: child))
            : child,
      ),
    );
  }
}
