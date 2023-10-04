import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../../../models/hive/local_user_model.dart';
import '../data/repository/profile_repository.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository;

  ProfileBloc({required this.repository}) : super(ProfileLoading()) {
    on<GetProfile>((event, emit) async {
      emit(ProfileLoading());

      try {
        final user = await repository.getProfile();
        emit(ProfileLoaded(user));
      } catch (error) {
        emit(ProfileError(error.toString()));
      }
    });

    on<UpdateProfile>((event, emit) async {
      emit(ProfileUpdating());

      try {
        await repository.updateProfile(event.user);
        emit(ProfileUpdated());
      } catch (error) {
        emit(ProfileError(error.toString()));
      }
    });
  }
}
