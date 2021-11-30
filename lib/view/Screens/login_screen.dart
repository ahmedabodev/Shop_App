import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:softagi/controller/login_controller.dart';
import 'package:softagi/model/profil_model.dart';
import 'package:softagi/services/theme_services.dart';
import 'package:softagi/view/Screens/register_screen.dart';
import 'package:softagi/view/widgets/custom_button.dart';
import 'package:softagi/view/widgets/custom_text.dart';
import 'package:softagi/view/widgets/custom_text_form_field.dart';
import 'package:softagi/view/widgets/custom_text_form_field_pass.dart';
import '../../const.dart';
import '../../theme.dart';
import '../auth_container.dart';
import 'forgetpassward.dart';
import 'home_screen.dart';


class loginscreen extends StatefulWidget {
  String? email, password;
  profileemodel? profilemod;

  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final ThemeController c=Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar:AppBar(
  actions: [
    GetBuilder<ThemeController>(
        init: ThemeController(),
        builder: (controller) => CupertinoSwitch(
          activeColor: Colors.black45,
          thumbColor: Colors.teal,
          trackColor: Colors.white,
          value: controller.isDarkMode, onChanged: (bool value) {
          controller.change(value);
          ThemeServices().switchTheme();

        },)),
  ],
),
      body: DoubleBackToCloseApp(

        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
                    child: Card(
                      elevation: 10,

                      shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .06,
                          ),
                          Container(
                            child: custom_text(
                              text: 'LOGIN',
                              style: bodystyle,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .04,
                          ),
                          Container(
                            padding: const EdgeInsetsDirectional.only(
                                start: 10, end: 10),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: custom_text_form_field(
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value.isEmpty ||
                                    !(value.contains('@')) ||
                                    !(value.contains('.com'))) {
                                  return 'Please Enter you correct Email';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                widget.email = value;
                              },
                              hint: 'Email',
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          Container(
                            padding: const EdgeInsetsDirectional.only(
                                start: 10, end: 10),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: custom_text_form_field_pass(
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              icon: const Icon(Icons.lock),
                              hintText: 'Enter your Password',
                              onsaved: (value) {
                                widget.password = value;
                              },
                              validator: (value) {
                                // RegExp regex = RegExp(
                                //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                // print(value);
                                if (value.isEmpty ||
                                    value.length < 3 ||
                                    value.length > 16) {
                                  return 'Please Enter a correct password';
                                } else {
                                  // if (!regex.hasMatch(value))
                                  //   return 'Enter valid password';
                                  // else
                                  return null;
                                }
                              },
                              helperText: 'Mostafa',
                              initialvalue: 'hey',
                            ),
                          ),
                          Container(
                            padding: const EdgeInsetsDirectional.only(
                                start: 10, end: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(

                                  onPressed: () {
                                    Get.to(forgetpassward());
                                  },
                                  child: custom_text( text: 'Forget your Password',),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            //width: double.infinity,
                            child: custom_button(

                              child: Container(

                                child: custom_text(
                                  text: 'Login',
                                  style: titlestyle,
                                ),
                              ),
                              textColor: Colors.white,
                              backgroundColor: Colors.red
                              ,
                              onPressed: () {
                                _formKey.currentState?.save();
                                if (_formKey.currentState!.validate()) {
                                  loginApi(
                                    email: '${widget.email}',
                                    password: '${widget.password}',
                                  ).then((value) {

                                    if (value == true) {
                                      Get.offAll(aut_container());
                                    }
                                  });
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                custom_text(
                                  text: 'Don\'t have an account',
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return register();
                                    }));
                                  },
                                  child:  custom_text(text: 'Rigester Now',

                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
