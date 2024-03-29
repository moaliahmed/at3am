import 'package:at3am/home/page/about_us.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication/page/login_screen.dart';
import '../../core/assets_manager.dart';
import '../../core/color_manger.dart';
import '../../core/cubit/app_cubit.dart';
import '../../core/cubit/app_state.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: cubit.currentScreen==1?ColorManager.primary:ColorManager.white,
            iconTheme: IconThemeData(
              color: cubit.currentScreen==1?ColorManager.white:ColorManager.black
            ),
          ),
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
                        '${AppCubit.get(context).userModel?.name}',
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const AboutUsScreen()),
                    );
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.info_outline,
                      // color: ColorManager.primary,
                    ),
                    title: Text(
                      'About Us',
                      style: TextStyle(
                        fontSize: 22,
                        //color: ColorManager.primary,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: ()async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) =>  LoginScreen()),
                          (Route<dynamic> route) => false,
                    );
                  },
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
    );
  }
}
