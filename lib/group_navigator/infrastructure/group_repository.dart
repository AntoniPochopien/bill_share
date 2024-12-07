import 'dart:async';
import 'dart:developer';

import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/group_navigator/domain/expense.dart';
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
          .select('profiles(id, username), isAdmin')
          .eq('group_id', groupId);
      final members = response.map((e) => GroupMember.fromJson(e)).toList();
      return right(members);
    } catch (e) {
      log('fetchGroupMembers unexpected error: $e');
      return left(Failure.unexpected());
    }
  }

  @override
  Either<Failure, Stream<List<Expense>>> observeExpenses(int groupId) {
    try {
      final streamController = StreamController<List<Expense>>.broadcast();
      print('dsadsa');
      _supabase
          .channel('public:expenses')
          .onPostgresChanges(
              event: PostgresChangeEvent.all,
              schema: 'public',
              table: 'expenses',
              callback: (payload) async {
                final newRecord = payload.newRecord;
                final expenseGroupId = newRecord['group_id'];
                if (expenseGroupId == groupId) {
                  final beneficiers = newRecord[''];
                  await _retriveGroupMembers(groupId: groupId, ids: beneficiers);
                  // final beneficiers = ,
                  // final payer = ,
                  // Expense(
                  //     id: newRecord['id'],
                  //     groupId: groupId,
                  //     payer: newRecord['id'],
                  //     amount: newRecord['amount'],
                  //     beneficiaries: []);
                }
              })
          .subscribe();
      return right(streamController.stream);
    } catch (e) {
      log('observeExpenses unexpected error: $e');
      return left(Failure.unexpected());
    }
  }

  Future<List<GroupMember>> _retriveGroupMembers(
      {required int groupId, List<String>? ids}) async {
    final query = _supabase
        .from('groups_profiles')
        .select('profiles(id, username), isAdmin')
        .eq('group_id', groupId);

    if (ids != null && ids.isNotEmpty) {
      query.or('profiles.id.eq.${ids.join(",")}');
    }
    final response = await query;
    final members = response.map((e) => GroupMember.fromJson(e)).toList();
    return members;
  }

  // List<Expense> _mapPayloadToExpenses(PostgresChangePayload payload) {
  //   final records = payload.newRecord;
  //   Expense(
  //     amount: ,
  //     beneficiaries: ,
  //     groupId: ,
  //     id: ,
  //     payer: ,
  //   );
  // }
}
