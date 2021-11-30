import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi/controller/FQAS.dart';

class faqscreen extends StatelessWidget {
final faqscontroller c=Get.put(faqscontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: GetBuilder<faqscontroller>(
        init: faqscontroller(),
        builder: ( controller) {
        return Container(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: controller.fqa.length,
            itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Container(

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(controller.fqa[index].question.toString(),style: TextStyle(
                            color: Colors.red,
                          fontSize: 20,

                        ),
                        textAlign: TextAlign.right,
                        ),
                        Text(controller.fqa[index].answer.toString(),style: TextStyle(
                            color: Colors.black,
                          fontSize: 18,
                        ),
                          textAlign: TextAlign.right,

                        ),
                      ],

                    ),
                  ),
                ),
              ),
            );
          },),
        );
      },),
    );
  }
}
