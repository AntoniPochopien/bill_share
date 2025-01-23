import 'package:flutter/material.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';

class FramedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final bool maxWidth;
  final String? iconUrl;
  final IconData? iconData;
  final bool isLoading;

  const FramedButton({
    super.key,
    this.onPressed,
    required this.text,
    this.maxWidth = true,
    this.iconUrl,
    this.iconData,
    this.isLoading = false,
  }) : assert(iconUrl == null || iconData == null,
            'Only one of iconUrl or iconData can be passed at a time');

  Widget _buildChild() {
    final progressIndicator = const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(color: AppColors.black));

    final child = isLoading
        ? progressIndicator
        : Text(
            text,
            style: Font.h4DarkMedium,
          );

    if (iconUrl != null || iconData != null) {
      return Row(children: [
        _buildIcon()!,
        Expanded(child: Center(child: child)),
        SizedBox(width: 20),
      ]);
    } else if (maxWidth) {
      return SizedBox(width: double.infinity, child: Center(child: child));
    } else {
      return child;
    }
  }

  Widget? _buildIcon() {
    if (iconUrl != null) {
      return Image.asset(iconUrl!, width: 20, height: 20);
    }
    if (iconData != null) {
      return SizedBox(
          height: 20, width: 20, child: Icon(iconData, color: AppColors.black));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.all(12),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: AppColors.transparent,
            shadowColor: AppColors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: AppColors.grey))),
        onPressed: onPressed,
        child: _buildChild(),
      ),
    );
  }
}
