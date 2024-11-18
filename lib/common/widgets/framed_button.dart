import 'package:flutter/material.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';

class FramedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final bool maxWidth;
  final String? iconUrl;

  const FramedButton({
    super.key,
    this.onPressed,
    required this.text,
    this.maxWidth = true,
    this.iconUrl,
  });

  Widget _buildChild() {
    final child = Text(
      text,
      style: Font.h4DarkMedium,
    );

    if (iconUrl != null) {
      return Row(children: [
        Image.asset(iconUrl!, width: 20, height: 20),
        Expanded(child: Center(child: child)),
        SizedBox(width: 20),
      ]);
    } else if (maxWidth) {
      return SizedBox(width: double.infinity, child: Center(child: child));
    } else {
      return child;
    }
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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: AppColors.grey))),
        onPressed: onPressed,
        child: _buildChild(),
      ),
    );
  }
}
