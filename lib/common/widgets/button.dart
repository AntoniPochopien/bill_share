import 'package:flutter/material.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';

class Button extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final bool maxWidth;
  final bool isLoading;

  const Button({
    super.key,
    this.onPressed,
    required this.text,
    this.maxWidth = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final t = Text(
      text,
      style: Font.h4Bright,
    );
    final progressIndicator = const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(color: AppColors.white));
    final child = isLoading ? progressIndicator : t;
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
            ? SizedBox(
                width: double.infinity,
                child: Center(child: isLoading ? progressIndicator : child))
            : isLoading
                ? progressIndicator
                : child,
      ),
    );
  }
}
