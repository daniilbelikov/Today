import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import '../data/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(UnauthenticatedState()) {
    on<GoogleSignInEvent>((event, emit) async {
      emit(LoadingState());

      try {
        final user = await repository.signInWithGoogle();
        if (user != null) emit(AuthenticatedState(user));
      } catch (error) {
        emit(AuthErrorState(error.toString()));
        emit(UnauthenticatedState());
      }
    });

    on<AppleSignInEvent>((event, emit) async {
      emit(LoadingState());

      try {
        final user = await repository.signInWithApple();
        if (user != null) emit(AuthenticatedState(user));
      } catch (error) {
        emit(AuthErrorState(error.toString()));
        emit(UnauthenticatedState());
      }
    });

    on<SignOutEvent>((event, emit) async {
      emit(LoadingState());
      await repository.signOut();
      emit(UnauthenticatedState());
    });
  }
}
