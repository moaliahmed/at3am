import 'dart:io';

import 'package:at3am/core/cubit/app_state.dart';
import 'package:at3am/home/page/home_screen.dart';
import 'package:at3am/home/page/profile_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentScreen = 0;
  int quantity = 6;
  String foodCategory = 'Grocery';
  File? photo;
  double? lat;
  double? long;
  List<Widget> screen = [
    HomeScreen(),
    ProfileScreen(),
  ];

  changeScreen(int index) {
    currentScreen = index;
    emit(AppBottomNavBarChangeState());
  }

  changeFoodCategory(String value) {
    foodCategory = value;
    emit(FoodCategoryChangeState());
  }

  changeQuantitySlider(int value) {
    quantity = value;
    emit(QuantitySliderChangeState());
  }

  Future getImage() async {
    await ImagePicker()
        .pickImage(source: ImageSource.camera)
        .then((value) {
     if (value!=null){
       photo=File(value.path);
       emit(PhotoLoadedState());
     }
    });
  }
  deleteImage(){
    photo=null;
    emit(DeleteImageState());
  }
  Future<Uint8List> getImageBytes(XFile image) async {
    final bytes = await image.readAsBytes();
    return bytes;
  }

  getCurrentLocation()async{
    bool serviceEnabled= await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled){
      return Future.error('Location Service are disable');
    }
    LocationPermission permission= await Geolocator.checkPermission();
    if (permission==LocationPermission.denied){
      permission= await Geolocator.requestPermission();
      if ( permission==LocationPermission.denied){
        return Future.error('Location permission are denied');
      }
    }
    if ( permission== LocationPermission.deniedForever){
      return Future.error('Location permissions are permanently denied , we cannot request');
    }
     await Geolocator.getCurrentPosition().then((value) {
      lat=value.latitude;
      long=value.longitude;
      print(lat);
      print (long);
    });
  }
openMap()async{
    String googleUrl='https://www.google.com/maps/search/?api=1&query=$lat,$long';

      await launchUrlString(googleUrl);

}



}
//https://www.google.com/maps/search/?api=1&query=30.2466921,31.3102143