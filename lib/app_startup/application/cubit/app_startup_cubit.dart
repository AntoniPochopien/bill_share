import 'package:bill_share/local_storage/domain/i_local_storage_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_startup_state.dart';
part 'app_startup_cubit.freezed.dart';

class AppStartupCubit extends Cubit<AppStartupState> {
  final ILocalStorageRepository iLocalStorageRepository;
  AppStartupCubit({required this.iLocalStorageRepository})
      : super(AppStartupState.initial());

  void init() {
    final lastGroupId = iLocalStorageRepository.readLastGroupId();
    if (lastGroupId != null) {
      emit(AppStartupState.navigateToGroup(lastGroupId));
    } else {
      emit(AppStartupState.navigateToHome());
    }
  }
}
