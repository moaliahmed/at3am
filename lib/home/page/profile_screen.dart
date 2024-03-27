import 'package:at3am/core/color_manger.dart';
import 'package:at3am/core/cubit/app_cubit.dart';
import 'package:at3am/core/cubit/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/assets_manager.dart';
import '../../core/string_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body:
          Container(
            height: myHeight,
            width: myWidth,
            decoration: BoxDecoration(color: ColorManager.primary),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: Image.asset(ImageAssets.personImage),
                        radius: 40,
                      ),
                      SizedBox(height: myHeight * .02),
                      Text(
                        AppString.profileName,
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorManager.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    'You Quenched the hunger of 20 people this month',
                    style: TextStyle(
                        fontSize: 22,
                        color: ColorManager.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.all(10),
                  height: myHeight * .6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32)),
                      color: ColorManager.white),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              if (!cubit.isDonations) {
                                cubit.changeProfileList();
                              }
                            },
                            child: Text(
                              'My Donations',
                              style: TextStyle(
                                  color: cubit.isDonations
                                      ? ColorManager.primary
                                      : ColorManager.black,
                                  fontSize: 18),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (cubit.isDonations) {
                                cubit.changeProfileList();
                              }
                            },
                            child: Text(
                              'Requested Order',
                              style: TextStyle(
                                  color: !cubit.isDonations
                                      ? ColorManager.primary
                                      : ColorManager.black,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child:cubit.isDonations?
                        ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: ColorManager.lightGrey),
                              padding: EdgeInsets.all(12),
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImageAssets.personImage,
                                    width: 80,
                                  ),
                                  SizedBox(width: myWidth * .02),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text('Meals'),
                                        Text('Category:Prepared Food'),
                                        Text(
                                          'October 12 2021',
                                          style: TextStyle(
                                              color:
                                              ColorManager.primary),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios_rounded)
                                ],
                              ),
                            );
                          },
                        ) :
                        ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: ColorManager.lightGrey),
                              padding: EdgeInsets.all(12),
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImageAssets.personImage,
                                    width: 80,
                                  ),
                                  SizedBox(width: myWidth * .02),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text('Meals'),
                                        Text('Category:Prepared Food'),
                                        Text(
                                          'October 12 2021',
                                          style: TextStyle(
                                              color:
                                              ColorManager.primary),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios_rounded)
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
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
