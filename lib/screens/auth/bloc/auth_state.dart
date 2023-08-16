part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class Loading extends AuthState {
  @override
  List<Object?> get props => [];
}

class UserDataChange extends AuthState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  final User currentUser;
  Authenticated(this.currentUser);
  @override
  List<Object?> get props => [currentUser];
}

class UnAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
  @override
  List<Object?> get props => [error];
}
