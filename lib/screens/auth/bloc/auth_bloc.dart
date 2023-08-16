import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import '../data/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
    on<GoogleSignInRequested>((event, emit) async {
      emit(Loading());
      try {
        final user = await authRepository.signInWithGoogle();
        emit(Authenticated(user!));
      } catch (error) {
        emit(AuthError(error.toString()));
        emit(UnAuthenticated());
      }
    });

    on<AppleSignInRequested>((event, emit) async {
      emit(Loading());
      try {
        final user = await authRepository.signInWithApple();
        emit(Authenticated(user!));
      } catch (error) {
        emit(AuthError(error.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignOutRequested>((event, emit) async {
      emit(Loading());
      await authRepository.signOut();
      emit(UnAuthenticated());
    });
  }
}
