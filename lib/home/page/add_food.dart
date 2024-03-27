import 'package:at3am/core/assets_manager.dart';
import 'package:at3am/core/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/string_manager.dart';
import '../../home/component/text_form_field_component.dart';
import '../../core/cubit/app_cubit.dart';
import '../../core/cubit/app_state.dart';
import '../component/food_category.dart';
import 'home_layout.dart';

class AddFoodScreen extends StatelessWidget {
  AddFoodScreen({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is CreateFoodSuccessState){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeLayout(),
            ),
                (route) {
              return false;
            },
          );
        }

      },
      builder: (context, state) {
        var cubit = AppCubit.get(context)..getCurrentLocation();
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Donate Food Details',
              style: TextStyle(
                color: ColorManager.primary,
              ),
            ),
            actions: [
              IconButton(onPressed: ()=>cubit.openMap(), icon: Icon(Icons.location_on_outlined,color: ColorManager.primary,))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => cubit.changeFoodCategory('Grocery'),
                      child: FoodCategory(
                        myWidth: myWidth,
                        title: 'Grocery',
                        index: 'Grocery',
                        image: ImageAssets.vectorIcon,
                        currentIndex: cubit.foodCategory,
                      ),
                    ),
                    InkWell(
                      onTap: () => cubit.changeFoodCategory('Prepared Food'),
                      child: FoodCategory(
                        myWidth: myWidth,
                        title: 'Prepared Food',
                        index: 'Prepared Food',
                        image: ImageAssets.hotPotIcon,
                        currentIndex: cubit.foodCategory,
                      ),
                    ),
                    InkWell(
                      onTap: () => cubit.changeFoodCategory('Fruits'),
                      child: FoodCategory(
                        myWidth: myWidth,
                        title: 'Fruits',
                        index: 'Fruits',
                        image: ImageAssets.appleIcon,
                        currentIndex: cubit.foodCategory,
                      ),
                    ),
                    InkWell(
                      onTap: () => cubit.changeFoodCategory('Beverages'),
                      child: FoodCategory(
                        myWidth: myWidth,
                        title: 'Beverages',
                        index: 'Beverages',
                        image: ImageAssets.sodaIcon,
                        currentIndex: cubit.foodCategory,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: myHeight * .03),
                TextFormFieldComponent(
                  title: 'Food Title',
                  icons: Icons.fastfood_outlined,
                  textEditingController: titleController,
                ),
                TextFormFieldComponent(
                  title: 'Food details',
                  icons: Icons.more_horiz_sharp,
                  textEditingController: detailsController,
                ),
                TextFormFieldComponent(
                  title: 'Address',
                  icons: Icons.home_outlined,
                  textEditingController: addressController,
                ),
                SizedBox(height: myHeight * .03),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quantity : ${cubit.quantity}',
                        style: TextStyle(
                            color: ColorManager.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Slider(
                  activeColor: ColorManager.primary,
                  thumbColor: ColorManager.primary,
                  min: 1,
                  max: 12,
                  value: cubit.quantity.toDouble(),
                  onChanged: (value) =>
                      cubit.changeQuantitySlider(value.toInt()),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'min:1',
                        style: TextStyle(color: ColorManager.grey),
                      ),
                      Text('max:12',
                          style: TextStyle(color: ColorManager.grey)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    cubit.foodImage == null
                        ? InkWell(
                            onTap: () => cubit.getImage(),
                            child: Container(
                              margin: EdgeInsets.all(8),
                              height: myHeight * .1,
                              width: myWidth * .25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: ColorManager.lightGrey),
                              child: Icon(Icons.add),
                            ),
                          )
                        : Row(
                          children: [
                            Container(
                                margin: EdgeInsets.all(8),
                                height: myHeight * .1,
                                width: myWidth * .25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: ColorManager.lightGrey,
                                    image: DecorationImage(
                                        image: FileImage(cubit.foodImage!))),
                              ),
                            IconButton(onPressed: () =>cubit.deleteImage() , icon: Icon(Icons.delete,color: ColorManager.red,))
                          ],
                        ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    AppCubit.get(context).uploadPostImage(
                        foodTitle: titleController.text,
                        foodDetails: detailsController.text,
                        foodAddress: addressController.text);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(ColorManager.primary)),
                  child: Text(
                    AppString.ok,
                    style: TextStyle(fontSize: 18, color: ColorManager.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
