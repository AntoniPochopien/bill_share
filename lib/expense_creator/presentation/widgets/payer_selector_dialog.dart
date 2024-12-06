import 'package:bill_share/common/widgets/button.dart';
import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/group_members_screen/presentation/widgets/member_tile.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class PayerSelectorDialog extends StatefulWidget {
  final GroupMember actualPayer;
  final List<GroupMember> groupMembers;
  const PayerSelectorDialog(
      {super.key, required this.actualPayer, required this.groupMembers});

  @override
  State<PayerSelectorDialog> createState() => _PayerSelectorDialogState();
}

class _PayerSelectorDialogState extends State<PayerSelectorDialog> {
  late GroupMember? payer;

  @override
  void initState() {
    super.initState();
    payer = widget.actualPayer;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWithUnderscore(title: 'Select payer'),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.groupMembers.length,
                  itemBuilder: (context, index) {
                    final member = widget.groupMembers[index];
                    final isSelected = widget.groupMembers[index] == payer;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: isSelected
                                    ? AppColors.green
                                    : AppColors.transparent),
                          ),
                          child: MemberTile(
                              groupMember: member,
                              onTap: () => setState(() => payer = member))),
                    );
                  }),
            ),
            Button(text: 'Ok', onPressed: () => context.maybePop(payer)),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
