import 'package:at3am/home/page/home_screen.dart';
import 'package:at3am/home/page/profile_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  int currentScreen = 0;
  List<Widget> screen = [
    HomeScreen(),
    ProfileScreen(),
  ];

  changeScreen(int index) {
    currentScreen = index;
    emit(HomeBottomNavBarChange());
  }
}
