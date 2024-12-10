import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';
import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  final String title;
  final double value;
  final Gradient gradient;
  const InfoBox({
    super.key,
    required this.gradient,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1, 5),
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              title,
              style: Font.h4BrightMedium,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
          child: Text(
            '$value\$',
            style: Font.h1BrightMedium,
          ),
        )
      ]),
    );
  }
}
