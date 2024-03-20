import 'package:at3am/core/assets_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/color_manger.dart';
import '../../core/string_manager.dart';
import '../component/button_component.dart';
import '../component/text_form_field_component.dart';
class ForgotPasswordView extends StatefulWidget {
 const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  TextEditingController emailEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailEditingController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailEditingController.text);

      // temporary show dialog
      showDialog(context: context, builder: (context){
        return AlertDialog(content: Text('Password reset link sent! Check your email'));
      });

    } on FirebaseAuthException catch (e) {
      print(e);

      // temporary show dialog
      showDialog(context: context, builder: (context){
        return AlertDialog(content: Text(e.message.toString()),);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorManager.background,elevation: 0,),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: height * .4,
                    child: Center(
                        child: Image.asset(ImageAssets.splashLogo))),

                Container(
                  height: MediaQuery.of(context).size.height * .7,
                  decoration:  BoxDecoration(
                    color: ColorManager.background,
                    borderRadius:const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:const EdgeInsets.all(8.0),
                            child: Text(
                              AppString.forgotPassword,
                              style: TextStyle(
                                  fontSize: 21,
                                  color: ColorManager.litePrimary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Text(
                            ' Please enter your registered email\n address to recover your password',
                            style:
                                TextStyle(color: Colors.black26, fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: TextFormFieldComponent(
                              title: 'Email',
                              icons: Icons.email_outlined,
                              textEditingController: emailEditingController,
                            ),
                          ),
                          ButtonComponent(title: 'Send', function: passwordReset),
                        ],
                      ),
                    ),
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
