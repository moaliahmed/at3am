import 'package:at3am/authentication/page/login_screen.dart';
import 'package:at3am/core/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../core/assets_manager.dart';
import '../../core/color_manger.dart';
import '../component/button_component.dart';
import '../component/text_form_field_component.dart';
import '../controller/register_cubit/register_auth_cubit.dart';
import '../controller/register_cubit/register_auth_state.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController emailEditingController = TextEditingController();
  TextEditingController userNameEditingController = TextEditingController();

  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final GlobalKey<FormState> formKey= GlobalKey<FormState>();
  // String dropDownValue = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => RegisterAuthCubit(),
      child: BlocConsumer<RegisterAuthCubit, RegisterAuthState>(
        listener: (context, state) {
          if (state is CreateAuthSucessState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SafeArea(
                  child: Form(
                    key: formKey,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: height * .05,
                        ),
                        SizedBox(
                            height: height * .15,
                            child: Center(
                                child: Image.asset(ImageAssets.splashLogo))),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorManager.background,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
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
                                textEditingController: userNameEditingController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter name";
                                  }
                                  return null;
                                },
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
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              TextFormFieldComponent(
                                hide: true,
                                title: AppString.password,
                                icons: Icons.lock_outline_rounded,
                                textEditingController: passwordEditingController,
                                validator: (value){
                                  if (value == null || value.isEmpty||value.length<=6) {
                                    return "Password must be longer than 6 characters";
                                  }
                                  return null;

                                },
                              ),
                              TextFormFieldComponent(
                                title: AppString.phoneNumber,
                                icons: Icons.phone,
                                textEditingController: phoneNumberController,
                                keyboardType: TextInputType.phone,
                                maxLength: 11,
                                validator: (value) {
                                  if (value == null || value.isEmpty || value.length != 11) {
                                    return 'Please correct phone number';
                                  }
                                  return null;
                                },
                              ),
                              // DropDownComponent(),
                              ButtonComponent(
                                title: AppString.signUp,
                                function: () {
                                  // todo write Navigator go home screen
                                  // Navigator.pushReplacementNamed(context, Routes.home);
                                  if (!formKey.currentState!.validate()) {
                                    return;
                                  }
                                  showDialog(context: context,builder: (context) => Center(
                                    child: Lottie.asset(ImageAssets.loadingImage),
                                  ),);
                                  RegisterAuthCubit.get(context).userRegister(
                                      name: userNameEditingController.text,
                                      email: emailEditingController.text,
                                      password: passwordEditingController.text,
                                      phoneNumber: phoneNumberController.text);
                                },
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
                                      AppString.signUp,
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
            ),
          );
        },
      ),
    );
  }
}
