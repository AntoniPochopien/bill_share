import 'package:bill_share/common/widgets/profile_image.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';
import 'package:bill_share/group_navigator/domain/group_info.dart';
import 'package:flutter/material.dart';

class GroupAppbar extends StatelessWidget implements PreferredSizeWidget {
  final GroupInfo groupInfo;
  const GroupAppbar({super.key, required this.groupInfo});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                ProfileImage(
                  size: 25,
                  iconSize: 18,
                  backgroundColor: AppColors.green,
                ),
                SizedBox(width: 7),
                Text(groupInfo.name, style: Font.h4DarkSemiBold),
              ]),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
