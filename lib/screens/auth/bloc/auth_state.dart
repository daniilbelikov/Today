part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends AuthState {}

class AuthenticatedState extends AuthState {
  final User currentUser;

  AuthenticatedState(this.currentUser);

  @override
  List<Object?> get props => [currentUser];
}

class UnauthenticatedState extends AuthState {}

class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
