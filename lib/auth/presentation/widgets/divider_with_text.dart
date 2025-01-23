import 'package:flutter/material.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';

class DividerWithText extends StatelessWidget {
  final String text;
  const DividerWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 19.5),
      child: Row(children: [
        Expanded(flex: 2, child: Divider(color: AppColors.grey)),
        Expanded(
            flex: 3,
            child: Center(
                child: Text(
              text,
              style: Font.h4Grey,
              textAlign: TextAlign.center,
            ))),
        Expanded(flex: 2, child: Divider(color: AppColors.grey)),
      ]),
    );
  }
}
