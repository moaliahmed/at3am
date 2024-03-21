import 'package:at3am/home/page/home_layout.dart';
import 'package:flutter/material.dart';

import '../authentication/page/signup_screen.dart';
import '../authentication/page/splash_screen.dart';
class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}
