import 'package:at3am/core/cubit/app_state.dart';
import 'package:at3am/home/page/home_screen.dart';
import 'package:at3am/home/page/profile_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';


class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentScreen = 0;
  int foodCategoryIndex=1;
  List<Widget> screen = [
    HomeScreen(),
    ProfileScreen(),
  ];

  changeScreen(int index) {
    currentScreen = index;
    emit(AppBottomNavBarChangeState());
  }
}
