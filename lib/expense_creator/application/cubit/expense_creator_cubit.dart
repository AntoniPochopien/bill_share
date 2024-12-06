import 'package:bill_share/auth/domain/injectable_user.dart';
import 'package:bill_share/common/domain/failure.dart';
import 'package:bill_share/group_navigator/domain/group_member.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_creator_state.dart';
part 'expense_creator_cubit.freezed.dart';

class ExpenseCreatorCubit extends Cubit<ExpenseCreatorState> {
  final InjectableUser injectableUser;
  ExpenseCreatorCubit({
    required this.injectableUser,
  }) : super(ExpenseCreatorState.initial());

  void init(List<GroupMember> groupMembers) {
    final currentUser = groupMembers
        .where((element) => element.id == injectableUser.currentUser.id);
    if (currentUser.length == 1) {
      emit(ExpenseCreatorState.initialized(
        payer: currentUser.first,
        groupMebers: groupMembers,
      ));
    } else {
      emit(ExpenseCreatorState.error(Failure.unexpected()));
    }
  }

  void addBeneficiers(List<GroupMember> groupMember) {
    if (state is _Initialized) {
      final s = state as _Initialized;
      final beneficiers = List<GroupMember>.from(s.beneficiers);
      emit(s.copyWith(beneficiers: beneficiers + groupMember));
    }
  }

  void removeBeneficier(GroupMember groupMember) {
    if (state is _Initialized) {
      final s = state as _Initialized;
      final beneficiers = List<GroupMember>.from(s.beneficiers);
      emit(s.copyWith(beneficiers: beneficiers..remove(groupMember)));
    }
  }

  void addAllBeneficiers() {
    if (state is _Initialized) {
      final s = state as _Initialized;
      emit(s.copyWith(beneficiers: s.groupMebers));
    }
  }

  void removeAllBeneficiers() {
    if (state is _Initialized) {
      final s = state as _Initialized;
      emit(s.copyWith(beneficiers: []));
    }
  }
}
