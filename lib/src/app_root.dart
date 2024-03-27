import 'package:at3am/core/cubit/app_cubit.dart';
import 'package:at3am/core/cubit/app_state.dart';
import 'package:at3am/home/page/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../authentication/page/signup_screen.dart';
import '../authentication/page/splash_screen.dart';

class AppRoot extends StatelessWidget {
  Widget startWidget;
  AppRoot({required this.startWidget});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getUserData()..dbRef,
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: startWidget,
      ),
    );
  }
}
