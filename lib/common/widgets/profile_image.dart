import 'package:bill_share/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String? imageUrl;
  final double? size;
  const ProfileImage({super.key, this.imageUrl, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.lightBlue,
      ),
      child: imageUrl == null
          ? Icon(Icons.question_mark, color: AppColors.white)
          : Image.network(imageUrl!),
    );
  }
}
