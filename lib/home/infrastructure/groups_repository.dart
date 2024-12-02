import 'dart:developer';

import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/home/domain/i_groups_repository.dart';
import 'package:bill_share/home/domain/simple_group.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GroupsRepository implements IGroupsRepository {
  final _supabase = Supabase.instance.client;

  @override
  Future<Either<Failure, SimpleGroup>> createGroup(String groupName) async {
    try {
      final result = await _supabase.rpc('create_group', params: {
        'name': groupName,
      }) as List;
      final newGroupId = result[0]['id'];
      final newGroupResult = await _supabase
          .from('groups_profiles')
          .select(
              'groups(id, name, membersCount:groups_profiles(count)), isAdmin')
          .eq('group_id', newGroupId);
      final newGroup =
          newGroupResult.map((e) => SimpleGroup.fromJson(e)).toList();
      return right(newGroup.first);
    } catch (e) {
      log('createGroup unexpected error: $e');
      return left(Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, List<SimpleGroup>>> fetchUserGroups(
      String userId) async {
    try {
      final response = await _supabase
          .from('groups_profiles')
          .select(
              'groups(id, name, membersCount:groups_profiles(count)), isAdmin')
          .eq('user_id', userId);
      final groups = response.map((e) => SimpleGroup.fromJson(e)).toList();
      return right(groups);
    } catch (e) {
      log('fetchUserGroups unexpected error: $e');
      return left(Failure.unexpected());
    }
  }
}
