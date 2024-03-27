import 'package:at3am/core/color_manger.dart';
import 'package:at3am/core/cubit/app_cubit.dart';
import 'package:at3am/core/cubit/app_state.dart';
import 'package:at3am/home/page/request_food.dart';
import 'package:at3am/models/food_model.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication/component/shared_widgets.dart';
import 'add_food.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state){},
      builder: (context, state){
        return Scaffold(
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
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
                // Building Card List

                FirebaseAnimatedList(
                  physics: NeverScrollableScrollPhysics(),
                    query: AppCubit.get(context).dbRef!,
                    shrinkWrap: true,
                    itemBuilder: (context, snapshot, animation, index){
                      Map foodData = snapshot.value as Map;
                      FoodModel foodModel = FoodModel.fromJson(foodData);
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                RequestFoodScreen(foodModel: foodModel)
                          ));
                        },
                          child: listCard(foodModel)
                      );
                    }
                ),

                //lisView get by firesotre database
                // ListView.separated(
                //     shrinkWrap: true,
                //     physics: NeverScrollableScrollPhysics(),
                //     itemBuilder: (context, index) => listCard(AppCubit.get(context).foods[index]),
                //     separatorBuilder:(context, index) => SizedBox(height: 5.0,),
                //     itemCount: AppCubit.get(context).foods.length)
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
      },
    );
  }
}
