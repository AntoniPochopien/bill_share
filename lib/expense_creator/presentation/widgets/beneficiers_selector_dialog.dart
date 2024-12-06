import 'package:bill_share/common/widgets/button.dart';
import 'package:bill_share/common/widgets/framed_button.dart';
import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';
import 'package:bill_share/group_members_screen/presentation/widgets/member_tile.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class BeneficiersSelectorDialog extends StatefulWidget {
  final List<GroupMember> groupMembers;
  final List<GroupMember> alreadySelectedBEneficiers;
  const BeneficiersSelectorDialog(
      {super.key,
      required this.groupMembers,
      required this.alreadySelectedBEneficiers});

  @override
  State<BeneficiersSelectorDialog> createState() =>
      _BeneficiersSelectorDialogState();
}

class _BeneficiersSelectorDialogState extends State<BeneficiersSelectorDialog> {
  final List<GroupMember> _selectedBeneficiers = [];

  @override
  void initState() {
    super.initState();
    _selectedBeneficiers.addAll(widget.alreadySelectedBEneficiers);
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
            TitleWithUnderscore(title: 'Select beneficiers'),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.groupMembers.length,
                  itemBuilder: (context, index) {
                    final member = widget.groupMembers[index];
                    final isSelected = _selectedBeneficiers.contains(member);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Stack(children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: isSelected
                                      ? AppColors.green
                                      : AppColors.transparent),
                            ),
                            child: MemberTile(groupMember: member)),
                        Positioned.fill(
                            child: Material(
                          color: AppColors.transparent,
                          child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () => setState(() {
                                    isSelected
                                        ? _selectedBeneficiers.remove(member)
                                        : _selectedBeneficiers.add(member);
                                  })),
                        ))
                      ]),
                    );
                  }),
            ),
            Center(
                child: Text(
                    '${_selectedBeneficiers.length}/${widget.groupMembers.length}', style: Font.h4DarkSemiBold,)),
            FramedButton(
              text: 'Clear',
              onPressed: () => setState(() => _selectedBeneficiers.clear()),
            ),
            Button(
                text: 'Ok',
                onPressed: () => context.maybePop(_selectedBeneficiers)),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
