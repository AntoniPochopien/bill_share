import 'package:bill_share/group_dashboard/domain/member_with_balance.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_data.freezed.dart';

@freezed
class DashboardData with _$DashboardData {
  const factory DashboardData({
    required double toPay,
    required double toRecive,
    required List<MemberWithBalance> membersWithBalance,
  }) = _DashboardData;
}
