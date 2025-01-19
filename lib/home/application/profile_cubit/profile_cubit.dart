import 'package:bill_share/auth/domain/i_user_repository.dart';
import 'package:bill_share/auth/domain/injectable_user.dart';
import 'package:bill_share/common/domain/failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final IUserRepository iUserRepository;
  final InjectableUser injectableUser;
  ProfileCubit({
    required this.iUserRepository,
    required this.injectableUser,
  }) : super(ProfileState.initial());

  Future<void> updateUserProfile({
    required String newUsername,
    required XFile? newImage,
  }) async {
    emit(ProfileState.loading());
    final result = await iUserRepository.updateUserProfile(
      id: injectableUser.currentUser.id,
      newUsername: newUsername,
      newProfileImage: newImage,
    );
    result.fold((l) => emit(ProfileState.error(l)), (userData) {
      final currentUser = injectableUser.currentUser;
      injectableUser.setUser(currentUser.copyWith(username: userData.username));
      if (userData.imageUrl != null) {
        injectableUser
            .setUser(currentUser.copyWith(imageUrl: userData.imageUrl));
      }
      emit(ProfileState.initial());
    });
  }
}
