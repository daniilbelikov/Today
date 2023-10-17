import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../data/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;

  AuthBloc({required AuthRepository repository})
      : _repository = repository,
        super(UnauthenticatedState()) {
    on<GoogleSignInEvent>((event, emit) async {
      emit(LoadingState());

      try {
        final user = await _repository.signInWithGoogle();
        if (user != null) emit(AuthenticatedState(user));
      } catch (error) {
        emit(AuthErrorState(error.toString()));
        emit(UnauthenticatedState());
      }
    });

    on<AppleSignInEvent>((event, emit) async {
      emit(LoadingState());

      try {
        final user = await _repository.signInWithApple();
        if (user != null) emit(AuthenticatedState(user));
      } catch (error) {
        emit(AuthErrorState(error.toString()));
        emit(UnauthenticatedState());
      }
    });

    on<SignOutEvent>((event, emit) async {
      emit(LoadingState());
      await _repository.signOut();
      emit(UnauthenticatedState());
    });

    on<DeleteAccountEvent>((event, emit) async {
      emit(LoadingState());
      await _repository.deleteAccount();
      emit(UnauthenticatedState());
    });
  }
}
