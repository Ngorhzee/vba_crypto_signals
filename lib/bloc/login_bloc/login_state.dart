part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {
 
}

class LoginSuccessful extends LoginState {
  final String message;
  LoginSuccessful({required this.message});
}

class LoginError extends LoginState {
  final Failure failure;
  LoginError({required this.failure});
}
