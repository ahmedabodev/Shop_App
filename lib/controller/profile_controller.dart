import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/const.dart';
import 'package:http/http.dart'as http;
import 'dart:async';
import 'dart:convert';

import 'package:softagi/model/home_data_model.dart';
import 'package:softagi/model/profil_model.dart';
String? image;
String? name;
class profilecontroller extends GetxController{
  List<profileemodel>profile=[];
  String? email;
  String? name;
  String? image;

  profilecontroller(){
    profiledata().then((value) => update());

  }

   Future profiledata()async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.get(keyAccessToken).toString();
      print("=====tokennnnn${token}");
      var url = Uri.parse(baseURL+'/profile');
      var respone=await http.get(url,
          headers:{
        'Authorization':token,

          });
      email= jsonDecode(respone.body)['data']['email'];
      name= jsonDecode(respone.body)['data']['name'];
      image= jsonDecode(respone.body)['data']['image'];


      print(email);
      // for (var i in responebody) {
      //   profileemodel art = profileemodel(email:i['email'] );
      //   profile.add(art);
      // }
    }catch(e){
      print('error=<<<<<$e');
    }

  }

}

