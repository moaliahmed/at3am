import 'package:at3am/core/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../core/color_manger.dart';
import '../../core/string_manager.dart';
import '../../models/food_model.dart';
import 'food_taken.dart';
class RequestFoodScreen extends StatelessWidget {
  FoodModel foodModel;
  RequestFoodScreen({required this.foodModel});

  @override
  Widget build(BuildContext context) {
    double myHeight= MediaQuery.of(context).size.height ;
    double myWidth=  MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(foodModel.foodImage!),fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(19),
                    color: Colors.black
                ),
                height: myHeight*.25,
                width: myWidth,
              ),
              SizedBox(height: myHeight*.03),
              Text('${foodModel.donerName}', style: TextStyle(fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.w600),),
              SizedBox(height: myHeight*.03),
              Container(
                margin: EdgeInsets.symmetric(vertical:  myHeight*.01),
                width: myWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all()
                ),child: ListTile(
                leading: Icon(Icons.local_dining_sharp),
                title: Text('${foodModel.foodTitle}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
              ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                margin: EdgeInsets.symmetric(vertical:  myHeight*.01),
                height: myHeight * 0.15,
                width: myWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all()
                ),
                child: Text('${foodModel.foodDetails}', style: TextStyle(fontSize: 20.0, color: Colors.black),),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical:  myHeight*.01),
            
                width: myWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all()
                ),child: ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text('${foodModel.foodAddress}'),
              ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical:  myHeight*.01),
                width: myWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all()
                ),child: ListTile(
                leading: Icon(Icons.phone_outlined),
                title: Text('${foodModel.donerPhone}'),
              ),
              ),
              SizedBox(height: myHeight*.03),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodTaken(foodModel: foodModel,),
                    ),
                        (route) {
                      return false;
                    },
                  );
                },
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(ColorManager.primary)),
                child: Text(
                  AppString.request,
                  style: TextStyle(fontSize: 18, color: ColorManager.white),
                ),
              ),
              SizedBox(height: myHeight*.01),
              TextButton(
                onPressed: () {},
                child: Text(
                  AppString.chatRequest,
                  style: TextStyle(fontSize: 20, color: ColorManager.primary, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
