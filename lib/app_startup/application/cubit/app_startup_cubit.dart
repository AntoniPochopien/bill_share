import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:bill_share/auth/domain/user.dart';
import 'package:bill_share/auth/infrastructure/user_to_domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_startup_state.dart';
part 'app_startup_cubit.freezed.dart';

class AppStartupCubit extends Cubit<AppStartupState> {
  final IAuthRepository iAuthRepository;
  AppStartupCubit({required this.iAuthRepository})
      : super(AppStartupState.initial());

  void init() async {
    await Future.delayed(Duration.zero);
    final session = iAuthRepository.checkIfSessionExists();
    if (session?.user != null) {
      emit(AppStartupState.authenticated(session!.user.toDomain()));
    } else {
      emit(AppStartupState.unauthenticated());
    }
  }
}
