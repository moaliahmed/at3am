import 'package:at3am/core/assets_manager.dart';
import 'package:at3am/home/page/home_layout.dart';
import 'package:at3am/home/page/home_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../core/color_manger.dart';
import '../../core/string_manager.dart';
import '../../models/food_model.dart';

class FoodTakenScreen extends StatelessWidget {
  FoodModel? foodModel;
  String? keyFoodData;
  FoodTakenScreen({required this.foodModel, required this.keyFoodData});

  @override
  Widget build(BuildContext context) {
    double myHeight= MediaQuery.of(context).size.height ;
    double myWidth=  MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(foodModel!.foodImage!),fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(19),
                  color: Colors.black
                ),
                height: myHeight*.25,
                width: myWidth,

            ),
            SizedBox(height: myHeight*.01),
            Container(
              margin: EdgeInsets.symmetric(vertical:  myHeight*.01),

              width: myWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all()
              ),child: ListTile(
              leading: Icon(Icons.person_outline_rounded),
              title: Text('${foodModel!.donerName}'),
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
              title: Text('${foodModel!.donerPhone}'),
            ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical:  myHeight*.01),

              width: myWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all()
              ),child: ListTile(
              leading: Icon(Icons.location_on_outlined),
              title: Text('4 El-mehata street - El-zohor village'),
            ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical:  myHeight*.01),
              width: myWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all()
              ),child: ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text('${foodModel!.foodAddress}'),
            ),
            ),
            SizedBox(height: myHeight*.03),
            ElevatedButton(
              onPressed: () {
                FirebaseDatabase.instance.ref().child('foods').child(keyFoodData!).remove();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeLayout(),
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
                AppString.foodTaken,
                style: TextStyle(fontSize: 18, color: ColorManager.white),
              ),
            ),
            SizedBox(height: myHeight*.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    AppString.cancelRequest,
                    style: TextStyle(fontSize: 18, color: ColorManager.primary),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeLayout(),
                      ),
                          (route) {
                        return false;
                      },
                    );
                  },
                  child: Text(
                    AppString.goHomeRequest,
                    style: TextStyle(fontSize: 18, color: ColorManager.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
