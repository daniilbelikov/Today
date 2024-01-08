part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final LocalUserModel user;
  final String oldImage;

  UpdateProfileEvent(this.user, this.oldImage);

  @override
  List<Object> get props => [user];
}
