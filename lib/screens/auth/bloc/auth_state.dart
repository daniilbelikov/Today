part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class LoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthenticatedState extends AuthState {
  final User currentUser;
  AuthenticatedState(this.currentUser);
  @override
  List<Object?> get props => [currentUser];
}

class UnauthenticatedState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
