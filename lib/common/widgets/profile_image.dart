import 'dart:io';

import 'package:bill_share/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

class ProfileImage extends StatelessWidget {
  final String? imageUrl;
  final XFile? imageFile;
  final double? size;
  final double? iconSize;
  final Color? backgroundColor;
  final Function? onTap;
  const ProfileImage({
    super.key,
    this.imageUrl,
    this.imageFile,
    this.size,
    this.iconSize,
    this.backgroundColor,
    this.onTap,
  });

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: size,
        height: size,
      ),
    );
  }

  Widget _buildImage() {
    if (imageFile != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.file(
          File(imageFile!.path),
          fit: BoxFit.cover,
        ),
      );
    } else if (imageUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          imageUrl!,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return _buildShimmerEffect();
            }
          },
        ),
      );
    } else {
      return Icon(
        Icons.question_mark,
        size: iconSize,
        color: AppColors.white,
      );
    }
  }

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
        child: _buildImage(),
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
