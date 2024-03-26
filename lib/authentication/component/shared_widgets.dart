import 'package:at3am/models/food_model.dart';
import 'package:flutter/material.dart';

import '../../core/assets_manager.dart';
import '../../core/color_manger.dart';

// Food Items Card


Widget listCard(FoodModel foodModel){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 130,
      child: Card(
        elevation: 10,
        child: Row(
          children:  [
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0, right: 30.0),
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(foodModel.foodImage!),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(45.0)),
                    boxShadow: [
                      BoxShadow(blurRadius: 7.0, color: Colors.black)
                    ]
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Meal Title
                  Text(
                    '${foodModel.foodTitle}',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 25.0
                    ),
                  ),

                  //category prebaard
                  Text(
                    '${foodModel.foodDetails}',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 17.0
                    ),
                  ),

                  SizedBox(height: 10.0,),

                  Row(
                    children: [
                      Text(
                        '${foodModel.donerName}',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            fontSize: 15.0
                        ),
                      ),
                      SizedBox(width: 20.0,),
                      Text(
                        '${foodModel.foodTime}',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: ColorManager.primary,
                            fontSize: 12.0
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );

}