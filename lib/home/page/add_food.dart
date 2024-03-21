import 'package:at3am/core/assets_manager.dart';
import 'package:at3am/core/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/cubit/app_cubit.dart';
import '../../core/cubit/app_state.dart';

class AddFoodScreen extends StatelessWidget {
  const AddFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit,AppState>(

      listener: (context, state) {},
      builder: (context, state) {
        var cubit= AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Donate Food Details',
              style: TextStyle(
                color: ColorManager.primary,
              ),
            ),
          ),
          body: ListView(
            children: [
              SizedBox(
                height: myHeight * .2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    food_category(
                      myWidth: myWidth,
                      title: 'Grocery',
                      index: 0,
                      image: ImageAssets.vectorIcon,
                      currentIndex: cubit.foodCategoryIndex,
                    ),
                    food_category(
                      myWidth: myWidth,
                      title: 'Prepared Food',
                      index: 1,
                      image: ImageAssets.hotPotIcon,
                      currentIndex: cubit.foodCategoryIndex,
                    ),
                    food_category(
                      myWidth: myWidth,
                      title: 'Fruits',
                      index: 2,
                      image: ImageAssets.appleIcon,
                      currentIndex: cubit.foodCategoryIndex,
                    ),
                    food_category(
                      myWidth: myWidth,
                      title: 'Beverages',
                      index: 3,
                      image: ImageAssets.sodaIcon,
                      currentIndex: cubit.foodCategoryIndex,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class food_category extends StatelessWidget {
  const food_category({
    super.key,
    required this.myWidth,
    required this.image,
    required this.title,
    required this.index,
    required this.currentIndex,
  });

  final double myWidth;
  final String image;
  final String title;
  final int index;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          width: myWidth * .15,
          height: myWidth * .15,
          decoration: BoxDecoration(
              color: index == currentIndex
                  ? ColorManager.primary
                  : ColorManager.lightGrey,
              borderRadius: BorderRadius.circular(12)),
          child: Image.asset(
            image,
            color:
                index == currentIndex ? ColorManager.white : ColorManager.grey,
          ),
        ),
        Text(
          title,
          style: index == currentIndex
              ? TextStyle(
                  color: ColorManager.black, fontWeight: FontWeight.bold)
              : TextStyle(color: ColorManager.grey),
        )
      ],
    );
  }
}
