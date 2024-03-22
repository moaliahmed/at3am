import 'package:flutter/material.dart';

import '../../core/assets_manager.dart';
import '../../core/color_manger.dart';

// Food Items Card
Widget listCard(){
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
                        image: AssetImage(ImageAssets.personImage),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
                    'Meal',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 25.0
                    ),
                  ),

                  //category prebaard
                  Text(
                    'Category: prapred foor',
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
                        'Bishoy Alper',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                            fontSize: 15.0
                        ),
                      ),
                      SizedBox(width: 20.0,),
                      Text(
                        '16 October, 2021',
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