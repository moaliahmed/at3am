import 'package:at3am/authentication/page/signup_screen.dart';
import 'package:at3am/core/assets_manager.dart';
import 'package:at3am/core/string_manager.dart';
import 'package:flutter/material.dart';
import '../../core/color_manger.dart';
import '../component/button_component.dart';
import '../component/text_form_field_component.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailEditingController = TextEditingController();

  TextEditingController passwordEditingController = TextEditingController();

  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
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
                    height: height * .25,
                    child: Center(
                        child: Image.asset(ImageAssets.splashLogo))),
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
                             AppString.loginToYourAccount,
                              style: TextStyle(
                                  fontSize: 21,
                                  color: ColorManager.primary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              AppString.forgotPassword,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            InkWell(
                              onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const ForgotPasswordView(),));
                              },
                              child: Text(
                                textAlign: TextAlign.right,
                                AppString.clickHere,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ColorManager.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ButtonComponent(
                        title: AppString.signIn,
                        function: () {
                          // todo write Navigator go home screen
                          // Navigator.pushReplacementNamed(context, Routes.home);
                        },
                      ),
                      SizedBox(
                        height: height * .05,
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
                              icon: Image.asset(ImageAssets.xLogo,width: 32,),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(ImageAssets.googleLogo,width: 42,),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(ImageAssets.facebookLogo,width: 42,),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        textAlign: TextAlign.center,
                        AppString.orSignInUsingDis,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(AppString.doNotHaveAnAccount),
                            TextButton(
                              onPressed: () {
                                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
                              },
                              child: Text(
                                AppString.signUp,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ColorManager.litePrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
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
