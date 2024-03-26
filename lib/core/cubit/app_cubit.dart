import 'dart:io';

import 'package:at3am/core/cubit/app_state.dart';
import 'package:at3am/home/page/home_screen.dart';
import 'package:at3am/home/page/profile_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:geolocator/geolocator.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../cashe_helper.dart';
import '../../models/food_model.dart';
import '../../models/user_model.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentScreen = 0;
  int quantity = 6;
  String foodCategory = 'Grocery';
  File? foodImage;
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
       foodImage=File(value.path);
       emit(PhotoLoadedState());
     }
    });
  }
  deleteImage(){
    foodImage=null;
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

// Get User Data from Firebase Firestore
  UserModel? userModel;
  var uId = CacheHelper.getData(key: 'uId');

  // Upload Date
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat("dd MMMM yyyy");

  void getUserData()
  {
    emit(GetUserDataLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(GetUserDataSuccessState(userModel: userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GetUserDataErrorState(error: error.toString()));
    });
  }

  // Upload Image in Firebase Database

  void uploadPostImage({
    // required String dateTime,
    required String foodTitle,
    required String foodDetails,
    required String foodAddress,
  })
  {
    emit(CreateFoodLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('foods/${Uri.file(foodImage!.path).pathSegments.last}')
        .putFile(foodImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value)
      {
        print(value);
        createPost(
            // dateTime: dateTime,
            foodTitle: foodTitle,
            foodDetails: foodDetails,
            foodAddress: foodAddress,
            postImage: value
        );
      }).catchError((error)
      {
        emit(CreateFoodErrorState(error: error.toString()));
      });
    }).catchError((error)
    {
      emit(CreateFoodErrorState(error: error.toString()));
    });
  }

  //Create A Food Post

  void createPost({
    // required String dateTime,
    required String foodTitle,
    required String foodDetails,
    required String foodAddress,
    required String postImage,
  })
  {
    emit(CreateFoodLoadingState());

    FoodModel foodModel = FoodModel(
        donerName: 'bishoy alper',
        donerId: userModel?.uId,
        foodTitle: foodTitle,
        foodDetails: foodDetails,
        foodAddress: foodAddress,
        foodCategory: foodCategory,
        foodQuantity: quantity,
        foodTime: formatter.format(now),
        foodImage: postImage
    );

    FirebaseFirestore.instance
        .collection('foods')
        .add(foodModel.toMap())
        .then((value)
    {
      emit(CreateFoodSuccessState());
    })
        .catchError((error)
    {
      emit(CreateFoodErrorState(error: error.toString()));
    });
  }

}
//https://www.google.com/maps/search/?api=1&query=30.2466921,31.3102143