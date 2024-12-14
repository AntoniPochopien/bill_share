import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';
import 'package:bill_share/group_navigator/application/cubit/group_cubit.dart';
import 'package:bill_share/group_navigator/domain/group_info.dart';
import 'package:bill_share/group_navigator/presentation/widgets/access_code_widget/access_code_button.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccessCodeWidget extends StatefulWidget {
  final GroupInfo groupInfo;
  const AccessCodeWidget({super.key, required this.groupInfo});

  @override
  State<AccessCodeWidget> createState() => _AccessCodeWidgetState();
}

class _AccessCodeWidgetState extends State<AccessCodeWidget> {
  bool regenerateAccessCodeLoading = false;
  bool lockingLoading = false;

  String _formatCode(String value) =>
      ' ${value.substring(0, 3)} ${value.substring(3)} ';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(children: [
        TitleWithUnderscore(
          title: 'Access code',
          description: 'Give this code, someone who wants to join the group',
        ),
        Blur(
          blur: widget.groupInfo.locked ? 5 : 0,
          colorOpacity: widget.groupInfo.locked ? 0.5 : 0,
          blurColor: AppColors.background,
          child: GestureDetector(
            onLongPress: () async {
              if (widget.groupInfo.locked) {
                return;
              }
              HapticFeedback.mediumImpact();
              await Clipboard.setData(
                  ClipboardData(text: widget.groupInfo.accessCode));
            },
            child: Text(
              _formatCode(widget.groupInfo.accessCode),
              style: Font.h1DarkSemiBold,
            ),
          ),
        ),
        SizedBox(height: 16),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (!widget.groupInfo.locked)
            Row(children: [
              AccessCodeButton(
                iconData: Icons.refresh,
                isLoading: regenerateAccessCodeLoading,
                onTap: () async {
                  setState(() => regenerateAccessCodeLoading = true);
                  await context.read<GroupCubit>().regenerateAccessCode();
                  setState(() => regenerateAccessCodeLoading = false);
                },
              ),
              SizedBox(width: 16),
            ]),
          AccessCodeButton(
            iconData: widget.groupInfo.locked
                ? Icons.lock_open_outlined
                : Icons.lock_outline,
            isLoading: lockingLoading,
            onTap: () async {
              setState(() => lockingLoading = true);
              await context.read<GroupCubit>().toggleLock();
              setState(() => lockingLoading = false);
            },
          ),
        ])
      ]),
    );
  }
}
