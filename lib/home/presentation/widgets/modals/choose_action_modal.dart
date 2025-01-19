import 'package:auto_route/auto_route.dart';
import 'package:bill_share/common/widgets/button.dart';
import 'package:bill_share/common/widgets/framed_button.dart';
import 'package:bill_share/common/widgets/modals/modal_sheet_structure.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ChooseActionModal extends StatelessWidget {
  final Function onCreate;
  final Function onJoin;
  const ChooseActionModal({
    super.key,
    required this.onCreate,
    required this.onJoin,
  });

  @override
  Widget build(BuildContext context) {
    return ModalSheetStructure(
        title: T(context).choose,
        description: T(context).create_or_join_group,
        body: Column(
          children: [
            Button(
              text: T(context).join,
              onPressed: () async {
                await context.maybePop();
                onJoin();
              },
            ),
            FramedButton(
              text: T(context).create,
              onPressed: () async {
                await context.maybePop();
                onCreate();
              },
            )
          ],
        ));
  }
}
