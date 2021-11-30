import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/controller/login_controller.dart';
import 'package:softagi/controller/profile_controller.dart';
import 'package:softagi/services/theme_services.dart';
import 'package:softagi/view/Screens/FAQ.dart';
import 'package:softagi/view/widgets/custom_text.dart';

import '../../const.dart';
import '../../theme.dart';
import 'login_screen.dart';

class settings extends StatelessWidget {
final profilecontroller controller=Get.put(profilecontroller());
final ThemeController c=Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          custom_text(text: 'Settings',
            style: heading1style,
          ),
          GetBuilder<profilecontroller>(
            builder: (controller) {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(

                        backgroundImage:NetworkImage(controller.image.toString()) ,
                        radius: 80,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          custom_text(text:controller.name.toString(),style:headingstyle,),

                          custom_text(text:controller.email.toString() ,style: subTitlestyle,),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }, ),



          Column(
            children: [
              ListTile(
                leading: Icon(Icons.brightness_6_sharp),
                trailing: GetBuilder<ThemeController>(
                    init: ThemeController(),
                    builder: (controller) => CupertinoSwitch(
                      activeColor: Colors.black45,
                      thumbColor: Colors.teal,
                      trackColor: Colors.white,
                      value: controller.isDarkMode, onChanged: (bool value) {
                      controller.change(value);
                      ThemeServices().switchTheme();

                    },)),
                title: custom_text(text: 'Theme Mode',style: titlestyle,),

              ),
              InkWell(
                onTap: (){
                  Get.to(faqscreen());
                },
                child: ListTile(
                  leading:Icon(Icons.edit) ,
                  trailing: IconButton(onPressed: (){},icon: Icon(Icons.arrow_forward_ios_outlined),),
                  title: custom_text(text: 'FAQ',style: Theme.of(context).textTheme.bodyText1, ),
                ),
              ),
              ListTile(
                leading:Icon(Icons.location_on_outlined) ,
                trailing: IconButton(onPressed: (){},icon: Icon(Icons.arrow_forward_ios_outlined),),
                title: custom_text(text: 'Address',style: titlestyle,),
              ),
              ListTile(
                leading:Icon(Icons.watch_later_outlined) ,
                trailing: IconButton(onPressed: (){},icon: Icon(Icons.arrow_forward_ios_outlined),),
                title: custom_text(text: 'Order History',style: titlestyle,),
              ),
              ListTile(
                leading:Icon(Icons.credit_card) ,
                trailing: IconButton(onPressed: (){},icon: Icon(Icons.arrow_forward_ios_outlined),),
                title: custom_text(text: 'Cart',style: titlestyle,),
              ),
              GestureDetector(
                onTap:   () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(keyAccessToken);
    Get.offAll(loginscreen());
    },
                child: ListTile(
                  leading:Icon(Icons.logout) ,
                  trailing: IconButton(onPressed: (){},icon: Icon(Icons.arrow_forward_ios_outlined),),
                  title: custom_text(text: 'Log Out',style: titlestyle,),
                ),
              ),
            ],
          ),
          SizedBox(height: 40,)

        ],
      ),
    );
  }
}
