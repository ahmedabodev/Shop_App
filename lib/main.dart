import 'dart:io';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:softagi/services/theme_services.dart';
import 'package:softagi/theme.dart';
import 'package:softagi/view/Screens/google.dart';
import 'package:softagi/view/auth_container.dart';
import 'package:softagi/view/Screens/home_screen.dart';
import 'package:softagi/view/Screens/login_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() async{
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      home: AnimatedSplashScreen(
        //to cover the photo the phone
        splashIconSize: double.infinity,
        duration: 1000,
        splash: Image.asset(
          'assets/images/img.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        nextScreen: aut_container(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
