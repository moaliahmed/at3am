import 'package:at3am/src/app_root.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'core/bloc_observer/bloc_observer.dart';

void main() {
  Bloc.observer= CubitObserver();
  runApp(const AppRoot());
}

