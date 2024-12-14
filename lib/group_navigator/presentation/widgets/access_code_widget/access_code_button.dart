import 'package:bill_share/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AccessCodeButton extends StatelessWidget {
  final IconData iconData;
  final Function onTap;
  final bool isLoading;
  const AccessCodeButton({
    super.key,
    required this.iconData,
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.green,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: CircleAvatar(
          backgroundColor: AppColors.background,
          child: isLoading
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    color: AppColors.green,
                    strokeWidth: 2,
                  ),
                )
              : Icon(
                  iconData,
                  color: AppColors.green,
                ),
        ),
      ),
    );
  }
}
