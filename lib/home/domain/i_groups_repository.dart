import 'package:bill_share/common/domain/failure.dart';
import 'package:dartz/dartz.dart';

abstract class IGroupsRepository {
  Future<Either<Failure, Unit>> createGroup(String groupName);
}