import 'package:bill_share/auth/domain/i_auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository iAuthRepository;
  AuthCubit({required this.iAuthRepository}) : super(AuthState.initial());

  void googleSignIn() async {
    iAuthRepository.init();
    await iAuthRepository.googleSignIn();
  }
}
