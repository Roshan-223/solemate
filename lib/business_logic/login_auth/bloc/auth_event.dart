part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignInEvent extends AuthEvent {
 final UserModel user; 

  SignInEvent({required this.user});
}

class SignUpEvent extends AuthEvent {
 final UserModel user;
   SignUpEvent({required this.user});
}
