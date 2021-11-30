import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi/controller/card_data_contolloer.dart';
import 'package:softagi/controller/cart_num.dart';

import '../../theme.dart';
import 'custom_text.dart';

class cart_num extends StatefulWidget {

  @override
  _cart_numState createState() => _cart_numState();
}

class _cart_numState extends State<cart_num> {
final cartnum c=Get.put(cartnum());
@override

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit:StackFit.expand,
      alignment: Alignment.topRight,
      children: [
        Icon(Icons.add_shopping_cart),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: GetX<cartnum>(
              builder: ( controller) {
            return custom_text(text:" ${c.num1.obs.toString()}",style: cartstyle,);
          }
          ),)

      ], );
  }
}
