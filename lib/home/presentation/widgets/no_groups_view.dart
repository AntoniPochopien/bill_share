import 'package:bill_share/common/widgets/logo.dart';
import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';
import 'package:bill_share/home/presentation/helpers/open_group_creator_modal.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class NoGroupsView extends StatelessWidget {
  const NoGroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    final baseDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppColors.grey),
    );

    final defaultPinTheme = PinTheme(
      height: 42,
      width: 42,
      decoration: baseDecoration,
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: baseDecoration.copyWith(
        border: Border.all(width: 2, color: AppColors.green),
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Logo(size: 87),
        Column(children: [
          TitleWithUnderscore(
            title: T(context).enter_group_code,
            description: T(context).join_existing_group_description,
          ),
          SizedBox(height: 28),
          Pinput(
            length: 6,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 19),
            child: Text(T(context).or_text),
          ),
          GestureDetector(
              onTap: () => openGroupCreatorModal(context),
              child: Text(T(context).create_group, style: Font.h4Green))
        ]),
        SizedBox(),
      ],
    );
  }
}
