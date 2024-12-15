import 'package:bill_share/common/widgets/logout_button.dart';
import 'package:bill_share/common/widgets/profile_image.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';
import 'package:bill_share/group_navigator/domain/group_info.dart';
import 'package:bill_share/group_navigator/presentation/widgets/access_code_widget/access_code_widget.dart';
import 'package:bill_share/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class DashboardDrawer extends StatelessWidget {
  final bool isAdmin;
  final GroupInfo groupInfo;
  const DashboardDrawer({
    super.key,
    required this.isAdmin,
    required this.groupInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Expanded(
                      child: Text(
                    groupInfo.name,
                    style: Font.h2DarkSemiBold,
                    textAlign: TextAlign.end,
                  )),
                  SizedBox(width: 20),
                  ProfileImage(
                    size: 66,
                    iconSize: 18,
                    backgroundColor: AppColors.green,
                  ),
                ]),
              ),
              AccessCodeWidget(groupInfo: groupInfo),
              Column(children: [
                ListTile(
                  onTap: () => context.router.replaceAll([HomeRoute()]),
                  title: Text('Switch group'),
                  trailing: Icon(Icons.swap_vert_rounded),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.grey,
                ),
                ListTile(
                  onTap: () {},
                  title: Text('Profile'),
                  trailing: Icon(Icons.person),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.grey,
                ),
                ListTile(
                  onTap: () {},
                  title: Text('Settings'),
                  trailing: Icon(Icons.settings),
                ),
              ]),
              LogoutButton(),
            ]),
      ),
    );
  }
}
