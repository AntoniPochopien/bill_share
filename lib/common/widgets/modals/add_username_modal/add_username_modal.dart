import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:bill_share/common/utils/validators.dart';
import 'package:bill_share/common/widgets/billshare_text_field.dart';
import 'package:bill_share/common/widgets/button.dart';
import 'package:bill_share/common/widgets/modals/add_username_modal/application/username_cubit/username_cubit.dart';
import 'package:bill_share/common/widgets/modals/modal_sheet_structure.dart';
import 'package:bill_share/di.dart';
import 'package:bill_share/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

class AddUsernameModal extends StatefulWidget {
  const AddUsernameModal({super.key});

  @override
  State<AddUsernameModal> createState() => _AddUsernameModalState();
}

class _AddUsernameModalState extends State<AddUsernameModal> {
  final _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UsernameCubit(iAuthRepository: getIt<IAuthRepository>()),
      child: BlocConsumer<UsernameCubit, UsernameState>(
        listener: (context, state) {
          state.whenOrNull(added: () => context.maybePop());
        },
        builder: (context, state) => ModalSheetStructure(
            onPopInvokedWithResult: (_, __) =>
                state.maybeWhen(added: () => true, orElse: () => false),
            title: T(context).add_username,
            description: T(context).introduce_yourself,
            body: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BillshareTextField(
                      controller: _usernameController,
                      label: T(context).username,
                      validator: (v) =>
                          Validators.usernameValidator(context, v),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                    Button(
                        isLoading: state.maybeWhen(
                            orElse: () => false, loading: () => true),
                        text: T(context).add,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<UsernameCubit>()
                                .updateUsername(_usernameController.text);
                          }
                        }),
                  ]),
            )),
      ),
    );
  }
}
