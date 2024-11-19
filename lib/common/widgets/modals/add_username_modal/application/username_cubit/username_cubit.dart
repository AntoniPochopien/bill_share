import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:bill_share/common/domain/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'username_state.dart';
part 'username_cubit.freezed.dart';

class UsernameCubit extends Cubit<UsernameState> {
  final IAuthRepository iAuthRepository;
  UsernameCubit({required this.iAuthRepository})
      : super(UsernameState.initial());

  void updateUsername(String username) async {
    emit(UsernameState.loading());
    final result = await iAuthRepository.updateUsername(username);
    result.fold(
      (l) => emit(UsernameState.error(l)),
      (r) => emit(UsernameState.added()),
    );
  }
}
