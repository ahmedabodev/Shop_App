
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/const.dart';
import 'package:softagi/controller/card_data_contolloer.dart';
import 'package:softagi/services/theme_services.dart';
import 'package:softagi/view/Screens/categories.dart';
import 'package:softagi/view/Screens/serachscreen.dart';
import 'package:softagi/view/widgets/cart_num.dart';
import 'package:softagi/view/widgets/custom_button.dart';
import 'package:softagi/view/widgets/custom_text.dart';
import '../../theme.dart';
import 'cart.dart';
import 'favorites.dart';
import 'package:softagi/view/Screens/home_screen.dart';
import 'package:softagi/view/Screens/settings.dart';

import 'login_screen.dart';

class bottom_navigation_bar extends StatefulWidget {
  @override
  _bottom_navigation_barState createState() => _bottom_navigation_barState();
}

class _bottom_navigation_barState extends State<bottom_navigation_bar> {
  List<Widget> _screens = [
    homeScreen(),
    categories(),
    favorites(),
    settings(),
  ];

  final bot controller = Get.put(bot());
  final ThemeController c = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
    //       leading: GetBuilder<ThemeController>(
    //           init: ThemeController(),
    //           builder: (controller) => CupertinoSwitch(
    //             activeColor: Colors.black,
    //             thumbColor: Colors.teal,
    //             value: controller.isDarkMode, onChanged: (bool value) {
    //               controller.change(value);
    // ThemeServices().switchTheme();
    //
    // },)),
          leading: IconButton(onPressed: () {
            Get.to(searchscreen());
          }, icon: Icon(Icons.search),),
          actions: [
            IconButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove(keyAccessToken);
                  Get.offAll(loginscreen());
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.teal,
                )),
          ],
        ),
        bottomNavigationBar: GetBuilder<bot>(
          init: bot(),
          builder: (controller) {
            return BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 0.01,
              clipBehavior: Clip.antiAlias,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 0.5),
                    )),
                child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    // backgroundColor:Get.isDarkMode?Color(0xff1F1D36): context.theme.backgroundColor,
                    onTap: (value) {
                      controller.change(value);
                    },
                    currentIndex: controller.index,
                    elevation: 20,
                    // selectedItemColor: Colors.red,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.category_outlined),
                          label: 'Categories'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.favorite), label: 'Favorites'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.settings), label: 'Settings'),
                      // BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
                    ]),
              ),
            );
          },
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Container(
          height: 50,
          margin: const EdgeInsets.only(top: 10),
          child: FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            onPressed: () {
              Get.to(cartscreen());
            },
            child: cart_num(),

            // hoverElevation: 10,
            // splashColor: Colors.red,
          ),
        ),
        body: WillPopScope(
          onWillPop: onWillPop,
          child: GetBuilder<bot>(
            builder: (controller) {
              return _screens[controller.index];
            },
          ),
        ));
  }
  Future<bool> onWillPop() async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 0,
        title: Text('Are you sure?'),
        content: Text('Do you want close The app?'),
        actions: <Widget>[
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
        ],
      ),
    );

    return shouldPop ?? false;
  }

}
