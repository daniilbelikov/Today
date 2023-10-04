part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetProfile extends ProfileEvent {}

class UpdateProfile extends ProfileEvent {
  final LocalUserModel user;

  UpdateProfile(this.user);

  @override
  List<Object> get props => [user];
}
