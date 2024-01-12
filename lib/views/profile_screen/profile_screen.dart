import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/views/auth_screen/login_screen.dart';
import 'package:emart_app/views/profile_screen/columns/details_card.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  bgWidget(
          child: Scaffold(
            body: SafeArea(child: Column(
              children: [


                const Align(alignment: Alignment.topRight,child:  Icon(Icons.edit,color: whiteColor,)).onTap(() {
                  
                }),



                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                  child: Row(
                    children: [
                      Image.asset(imgProfile2,width: 100,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
                      10.widthBox, 
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Dummy User".text.fontFamily(semibold).white.make(),
                          5.heightBox,
                          "customer@exemple.com".text.white.make(),
                        ],
                      )),
                      OutlinedButton(
                        onPressed: () async{
                        await  Get.put(AuthController()).signoutMethod(context);
                        Get.offAll(() => const LoginScreen());
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: whiteColor,
                          )
                        ),
                        child: logout.text.fontFamily(semibold).white.make(),)
                    ],
                  ),
                ),

                20.heightBox,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    detailsCard(context.screenWidth / 3.2, "00", "in your cart"),

                    detailsCard(context.screenWidth / 3.2, "00", "in your wishlist"),

                    detailsCard(context.screenWidth / 3.2, "00", "your orders"),
                  ],
                ),


                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const Divider(color: lightGrey,);
                  },
                  itemCount: profileButtonsList.length,
                  itemBuilder: (BuildContext context,int index){
                    return ListTile(
                      leading: Image.asset(profileButtonsIcon[index],width: 22,color: darkFontGrey,),
                      title: profileButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                    );
                  }).box.white.rounded.margin(const EdgeInsets.all(12)).padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make(),

              ],
            )),
          )
    );
  }
}