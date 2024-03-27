import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_auth_state.dart';

class LoginAuthCubit extends Cubit<LoginAuthState> {
  LoginAuthCubit() : super(LoginAuthInitialState());

  static LoginAuthCubit get(context) => BlocProvider.of(context);

  void userLogin({required String email, required String password}) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          print('Welcome We are succect in login');
          print('${value.user!.email}');
          print('${value.user!.uid}');
          emit(LoginAuthSucessState(uId: value.user!.uid));
    })
        .catchError((error) {
      print('error in login auth cubit ----> ${error}');
      emit(LoginAuthErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(ChangePasswordVisibilityState());
  }
}
