import 'package:at3am/core/color_manger.dart';
import 'package:flutter/material.dart';

import '../../authentication/component/shared_widgets.dart';
import 'add_food.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Search bar
            Container(
              height: 60.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0)
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            listCard(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => AddFoodScreen(),));
        },
        child: Icon(Icons.add,color: ColorManager.white,),
        backgroundColor: ColorManager.primary,
      ),
    );
  }
}
