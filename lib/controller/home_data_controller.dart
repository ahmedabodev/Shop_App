import 'package:get/get.dart';
import 'package:softagi/const.dart';
import 'package:http/http.dart'as http;
import 'dart:async';
import 'dart:convert';

import 'package:softagi/model/home_data_model.dart';
class homedatacontroller extends GetxController{
  List<modelbanners>banner=[];
  List<modelproducts>products=[];

  homedatacontroller(){
    gethomedata().then((value) => update());

  }
  Future gethomedata()async{
    try{

      var url = Uri.parse(baseURL+'/home');
      var respone=await http.get(url);
      var responebody=jsonDecode(respone.body)['data']['products'];
      var responebody1=jsonDecode(respone.body)['data']['banners'];
      for(int x = 0; x < responebody1.length; x++)
          {
            banner.add(modelbanners.fromMap(responebody1[x]));

          }
      for(int i= 0; i < responebody.length; i++)
      {
        products.add(modelproducts.fromMap(responebody[i]));
      }
    }catch(e){
      print('error=<<<<<$e');
    }

  }

}
