import 'package:at3am/authentication/component/drop_down_component.dart';
import 'package:at3am/authentication/page/login_screen.dart';
import 'package:at3am/core/string_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/assets_manager.dart';
import '../../core/color_manger.dart';
import '../component/button_component.dart';
import '../component/text_form_field_component.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController userEditingController = TextEditingController();

  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmPassEditingController = TextEditingController();

  String dropDownValue = '';

  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    userEditingController.dispose();
    confirmPassEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: ListView(
              children: [
                SizedBox(
                  height: height * .05,
                ),
                SizedBox(
                    height: height * .15,
                    child: Center(child: Image.asset(ImageAssets.splashLogo))),
                Container(
                  decoration: BoxDecoration(
                    color: ColorManager.background,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              AppString.signUpToNewAccount,
                              style: TextStyle(
                                  fontSize: 21,
                                  color: ColorManager.primary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      TextFormFieldComponent(
                        title: AppString.userName,
                        icons: Icons.person_outline_rounded,
                        textEditingController: userEditingController,
                      ),
                      TextFormFieldComponent(
                        title: AppString.email,
                        icons: Icons.email_outlined,
                        textEditingController: emailEditingController,
                      ),
                      TextFormFieldComponent(
                        hide: true,
                        title: AppString.password,
                        icons: Icons.lock_outline_rounded,
                        textEditingController: passwordEditingController,
                      ),
                      TextFormFieldComponent(
                        hide: true,
                        title: AppString.confirmPassword,
                        icons: Icons.lock_outline_rounded,
                        textEditingController: confirmPassEditingController,
                      ),
                      DropDownComponent(),
                      ButtonComponent(
                        title: AppString.signUp,
                        function: () {
                          // todo write Navigator go home screen
                          // Navigator.pushReplacementNamed(context, Routes.home);
                        },
                      ),
                      const Text(
                        textAlign: TextAlign.center,
                        AppString.orSignInUsing,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                ImageAssets.xLogo,
                                width: 32,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                ImageAssets.googleLogo,
                                width: 42,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                ImageAssets.facebookLogo,
                                width: 42,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(AppString.doHaveAnAccount),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ));
                            },
                            child: Text(
                              AppString.signIn,
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorManager.litePrimary,
                              ),
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
      ),
    );
  }
}
