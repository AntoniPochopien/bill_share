import 'package:bill_share/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String? imageUrl;
  final double? size;
  final double? iconSize;
  final Color? backgroundColor;
  final Function? onTap;
  const ProfileImage({
    super.key,
    this.imageUrl,
    this.size,
    this.iconSize,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor ?? AppColors.lightBlue,
        ),
        child: imageUrl == null
            ? Icon(Icons.question_mark, size: iconSize, color: AppColors.white)
            : ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
      ),
      Positioned.fill(
          child: Material(
        color: AppColors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap == null ? null : () => onTap!(),
        ),
      ))
    ]);
  }
}
