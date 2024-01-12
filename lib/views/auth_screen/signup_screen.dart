import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/views/auth_screen/login_screen.dart';
import 'package:emart_app/views/home_screen/home.dart';
import 'package:emart_app/widgets_common/applogo_widget.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool? isCheck = false;
  var controller = Get.put(AuthController());
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.07).heightBox,
            applogoWidget(),
            10.heightBox,
            "Join $appname".text.fontFamily(bold).white.size(18).make(),
            30.heightBox,
            Column(
              children: [
                customTextField(hinte: nameHint, title: name,controller: nameController,isPass: false),
                5.heightBox,
                customTextField(hinte: emailHint, title: email,controller: emailController,isPass: false),
                5.heightBox,
                customTextField(hinte: passwordHint, title: password,controller: passwordController,isPass: true),
                5.heightBox,
                customTextField(hinte: passwordHint, title: retypePasswd,controller: passwordRetypeController,isPass: true),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: forgetPasswd.text.make(),
                  ),
                ),

                //ourButton().box.width(context.screenWidth - 50).make(),

                Row(
                  children: [
                    Checkbox(
                        activeColor: redColor,
                        checkColor: whiteColor,
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue;
                          });
                          
                        }),
                    10.heightBox,
                    Expanded(
                      child: RichText(
                          text: const TextSpan(
                        children: [
                          TextSpan(
                              text: "I agree to the ",
                              style: TextStyle(
                                fontFamily: regular,
                                color: fontGrey,
                              )),
                          TextSpan(
                              text: termAndCond,
                              style: TextStyle(
                                fontFamily: regular,
                                color: redColor,
                              )),
                          TextSpan(
                              text: " & ",
                              style: TextStyle(
                                fontFamily: regular,
                                color: fontGrey,
                              )),
                          TextSpan(
                              text: privacyPolicy,
                              style: TextStyle(
                                fontFamily: regular,
                                color: redColor,
                              )),
                        ],
                      )),
                    ),
                  ],
                ),
                5.heightBox,
                ourButton(
                        color: isCheck == true ? redColor : lightGrey,
                        title: signup,
                        textColor: whiteColor,
                        onPress: () async {
                          if(isCheck != false){
                            try{
                              await controller.signupMethod(context: context,email: emailController.text,password: passwordController.text).then((value) {
                                return controller.storeUserData(
                                  email: emailController.text,password: passwordController.text,name: nameController.text
                                );
                              }).then((value) {
                                VxToast.show(context, msg: loggedin);
                                Get.offAll(()=>const LoginScreen());
                              });
                            }catch (e){
                              auth.signOut();
                              VxToast.show(context, msg: e.toString());
                            }
                          }
                        })
                    .box
                    .width(context.screenWidth - 50)
                    .make(),

                10.heightBox,
                RichText(
                    text: const TextSpan(
                  children: [
                    TextSpan(
                        text: alreadyHaveAcc,
                        style: TextStyle(
                          fontFamily: bold,
                          color: fontGrey,
                        )),
                    TextSpan(
                        text: login,
                        style: TextStyle(
                          fontFamily: bold,
                          color: redColor,
                        )),
                  ],
                )).onTap(() {
                  Get.back();
                }),
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowLg
                .make(),
          ],
        ),
      ),
    ));
  }
}
