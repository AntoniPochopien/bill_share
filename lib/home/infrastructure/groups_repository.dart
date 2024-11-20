import 'dart:developer';

import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/home/domain/i_groups_repository.dart';
import 'package:bill_share/home/domain/simple_group.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GroupsRepository implements IGroupsRepository {
  final _supabase = Supabase.instance.client;

  @override
  Future<Either<Failure, int>> createGroup(String groupName) async {
    try {
      final result = await _supabase.functions.invoke('create-group', body: {
        'groupName': groupName,
      });
      if (result.status == 201) {
        return right(result.data['newGroup']['id']);
      } else {
        return left(Failure.unexpected());
      }
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
          .select('groups(id, name)')
          .eq('user_id', userId);
      final groups = response.map((e) {
        final g = e['groups'];
        return SimpleGroup(
          id: g['id'],
          name: g['name'],
        );
      }).toList();
      return right(groups);
    } catch (e) {
      log('fetchUserGroups unexpected error: $e');
      return left(Failure.unexpected());
    }
  }
}
