import 'package:bill_share/common/widgets/logo.dart';
import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:bill_share/constants/font.dart';
import 'package:bill_share/home/application/join_group_cubit/join_group_cubit.dart';
import 'package:bill_share/home/presentation/helpers/open_group_creator_modal.dart';
import 'package:bill_share/home/presentation/widgets/enter_group_code.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoGroupsView extends StatelessWidget {
  const NoGroupsView({super.key});

  @override
  Widget build(BuildContext context) {
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
            EnterGroupCode(joinGroupCubit: context.read<JoinGroupCubit>()),
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
