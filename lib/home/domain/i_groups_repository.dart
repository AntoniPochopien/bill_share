import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/home/domain/simple_group.dart';
import 'package:dartz/dartz.dart';

abstract class IGroupsRepository {
  Future<Either<Failure, SimpleGroup>> createGroup(String groupName);
  Future<Either<Failure, SimpleGroup>> joinGroup(String accessCode);
  Future<Either<Failure, List<SimpleGroup>>> fetchUserGroups(String userId);
}