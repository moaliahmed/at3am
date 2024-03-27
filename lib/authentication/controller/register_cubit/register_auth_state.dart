abstract class RegisterAuthState {}

class RegisterAuthInitialState extends RegisterAuthState {}

class RegisterAuthLoadingState extends RegisterAuthState {}

class RegisterAuthSucessState extends RegisterAuthState {}

class RegisterAuthErrorState extends RegisterAuthState {
final String error;
RegisterAuthErrorState(this.error);
}

class ChangePasswordVisibilityState extends RegisterAuthState {}

//create a user
class CreateAuthLoadingState extends RegisterAuthState {}

class CreateAuthSucessState extends RegisterAuthState {}

class CreateAuthErrorState extends RegisterAuthState {
  final String error;
  CreateAuthErrorState(this.error);
}

