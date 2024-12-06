import 'package:bill_share/constants/font.dart';
import 'package:bill_share/expense_creator/application/cubit/expense_creator_cubit.dart';
import 'package:bill_share/expense_creator/presentation/widgets/beneficiers_selector_dialog.dart';
import 'package:bill_share/expense_creator/presentation/widgets/option_pill.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeneficientsSection extends StatefulWidget {
  final List<GroupMember> groupMembers;
  final List<GroupMember> beneficiers;
  final bool beneficiersIsEmptyError;
  const BeneficientsSection({
    super.key,
    required this.beneficiers,
    required this.groupMembers,
    required this.beneficiersIsEmptyError,
  });

  @override
  State<BeneficientsSection> createState() => _BeneficientsSectionState();
}

class _BeneficientsSectionState extends State<BeneficientsSection> {
  bool _areListsEqualAsSets(List<GroupMember> l1, List<GroupMember> l2) {
    final s1 = l1.toSet();
    final s2 = l2.toSet();
    return s1.containsAll(s2);
  }

  void _showBeneficiersSelector(
    BuildContext context, {
    required List<GroupMember> groupMembers,
    required List<GroupMember> selectedBeneficiers,
  }) async {
    final result = await showDialog<List<GroupMember>>(
      context: context,
      builder: (context) => BeneficiersSelectorDialog(
        groupMembers: groupMembers,
        alreadySelectedBEneficiers: selectedBeneficiers,
      ),
    );
    if (result != null && context.mounted) {
      context.read<ExpenseCreatorCubit>()
        ..removeAllBeneficiers()
        ..addBeneficiers(result);
      context.read<ExpenseCreatorCubit>().setBeneficiersIsEmptyError(false);
    }
  }

  bool _isSomeSelected(
      {required List<GroupMember> selectedBeneficiers,
      required List<GroupMember> groupMembers}) {
    if (selectedBeneficiers.isNotEmpty &&
        selectedBeneficiers.length != groupMembers.length) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          'Who needs to pay this back?',
          style: Font.h4Grey,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(children: [
          Expanded(
              flex: 3,
              child: OptionPill(
                  onTap: () {
                    context.read<ExpenseCreatorCubit>().addAllBeneficiers();
                    context
                        .read<ExpenseCreatorCubit>()
                        .setBeneficiersIsEmptyError(false);
                  },
                  text: 'All',
                  isSelected: _areListsEqualAsSets(
                    widget.beneficiers,
                    widget.groupMembers,
                  ))),
          Spacer(),
          Expanded(
              flex: 3,
              child: OptionPill(
                  onTap: () => _showBeneficiersSelector(
                        context,
                        groupMembers: widget.groupMembers,
                        selectedBeneficiers: widget.beneficiers,
                      ),
                  text: 'Some',
                  isSelected: _isSomeSelected(
                    selectedBeneficiers: widget.beneficiers,
                    groupMembers: widget.groupMembers,
                  ))),
        ]),
      ),
      if (widget.beneficiersIsEmptyError)
        Padding(
          padding: const EdgeInsets.only(left: 32, top: 4),
          child: Text('At least one beneficier needs to be selected', style: Font.h5Red,),
        )
    ]);
  }
}
