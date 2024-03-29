import 'dart:io';

import 'package:at3am/authentication/page/splash_screen.dart';
import 'package:at3am/home/page/home_layout.dart';
import 'package:at3am/src/app_root.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'cashe_helper.dart';
import 'core/bloc_observer/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform
  // );

  Platform.isAndroid
      ? await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBSUffkKY2f0lmqfevsASMtiiPyxaHw6_4",
        appId: "1:857783846160:android:c05b2f3054d28129c79195",
        messagingSenderId: "857783846160 ",
        storageBucket: "ateam-f4dc7.appspot.com",
        projectId: "ateam-f4dc7"),
  )
      : await Firebase.initializeApp();

  Bloc.observer= CubitObserver();

  await CacheHelper.init();
  var uId = CacheHelper.getData(key: 'uId');

  print('print user is is iss -----> ${uId}');

  Widget widget;

  if(uId != null){
    widget = HomeLayout();
  } else {
    widget = SplashScreen();
  }


  runApp(AppRoot(startWidget: widget,));
}

