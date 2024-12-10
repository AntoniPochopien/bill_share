import 'package:bill_share/group_dashboard/domain/dashboard_data.dart';
import 'package:bill_share/group_navigator/domain/expenses/expense.dart';
import 'package:bill_share/group_navigator/domain/group_info.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_data.freezed.dart';

@freezed
class GroupData with _$GroupData {
  const factory GroupData({
    required GroupInfo groupInfo,
    required List<GroupMember> members,
    required List<Expense> expenses,
    required DashboardData dashboardData,
  }) = _GroupData;
}
