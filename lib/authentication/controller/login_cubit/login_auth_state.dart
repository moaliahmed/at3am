part of 'login_auth_cubit.dart';

abstract class LoginAuthState {}

class LoginAuthInitialState extends LoginAuthState {}

class LoginAuthLoadingState extends LoginAuthState {}

class LoginAuthSucessState extends LoginAuthState {}

class LoginAuthErrorState extends LoginAuthState {
  final String error;
  LoginAuthErrorState(this.error);
}

class ChangePasswordVisibilityState extends LoginAuthState {}

