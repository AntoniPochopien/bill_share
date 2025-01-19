import 'package:bill_share/common/utils/image_url_generator.dart';
import 'package:bill_share/common/widgets/profile_image.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/assets.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:flutter/material.dart';

class MemberTile extends StatelessWidget {
  final GroupMember groupMember;
  final void Function()? onTap;
  const MemberTile({super.key, required this.groupMember, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          ProfileImage(
            size: 47,
            imageUrl:
                ImageUrlGenerator.generatePublicImageUrl(groupMember.imageUrl),
          ),
          SizedBox(width: 16),
          Text(groupMember.username),
          SizedBox(width: 8),
          if (groupMember.isAdmin)
            Image.asset(
              Assets.crown,
              width: 16,
              height: 16,
            ),
        ]),
      ),
      Positioned.fill(
          child: Material(
        color: AppColors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
        ),
      ))
    ]);
  }
}
