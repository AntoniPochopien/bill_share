import 'dart:async';

import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/group_navigator/domain/expenses/expense.dart';
import 'package:bill_share/group_navigator/domain/expenses/expense_event.dart';
import 'package:bill_share/group_navigator/domain/group_data.dart';
import 'package:bill_share/group_navigator/domain/i_group_repository.dart';
import 'package:bill_share/local_storage/domain/i_local_storage_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_state.dart';
part 'group_cubit.freezed.dart';

class GroupCubit extends Cubit<GroupState> {
  final ILocalStorageRepository iLocalStorageRepository;
  final IGroupRepository iGroupRepository;
  GroupCubit({
    required this.iLocalStorageRepository,
    required this.iGroupRepository,
  }) : super(GroupState.initial());

  StreamSubscription<ExpenseEvent>? _expensesSubscription;

  void init(int groupId) async {
    await iLocalStorageRepository.saveLastGroupId(groupId);
    final membersResult = await iGroupRepository.fetchGroupMembers(groupId);
    final expensesResult = await iGroupRepository.fetchGroupExpenses(groupId);
    final expensesObserver = iGroupRepository.observeExpenses(groupId);
    expensesResult.fold(
        (l) => GroupState.error(l),
        (expenses) => membersResult.fold(
              (l) => emit(GroupState.error(l)),
              (members) => emit(GroupState.data(
                  groupData: GroupData(
                      id: groupId, members: members, expenses: expenses))),
            ));
    expensesObserver.fold(
      (l) {},
      (r) =>
          _expensesSubscription = r.listen((event) => _expensesListener(event)),
    );
  }

  void _expensesListener(ExpenseEvent event) {
    if (state is _Data) {
      final s = state as _Data;
      final expenses = List<Expense>.from(s.groupData.expenses);
      event.when(
          insert: (expense) => emit(s.copyWith(
              groupData:
                  s.groupData.copyWith(expenses: expenses..add(expense)))),
          update: (expense) {
            final index =
                expenses.indexWhere((element) => element.id == expense.id);
            if (index > 0) {
              expenses.removeAt(index);
              expenses.insert(index, expense);
              emit(s.copyWith(
                  groupData: s.groupData.copyWith(expenses: expenses)));
            }
          },
          delete: (id) {
            final index = expenses.indexWhere((element) => element.id == id);
            if (index > 0) {
              expenses.removeAt(index);
              emit(s.copyWith(
                  groupData: s.groupData.copyWith(expenses: expenses)));
            }
          });
    }
  }

  @override
  Future<void> close() async {
    await _expensesSubscription?.cancel();
    return super.close();
  }
}
