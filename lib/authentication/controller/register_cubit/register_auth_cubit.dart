import 'package:at3am/authentication/controller/register_cubit/register_auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterAuthCubit extends Cubit<RegisterAuthState> {
  RegisterAuthCubit() : super(RegisterAuthInitialState());

  static RegisterAuthCubit get(context) => BlocProvider.of(context);

  void userRegister(
      {required String name,
      required String email,
      required String password,
      required String phoneNumber}) {
    emit(RegisterAuthLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.uid);
      print(value.user!.email);
      emit(RegisterAuthSucessState());
    }).catchError((error) {
      emit(RegisterAuthErrorState(error));
      print('this is error in register cubit ----> ${error.toString()}');
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }
}
