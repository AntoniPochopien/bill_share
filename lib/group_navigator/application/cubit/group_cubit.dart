import 'dart:async';
import 'dart:developer';

import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/expense_creator/domain/i_expenses_repository.dart';
import 'package:bill_share/group_dashboard/domain/dashboard_data.dart';
import 'package:bill_share/group_navigator/domain/expenses/expense.dart';
import 'package:bill_share/group_navigator/domain/expenses/expense_event.dart';
import 'package:bill_share/group_navigator/domain/group_data.dart';
import 'package:bill_share/group_navigator/domain/group_info.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:bill_share/group_navigator/domain/i_group_repository.dart';
import 'package:bill_share/local_storage/domain/i_local_storage_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_state.dart';
part 'group_cubit.freezed.dart';

class GroupCubit extends Cubit<GroupState> {
  final ILocalStorageRepository iLocalStorageRepository;
  final IGroupRepository iGroupRepository;
  final IExpensesRepository iExpensesRepository;
  GroupCubit({
    required this.iLocalStorageRepository,
    required this.iGroupRepository,
    required this.iExpensesRepository,
  }) : super(GroupState.initial());

  StreamSubscription<ExpenseEvent>? _expensesSubscription;

  void init(int groupId) async {
    final results = await Future.wait([
      iGroupRepository.fetchGroupInfo(groupId),
      iGroupRepository.fetchGroupMembers(groupId),
      iExpensesRepository.fetchGroupExpenses(groupId),
      iGroupRepository.fetchDashboardData(groupId),
    ]);
    final groupInfoResult = results[0] as Either<Failure, GroupInfo>;
    final membersResult = results[1] as Either<Failure, List<GroupMember>>;
    final expensesResult = results[2] as Either<Failure, List<Expense>>;
    final dashboardDataResult = results[3] as Either<Failure, DashboardData>;
    final expensesObserver = iExpensesRepository.observeExpenses(groupId);
    expensesResult.fold(
        (l) => GroupState.error(l),
        (expenses) => dashboardDataResult.fold(
              (l) => GroupState.error(l),
              (dashboardData) => membersResult.fold(
                (l) => emit(GroupState.error(l)),
                (members) => groupInfoResult
                    .fold((l) => emit(GroupState.error(l)), (groupInfo) async {
                  await iLocalStorageRepository.saveLastGroupId(groupInfo.id);
                  emit(
                    GroupState.data(
                      groupData: GroupData(
                        members: members,
                        expenses: expenses,
                        groupInfo: groupInfo,
                        dashboardData: dashboardData,
                      ),
                    ),
                  );
                }),
              ),
            ));
    expensesObserver.fold((l) {}, (r) {
      log('expenses subscription established');
      _expensesSubscription = r.listen((event) => _expensesListener(event));
    });
  }

  void _expensesListener(ExpenseEvent event) async {
    if (state is _Data) {
      final s = state as _Data;
      final expenses = List<Expense>.from(s.groupData.expenses);
      final dashboardDataResult =
          await iGroupRepository.fetchDashboardData(s.groupData.groupInfo.id);
      dashboardDataResult.fold((l) {}, (dashboardData) {
        event.when(
            insert: (expense) => emit(s.copyWith(
                groupData: s.groupData.copyWith(
                    dashboardData: dashboardData,
                    expenses: expenses..insert(0, expense)))),
            update: (expense) {
              final index =
                  expenses.indexWhere((element) => element.id == expense.id);
              if (index >= 0) {
                expenses.removeAt(index);
                expenses.insert(index, expense);
                emit(s.copyWith(
                    groupData: s.groupData.copyWith(
                        dashboardData: dashboardData, expenses: expenses)));
              }
            },
            delete: (id) {
              expenses.removeWhere((element) => element.id == id);
              emit(s.copyWith(
                  groupData: s.groupData.copyWith(
                      dashboardData: dashboardData, expenses: expenses)));
            });
      });
    }
  }

  @override
  Future<void> close() async {
    await _expensesSubscription?.cancel();
    return super.close();
  }
}
