import 'dart:developer';

import 'package:bill_share/common/domain/failure.dart';
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
      // final users = response.map((e) => );
      print(response);
      return right([]);
    } catch (e) {
      log('fetchGroupMembers unexpected error: $e');
      return left(Failure.unexpected());
    }
  }
}
