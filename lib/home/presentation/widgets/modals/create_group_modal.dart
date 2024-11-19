import 'package:bill_share/common/utils/validators.dart';
import 'package:bill_share/common/widgets/billshare_text_field.dart';
import 'package:bill_share/common/widgets/button.dart';
import 'package:bill_share/common/widgets/modals/modal_sheet_structure.dart';
import 'package:bill_share/di.dart';
import 'package:bill_share/home/application/group_creator_cubit/group_creator_cubit.dart';
import 'package:bill_share/home/domain/i_groups_repository.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateGroupModal extends StatefulWidget {
  const CreateGroupModal({super.key});

  @override
  State<CreateGroupModal> createState() => _CreateGroupModalState();
}

class _CreateGroupModalState extends State<CreateGroupModal> {
  final _groupNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GroupCreatorCubit(iGroupsRepository: getIt<IGroupsRepository>()),
      child: BlocBuilder<GroupCreatorCubit, GroupCreatorState>(
        builder: (context, state) => ModalSheetStructure(
            onPopInvokedWithResult: (_, __) =>
                state.maybeWhen(created: (_) => true, orElse: () => false),
            title: T(context).create_new_group,
            description: T(context).introduce_yourself,
            body: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BillshareTextField(
                      controller: _groupNameController,
                      label: T(context).group_name,
                      validator: (v) =>
                          Validators.usernameValidator(context, v),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                    Button(
                        isLoading: state.maybeWhen(
                            orElse: () => false, loading: () => true),
                        text: T(context).create,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<GroupCreatorCubit>()
                                .createGroup(_groupNameController.text);
                          }
                        }),
                  ]),
            )),
      ),
    );
  }
}