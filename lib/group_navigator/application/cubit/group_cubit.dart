import 'dart:async';
import 'dart:developer';

import 'package:bill_share/auth/domain/injectable_user.dart';
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
  final InjectableUser injectableUser;
  GroupCubit({
    required this.iLocalStorageRepository,
    required this.iGroupRepository,
    required this.iExpensesRepository,
    required this.injectableUser,
  }) : super(GroupState.initial());

  StreamSubscription<ExpenseEvent>? _expensesSubscription;

  void init(int groupId) async {
    _expensesSubscription?.cancel();
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
                  if (members.any((element) =>
                      element.id == injectableUser.currentUser.id)) {
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
                  } else {
                    emit(GroupState.error(Failure.dontBelongToGroup()));
                  }
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

  Future<void> regenerateAccessCode() async {
    if (state is _Data) {
      final s = state as _Data;
      final result =
          await iGroupRepository.regenerateAccessCode(s.groupData.groupInfo.id);
      result.fold(
        (l) => emit(GroupState.error(l)),
        (r) => emit(s.copyWith(
            groupData: s.groupData.copyWith(
                groupInfo: s.groupData.groupInfo.copyWith(accessCode: r)))),
      );
    }
  }

  Future<void> toggleLock() async {
    if (state is _Data) {
      final s = state as _Data;
      final result = await iGroupRepository.toogleLock(
          value: !s.groupData.groupInfo.locked,
          groupId: s.groupData.groupInfo.id);
      result.fold(
        (l) => emit(GroupState.error(l)),
        (r) => emit(s.copyWith(
            groupData: s.groupData.copyWith(
                groupInfo: s.groupData.groupInfo.copyWith(locked: r)))),
      );
    }
  }

  void selectGroupImage() async {
    if (state is _Data) {
      final s = state as _Data;
      final result =
          await iGroupRepository.selectGroupImage(s.groupData.groupInfo.id);
      result.fold((l) => emit(GroupState.error(l)), (r) {
        if (r != null) {
          emit(s.copyWith(
              groupData: s.groupData.copyWith(
                  groupInfo: s.groupData.groupInfo.copyWith(imageUrl: r))));
        }
      });
    }
  }

  Future<void> updateGroupName(String newGroupName) async {
    if (state is _Data) {
      final s = state as _Data;
      final result = await iGroupRepository.updateGroupName(
          newGroupName: newGroupName, id: s.groupData.groupInfo.id);
      result.fold((l) => emit(GroupState.error(l)), (r) {
        emit(s.copyWith(
            groupData: s.groupData.copyWith(
                groupInfo:
                    s.groupData.groupInfo.copyWith(name: newGroupName))));
      });
    }
  }

  @override
  Future<void> close() async {
    await _expensesSubscription?.cancel();
    return super.close();
  }
}
