import 'dart:async';
import 'dart:developer';

import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/group_dashboard/domain/dashboard_data.dart';
import 'package:bill_share/group_dashboard/domain/member_with_balance.dart';
import 'package:bill_share/group_navigator/domain/group_info.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:bill_share/group_navigator/domain/i_group_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GroupRepository implements IGroupRepository {
  final _supabase = Supabase.instance.client;

  @override
  Future<Either<Failure, List<GroupMember>>> fetchGroupMembers(
      int groupId) async {
    try {
      final response = await _supabase
          .from('groups_profiles')
          .select('profiles(id, username), is_admin')
          .eq('group_id', groupId);
      final members = response.map((e) => GroupMember.fromJson(e)).toList();
      return right(members);
    } catch (e) {
      log('fetchGroupMembers unexpected error: $e');
      return left(Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, GroupInfo>> fetchGroupInfo(int groupId) async {
    try {
      final groupResponse =
          await _supabase.from('groups').select('id, name').eq('id', groupId);
      final groupData = groupResponse[0];
      return right(GroupInfo(id: groupData['id'], name: groupData['name']));
    } catch (e) {
      log('fetchGroupInfo unexpected error: $e');
      return left(Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, DashboardData>> fetchDashboardData(int groupId) async {
    try {
      final result =
          await _supabase.functions.invoke('get-group-net-balances', body: {
        'group_id': groupId,
      });

      final data = result.data as List<dynamic>;
      final membersWithBalance =
          data.map((e) => MemberWithBalance.fromJson(e)).toList();

      final toPay = membersWithBalance
          .map((e) => e.value < 0 ? e.value : 0)
          .reduce((a, b) => a + b)
          .toDouble();
      final toRecive = membersWithBalance
          .map((e) => e.value > 0 ? e.value : 0)
          .reduce((a, b) => a + b)
          .toDouble();

      final groupData = DashboardData(
        toPay: toPay,
        toRecive: toRecive,
        membersWithBalance: membersWithBalance,
      );

      return right(groupData);
    } catch (e) {
      log('fetchGroupData unexpected error: $e');
      return left(Failure.unexpected());
    }
  }
}
