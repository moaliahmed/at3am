import 'package:at3am/authentication/controller/register_cubit/register_auth_state.dart';
import 'package:at3am/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
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
      required String phoneNumber
      }) {
    emit(RegisterAuthLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      //create user in firestore
      userCreate(uId: value.user!.uid,
        email: email,
        phoneNumber: phoneNumber,
        name: name);
    }).catchError((error) {
      emit(RegisterAuthErrorState(error));
      print('this is error in register cubit ----> ${error.toString()}');
    });
  }

  //function created user in firestore
  void userCreate({
    required String name,
    required String email,
    required String phoneNumber,
    required String uId
  }){
    UserModel userModel = UserModel(name: name, email: email, phone: phoneNumber, uId: uId);

    FirebaseFirestore.instance.collection('users')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
          emit(CreateAuthSucessState());
    })
        .catchError((error){
          emit(CreateAuthErrorState(error.toString()));
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
