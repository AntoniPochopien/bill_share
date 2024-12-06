part of 'expense_creator_cubit.dart';

@freezed
class ExpenseCreatorState with _$ExpenseCreatorState {
  const factory ExpenseCreatorState.initial() = _Initial;
  const factory ExpenseCreatorState.initialized({
    @Default(false) bool isLoading,
    @Default([]) List<GroupMember> beneficiers,
    @Default([]) List<GroupMember> groupMebers,
    required GroupMember payer,
  }) = _Initialized;
  const factory ExpenseCreatorState.created() = _Created;
  const factory ExpenseCreatorState.error(Failure failure) = _Error;
}