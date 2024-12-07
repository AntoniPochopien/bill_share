import 'package:bill_share/auth/domain/injectable_user.dart';
import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/expense_creator/domain/expense_creator_model.dart';
import 'package:bill_share/expense_creator/domain/i_expenses_repository.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_creator_state.dart';
part 'expense_creator_cubit.freezed.dart';

class ExpenseCreatorCubit extends Cubit<ExpenseCreatorState> {
  final InjectableUser injectableUser;
  final IExpensesRepository iexpensesRepository;
  ExpenseCreatorCubit({
    required this.injectableUser,
    required this.iexpensesRepository,
  }) : super(ExpenseCreatorState.initial());

  void init({required List<GroupMember> groupMembers, required int gorupId}) {
    final currentUser = groupMembers
        .where((element) => element.id == injectableUser.currentUser.id);
    if (currentUser.length == 1) {
      emit(ExpenseCreatorState.initialized(
        payer: currentUser.first,
        groupMembers: groupMembers,
        groupId: gorupId
      ));
    } else {
      emit(ExpenseCreatorState.error(Failure.unexpected()));
    }
  }

  void createExpense({required String title, required double amount}) async {
    if (state is _Initialized) {
      final s = state as _Initialized;
      emit(s.copyWith(isLoading: true));
      final result = await iexpensesRepository.saveExpense(ExpenseCreatorModel(
        groupId: s.groupId,
        title: title,
        amount: amount,
        payer: s.payer,
        beneficients: s.beneficiers,
      ));
      result.fold((l) => emit(ExpenseCreatorState.error(l)),
          (r) => emit(s.copyWith(created: true)));
    }
  }

  void updatePayer(GroupMember newPayer) {
    if (state is _Initialized) {
      final s = state as _Initialized;
      emit(s.copyWith(payer: newPayer));
    }
  }

  void addBeneficiers(List<GroupMember> groupMember) {
    if (state is _Initialized) {
      final s = state as _Initialized;
      final beneficiers = List<GroupMember>.from(s.beneficiers);
      emit(s.copyWith(beneficiers: beneficiers + groupMember));
    }
  }

  void removeBeneficier(GroupMember groupMember) {
    if (state is _Initialized) {
      final s = state as _Initialized;
      final beneficiers = List<GroupMember>.from(s.beneficiers);
      emit(s.copyWith(beneficiers: beneficiers..remove(groupMember)));
    }
  }

  void addAllBeneficiers() {
    if (state is _Initialized) {
      final s = state as _Initialized;
      emit(s.copyWith(beneficiers: s.groupMembers));
    }
  }

  void removeAllBeneficiers() {
    if (state is _Initialized) {
      final s = state as _Initialized;
      emit(s.copyWith(beneficiers: []));
    }
  }

  void setBeneficiersIsEmptyError(bool newValue) {
    if (state is _Initialized) {
      final s = state as _Initialized;
      emit(s.copyWith(beneficiersIsEmptyError: newValue));
    }
  }
}
