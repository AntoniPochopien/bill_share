part of 'expense_creator_cubit.dart';

@freezed
class ExpenseCreatorState with _$ExpenseCreatorState {
  const factory ExpenseCreatorState.initial() = _Initial;
  const factory ExpenseCreatorState.initialized({
    @Default(false) bool isLoading,
    @Default([]) List<GroupMember> beneficiers,
    @Default([]) List<GroupMember> groupMembers,
    required int groupId,
    required GroupMember payer,
    @Default(false) bool beneficiersIsEmptyError,
    @Default(false) bool created,
  }) = _Initialized;
  const factory ExpenseCreatorState.error(Failure failure) = _Error;
}
