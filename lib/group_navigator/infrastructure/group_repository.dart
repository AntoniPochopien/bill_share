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
      //TODO fix freezed json serializer for that case
      final members = response.map((e) {
        final flattenJson = {
          'is_admin': e['is_admin'],
          'id': e['profiles']['id'],
          'username': e['profiles']['username'],
        };
        return GroupMember.fromJson(flattenJson);
      }).toList();
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
      final requestes = await Future.wait([
        _supabase
            .from('groups_profiles')
            .select('profiles(id, username), is_admin')
            .eq('group_id', groupId),
        _supabase
            .from('expense_beneficiaries')
            .select('expenses(payer_id, amount), share, beneficiary_id')
            .eq('expenses.group_id', groupId),
      ]);

      final user = _supabase.auth.currentUser!;

      final groupMembersRequest = requestes[0];
      final groupExpensesRequest = requestes[1];

      //TODO fix freezed json serializer for that case
      final members = groupMembersRequest.map((e) {
        final flattenJson = {
          'is_admin': e['is_admin'],
          'id': e['profiles']['id'],
          'username': e['profiles']['username'],
        };
        return GroupMember.fromJson(flattenJson);
      }).toList();

      final Map<String, double> debtors = {};
      final Map<String, double> owningTo = {};

      for (var expense in groupExpensesRequest) {
        final share = expense['share'];
        final beneficiaryId = expense['beneficiary_id'];
        final expenses = expense['expenses'];
        final payerId = expenses['payer_id'];
        if (payerId == user.id && beneficiaryId != user.id) {
          debtors.putIfAbsent(beneficiaryId, () => 0.0);
          debtors[beneficiaryId] = (debtors[beneficiaryId] as double) + share;
        } else if (beneficiaryId == user.id && payerId != user.id) {
          if (owningTo.containsKey(payerId)) {
            owningTo.putIfAbsent(payerId, () => 0.0);
            owningTo[payerId] = (owningTo[payerId] as double) + share;
          }
        }
      }

      final Map<String, double> merged = {};

      for (var key in debtors.keys) {
        merged[key] = (merged[key] ?? 0.0) + (debtors[key] ?? 0.0);
      }

      for (var key in owningTo.keys) {
        merged[key] = (merged[key] ?? 0.0) - (owningTo[key] ?? 0.0);
      }

      final membersWithBalance = merged.entries
          .map((entry) {
            final member = members.where((element) => element.id == entry.key);
            if (member.isEmpty) {
              return null;
            } else {
              return MemberWithBalance(
                groupMember: member.first,
                value: entry.value,
              );
            }
          })
          .where((element) => element != null)
          .cast<MemberWithBalance>()
          .toList();

      final toPay = membersWithBalance
          .map((e) => e.value < 0 ? e.value : 0)
          .reduce((a, b) => a + b)
          .toDouble();
      final toRecive = membersWithBalance
          .map((e) => e.value > 0 ? e.value : 0)
          .reduce((a, b) => a + b)
          .toDouble();

      return right(DashboardData(
          toPay: toPay,
          toRecive: toRecive,
          membersWithBalance: membersWithBalance));
    } catch (e) {
      log('fetchGroupData unexpected error: $e');
      return left(Failure.unexpected());
    }
  }
}
