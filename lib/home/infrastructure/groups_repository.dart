import 'dart:developer';

import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/home/domain/i_groups_repository.dart';
import 'package:dartz/dartz.dart';

class GroupsRepository implements IGroupsRepository {
  @override
  Future<Either<Failure, Unit>> createGroup(String groupName) async {
    try {
      return right(unit);
    } catch (e) {
      log('createGroup unexpected error: $e');
      return left(Failure.unexpected());
    }
  }
}
