import 'package:bill_share/common/widgets/logo.dart';
import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';
import 'package:bill_share/home/application/join_group_cubit/join_group_cubit.dart';
import 'package:bill_share/home/presentation/helpers/open_group_creator_modal.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    final disabledPinTheme = defaultPinTheme.copyWith(
      textStyle: Font.h4Grey
          .copyWith(color: Font.h4Grey.color!.withValues(alpha: 0.4)),
      decoration: baseDecoration.copyWith(
          border: Border.all(color: AppColors.grey.withValues(alpha: 0.4))),
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Logo(size: 87),
          Column(children: [
            TitleWithUnderscore(
              title: T(context).enter_group_code,
              description: T(context).join_existing_group_description,
            ),
            SizedBox(height: 28),
            BlocBuilder<JoinGroupCubit, JoinGroupState>(
              builder: (context, joinGroupState) => Pinput(
                length: 6,
                enabled: joinGroupState.maybeWhen(
                    orElse: () => true, loading: () => false),
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                disabledPinTheme: disabledPinTheme,
                textCapitalization: TextCapitalization.characters,
                keyboardType: TextInputType.text,
                onCompleted: (value) => context
                    .read<JoinGroupCubit>()
                    .joinGroup(value.toUpperCase()),
              ),
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
      ),
    );
  }
}
