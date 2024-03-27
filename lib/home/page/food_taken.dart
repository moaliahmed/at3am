import 'package:at3am/core/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../core/color_manger.dart';
import '../../core/string_manager.dart';
class FoodTaken extends StatelessWidget {
  const FoodTaken({super.key});

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
                  image: DecorationImage(image: AssetImage(ImageAssets.foodBackground),fit: BoxFit.fill),
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
              title: Text('Mohamed ali'),
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
              title: Text('0123456789'),
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
              title: Text('4 El-mehata street - El-zohor village'),
            ),
            ),
            SizedBox(height: myHeight*.03),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(ColorManager.primary)),
              child: Text(
                AppString.foodTaken,
                style: TextStyle(fontSize: 18, color: ColorManager.white),
              ),
            ),
            SizedBox(height: myHeight*.01),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(ColorManager.primary)),
              child: Text(
                AppString.cancelRequest,
                style: TextStyle(fontSize: 18, color: ColorManager.white),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
