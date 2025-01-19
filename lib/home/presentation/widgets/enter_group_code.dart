import 'package:bill_share/constants/app_colors.dart';
import 'package:bill_share/constants/font.dart';
import 'package:bill_share/home/application/join_group_cubit/join_group_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class EnterGroupCode extends StatelessWidget {
  final JoinGroupCubit joinGroupCubit;
  const EnterGroupCode({
    super.key,
    required this.joinGroupCubit,
  });

  @override
  Widget build(BuildContext context) {
    final baseDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppColors.grey),
    );

    final defaultPinTheme = PinTheme(
      height: 42,
      width: 42,
      decoration: baseDecoration,
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: baseDecoration.copyWith(
        border: Border.all(width: 2, color: AppColors.green),
      ),
    );

    final disabledPinTheme = defaultPinTheme.copyWith(
      textStyle: Font.h4Grey
          .copyWith(color: Font.h4Grey.color!.withValues(alpha: 0.4)),
      decoration: baseDecoration.copyWith(
          border: Border.all(color: AppColors.grey.withValues(alpha: 0.4))),
    );

    return BlocBuilder<JoinGroupCubit, JoinGroupState>(
      builder: (context, joinGroupState) => Pinput(
        length: 6,
        enabled:
            joinGroupState.maybeWhen(orElse: () => true, loading: () => false),
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        disabledPinTheme: disabledPinTheme,
        textCapitalization: TextCapitalization.characters,
        keyboardType: TextInputType.text,
        onCompleted: (value) =>
            context.read<JoinGroupCubit>().joinGroup(value.toUpperCase()),
      ),
    );
  }
}
