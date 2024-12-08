import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/group_navigator/domain/expenses/expense.dart';
import 'package:bill_share/group_navigator/domain/expenses/expense_event.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:dartz/dartz.dart';

abstract class IGroupRepository {
  Future<Either<Failure, List<GroupMember>>> fetchGroupMembers(int groupId);
  Future<Either<Failure, List<Expense>>> fetchGroupExpenses(int groupId);
  Either<Failure, Stream<ExpenseEvent>> observeExpenses(int groupId);
}
