import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/group_dashboard/domain/dashboard_data.dart';
import 'package:bill_share/group_navigator/domain/group_info.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:dartz/dartz.dart';

abstract class IGroupRepository {
  Future<Either<Failure, List<GroupMember>>> fetchGroupMembers(int groupId);
  Future<Either<Failure, GroupInfo>> fetchGroupInfo(int groupId);
  Future<Either<Failure, DashboardData>> fetchDashboardData(int groupId);
  Future<Either<Failure, String>> regenerateAccessCode(int groupId);
  Future<Either<Failure, bool>> toogleLock({required bool value, required int groupId});
  Future<Either<Failure, String?>> selectGroupImage(int groupId);
  Future<Either<Failure, Unit>> updateGroupName({required String newGroupName, required int id});
}
