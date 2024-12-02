import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:dartz/dartz.dart';

abstract class IGroupRepository {
  Future<Either<Failure, List<GroupMember>>> fetchGroupMembers(int groupId);
}
