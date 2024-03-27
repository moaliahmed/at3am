import 'package:at3am/core/cubit/app_cubit.dart';
import 'package:at3am/home/page/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../authentication/page/signup_screen.dart';
import '../authentication/page/splash_screen.dart';
import '../home/page/food_taken.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeLayout(),
      ),
    );
  }
}
