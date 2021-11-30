import 'package:get/get.dart';
import 'package:softagi/const.dart';
import 'package:http/http.dart'as http;
import 'package:softagi/model/FAQS.dart';
import 'dart:async';
import 'dart:convert';

import 'package:softagi/model/home_data_model.dart';
class faqscontroller extends GetxController{
  List<fqamodel>fqa=[];

  faqscontroller(){
    getfaqs().then((value) => update());

  }
  Future getfaqs()async{
    try{

      var url = Uri.parse(baseURL+'/faqs');
      var respone=await http.get(url);
      var responebody=jsonDecode(respone.body)['data']['data'];
      print('responebody:>>>>>$responebody');
      print(respone.statusCode);

      for(int i= 0; i < responebody.length; i++)
      {
        fqa.add(fqamodel.fromMap(responebody[i]));
      }
    }catch(e){
      print('error=<<<<<$e');
    }

  }

}
