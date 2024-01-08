import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../helpers/constants.dart';
import 'package:equatable/equatable.dart';
import '../../../models/hive/local_user_model.dart';
import '../data/repository/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _repository;

  ProfileBloc({required ProfileRepository repository})
      : _repository = repository,
        super(ProfileLoading()) {
    on<GetProfileEvent>((event, emit) async {
      emit(ProfileLoading());

      try {
        final user = await _repository.getProfile();
        emit(ProfileLoaded(user));
      } catch (error) {
        emit(ProfileError(error.toString()));
      }
    });

    on<UpdateProfileEvent>((event, emit) async {
      emit(ProfileUpdating());

      try {
        final oldImage = event.oldImage;
        final path = event.user.avatar;
        final user = event.user;

        path.contains(TodayKeys.storage)
            ? await _repository.updateProfile(user)
            : await _repository.uploadImageInStorage(path, oldImage, user);

        emit(ProfileUpdated());
      } catch (error) {
        emit(ProfileError(error.toString()));
      }
    });
  }
}
