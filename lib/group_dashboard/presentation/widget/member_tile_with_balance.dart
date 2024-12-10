import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';
import 'package:bill_share/group_dashboard/domain/member_with_balance.dart';
import 'package:bill_share/group_members_screen/presentation/widgets/member_tile.dart';
import 'package:flutter/material.dart';

class MemberTileWithBalance extends StatelessWidget {
  final MemberWithBalance memberWithBalance;
  const MemberTileWithBalance({
    super.key,
    required this.memberWithBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MemberTile(groupMember: memberWithBalance.groupMember),
          Expanded(
            child: Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text:
                        memberWithBalance.value < 0 ? 'To pay' : 'To recive:'),
                TextSpan(
                  text: ' ${memberWithBalance.value.abs()}\$',
                  style: memberWithBalance.value < 0
                      ? Font.h4RedSemiBold
                      : Font.h4GreenSemiBold,
                ),
              ])),
            ),
          )
        ],
      ),
    );
  }
}
