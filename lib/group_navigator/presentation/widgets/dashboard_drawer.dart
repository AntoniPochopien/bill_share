import 'package:bill_share/auth/domain/injectable_user.dart';
import 'package:bill_share/common/utils/image_url_generator.dart';
import 'package:bill_share/common/widgets/logout_button.dart';
import 'package:bill_share/common/widgets/profile_image.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';
import 'package:bill_share/di.dart';
import 'package:bill_share/group_navigator/application/cubit/group_cubit.dart';
import 'package:bill_share/group_navigator/domain/group_data.dart';
import 'package:bill_share/group_navigator/presentation/widgets/access_code_widget/access_code_widget.dart';
import 'package:bill_share/group_navigator/presentation/dialogs/change_group_name_dialog.dart';
import 'package:bill_share/home/presentation/widgets/dialogs/update_profile_dialog.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:bill_share/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardDrawer extends StatelessWidget {
  final bool isAdmin;
  final GroupData groupData;
  const DashboardDrawer({
    super.key,
    required this.isAdmin,
    required this.groupData,
  });

  @override
  Widget build(BuildContext context) {
    final groupInfo = groupData.groupInfo;
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
                      child: Stack(children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        groupInfo.name,
                        style: Font.h2DarkSemiBold,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    if (isAdmin)
                      Positioned.fill(
                          child: Material(
                        color: AppColors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (ctx) => ChangeGroupNameDialog(
                                      groupCubit: context.read<GroupCubit>(),
                                    ));
                          },
                        ),
                      )),
                  ])),
                  SizedBox(width: 20),
                  ProfileImage(
                    size: 66,
                    iconSize: 18,
                    backgroundColor: AppColors.green,
                    imageUrl: ImageUrlGenerator.generatePublicImageUrl(
                        groupInfo.imageUrl),
                    onTap: isAdmin
                        ? () => context.read<GroupCubit>().selectGroupImage()
                        : null,
                  ),
                ]),
              ),
              AccessCodeWidget(groupInfo: groupInfo),
              Column(children: [
                ListTile(
                  onTap: () => context.router.replaceAll([HomeRoute()]),
                  title: Text(T(context).switch_group),
                  trailing: Icon(Icons.swap_vert_rounded),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.grey,
                ),
                ListTile(
                  onTap: () => showDialog(
                      context: context,
                      builder: (ctx) => UpdateProfileDialog(
                          onUpdate: (newUsername, newImage) async => context
                              .read<GroupCubit>()
                              .updateUserProfile(
                                  newUsername: newUsername, newImage: newImage),
                          user: getIt<InjectableUser>().currentUser)),
                  title: Text(T(context).profile),
                  trailing: Icon(Icons.person),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.grey,
                ),
                ListTile(
                  onTap: () => context.pushRoute(SettingsRoute()),
                  title: Text(T(context).settings),
                  trailing: Icon(Icons.settings),
                ),
              ]),
              LogoutButton(),
            ]),
      ),
    );
  }
}
