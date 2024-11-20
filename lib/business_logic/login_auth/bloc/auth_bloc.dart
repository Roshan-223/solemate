import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solemate/service/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;

  AuthBloc(this._firebaseAuth) : super(AuthInitial()) {
    on<SignInEvent>(_onSignIn);
    on<SignUpEvent>(_onSignUp);
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: event.user.email!,
        password: event.user.password!,
      );
      emit(AuthSuccess(user: userCredential.user));
    } catch (e) {
      emit(AuthFailure(error: getError(e)));
    }
  }

 Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: event.user.email!,
        password: event.user.password!,
      );
      emit(AuthSuccess(user: userCredential.user));
    } catch (e) {
      emit(AuthFailure(error: getError(e)));
    }
  }

  String getError(Object e) {
    if (e is FirebaseAuthException) {
      return e.message ?? 'An unknown error occurred.';
    }
    return 'An unexpected error occurred.';
  }
}
