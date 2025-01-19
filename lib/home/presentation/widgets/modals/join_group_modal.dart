import 'package:auto_route/auto_route.dart';
import 'package:bill_share/common/widgets/modals/modal_sheet_structure.dart';
import 'package:bill_share/home/application/join_group_cubit/join_group_cubit.dart';
import 'package:bill_share/home/presentation/widgets/enter_group_code.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JoinGroupModal extends StatelessWidget {
  final JoinGroupCubit joinGroupCubit;
  const JoinGroupModal({super.key, required this.joinGroupCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: joinGroupCubit,
      child: BlocListener<JoinGroupCubit, JoinGroupState>(
        listener: (context, state) {
          state.whenOrNull(joined: (newGroup) => context.maybePop());
        },
        child: ModalSheetStructure(
          title: T(context).join_group,
          description: T(context).join_existing_group_description,
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: EnterGroupCode(
                joinGroupCubit: joinGroupCubit,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
