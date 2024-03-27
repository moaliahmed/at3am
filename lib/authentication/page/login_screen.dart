import 'package:at3am/authentication/page/signup_screen.dart';
import 'package:at3am/cashe_helper.dart';
import 'package:at3am/core/assets_manager.dart';
import 'package:at3am/core/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/color_manger.dart';
import '../../home/page/home_layout.dart';
import '../component/button_component.dart';
import '../component/text_form_field_component.dart';
import '../controller/login_cubit/login_auth_cubit.dart';
import 'forgot_password.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen();

  var formKey = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => LoginAuthCubit(),
      child: BlocConsumer<LoginAuthCubit, LoginAuthState>(
          listener: (context, state) {
        if (state is LoginAuthSucessState) {
          //save uId
          CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomeLayout(),
              ),
              (route) {
                return false;
              },
            );
          }).catchError((error) {
            print(
                'this print in login screen and hapen in cahe helper saveData');
          });
        }
      }, builder: (context, state) {
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
                        child:
                            Center(child: Image.asset(ImageAssets.splashLogo))),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorManager.background,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Form(
                        key: formKey,
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
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !value.contains('@')) {
                                  return 'Please Enter Email';
                                }
                                return null;
                              },
                            ),
                            TextFormFieldComponent(
                              hide: true,
                              title: AppString.password,
                              icons: Icons.lock_outline_rounded,
                              textEditingController: passwordEditingController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Password must be longer than 6 characters";
                                }
                                return null;
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    AppString.forgotPassword,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ForgotPasswordView()),
                                      );
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
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }
                                showDialog(
                                  context: context,
                                  builder: (context) => Center(
                                    child:
                                        Lottie.asset(ImageAssets.loadingImage),
                                  ),
                                );
                                LoginAuthCubit.get(context).userLogin(
                                    email: emailEditingController.text,
                                    password: passwordEditingController.text);
                              },
                            ),
                            SizedBox(
                              height: height * .05,
                            ),
                            const Text(
                              textAlign: TextAlign.center,
                              AppString.orSignInUsing,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpScreen(),
                                          ));
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
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
