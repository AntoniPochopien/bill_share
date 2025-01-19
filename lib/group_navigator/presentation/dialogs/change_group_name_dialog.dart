import 'package:auto_route/auto_route.dart';
import 'package:bill_share/common/utils/validators.dart';
import 'package:bill_share/common/widgets/billshare_text_field.dart';
import 'package:bill_share/common/widgets/button.dart';
import 'package:bill_share/common/widgets/framed_button.dart';
import 'package:bill_share/common/widgets/title_with_underscore.dart';
import 'package:bill_share/group_navigator/application/cubit/group_cubit.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeGroupNameDialog extends StatefulWidget {
  final GroupCubit groupCubit;
  const ChangeGroupNameDialog({super.key, required this.groupCubit});

  @override
  State<ChangeGroupNameDialog> createState() => _ChangeGroupNameDialogState();
}

class _ChangeGroupNameDialogState extends State<ChangeGroupNameDialog> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.groupCubit,
      child: BlocBuilder<GroupCubit, GroupState>(
        builder: (context, state) => Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TitleWithUnderscore(
                    title: T(context).update_group_name,
                    description: T(context).change_group_name_description,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: BillshareTextField(
                      controller: _controller,
                      label: T(context).group_name,
                      validator: (v) =>
                          Validators.groupNameValidator(context, v),
                    ),
                  ),
                  Button(
                    text: T(context).update,
                    isLoading: _isLoading,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => _isLoading = true);
                        await context
                            .read<GroupCubit>()
                            .updateGroupName(_controller.text);
                        if (context.mounted) {
                          context.maybePop();
                        }
                      }
                    },
                  ),
                  FramedButton(
                      text: T(context).cancel,
                      onPressed: () => context.maybePop()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
