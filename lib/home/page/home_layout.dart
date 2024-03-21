import 'package:at3am/home/controller/home_controller/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/assets_manager.dart';
import '../../core/color_manger.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: cubit.screen[cubit.currentScreen],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentScreen,
              onTap: (value) => cubit.changeScreen(value),
              items: [
                BottomNavigationBarItem(
                  label: '',
                  icon: Image.asset(
                    ImageAssets.homeIcon1,
                    height: myHeight * .035,
                    color: ColorManager.grey,
                  ),
                  activeIcon: Image.asset(
                    ImageAssets.homeIcon2,
                    height: myHeight * .035,
                    color: ColorManager.primary,
                  ),
                ),
                BottomNavigationBarItem(
                  label: '',
                  icon: Image.asset(
                    ImageAssets.profileIcon1,
                    height: myHeight * .035,
                    color: ColorManager.grey,
                  ),
                  activeIcon: Image.asset(
                    ImageAssets.profileIcon2,
                    height: myHeight * .035,
                    color: ColorManager.primary,
                  ),
                ),
              ],
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: CircleAvatar(
                            child: Image.asset(ImageAssets.personImage),
                            radius: 40,
                          ),
                        ),
                        Text(
                          'mohamed ali',
                          style: TextStyle(
                              color: ColorManager.white, fontSize: 23),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: myHeight * .03,
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(
                        Icons.home,
                        color: ColorManager.primary,
                      ),
                      title: Text(
                        'home',
                        style: TextStyle(
                            color: ColorManager.primary, fontSize: 22),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(
                        Icons.language,
                        //  color: ColorManager.primary,
                      ),
                      title: Text(
                        'Language',
                        style: TextStyle(
                          fontSize: 22,
                          //    color: ColorManager.primary,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(
                        Icons.info_outline,
                        // color: ColorManager.primary,
                      ),
                      title: Text(
                        'About',
                        style: TextStyle(
                          fontSize: 22,
                          //color: ColorManager.primary,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(
                        Icons.logout_outlined,
                        // color: ColorManager.primary,
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 22,
                          //color: ColorManager.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
