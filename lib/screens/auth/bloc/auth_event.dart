part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GoogleSignInEvent extends AuthEvent {}

class AppleSignInEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}

class DeleteAccountEvent extends AuthEvent {}
