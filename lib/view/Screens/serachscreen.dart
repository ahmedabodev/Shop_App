import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:softagi/controller/add_or_remove%20_card_controller.dart';
import 'package:softagi/controller/search_contrlloer.dart';
import 'package:softagi/view/widgets/custom_text.dart';

import '../../const.dart';
import '../../theme.dart';
import 'Descrption.dart';

class searchscreen extends StatelessWidget {

  final Searchcontrller c=Get.put(Searchcontrller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:   GetBuilder<Searchcontrller>(
            init: Searchcontrller(),
            builder: ( controller) {

              return TextFormField(
                style: TextStyle(color: Colors.white),
                // onEditingComplete: () {
                //   setState(() {
                //     getposts();
                //   });
                // },
                // onFieldSubmitted:(value){
                //  controller.change(value);
                // },
                onChanged: (value) {

                    controller.text.text=value;



                },

                decoration: InputDecoration(

                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'Search',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                // controller: text,
                // onSaved:(value){
                //   setState(() {
                //     value=text.text;
                //
                //   });
                //
                // },
                controller: controller.text,
              );
            },)
      ),
      body: SingleChildScrollView(
        child: GetBuilder<Searchcontrller>(
          init:Searchcontrller() ,
          builder: ( controller) {
            return   new StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              itemCount: controller.product.length,
              itemBuilder: (BuildContext context, int index) =>   Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      )
                  ),
                  color: Colors.grey[200],
                  elevation: 7,


                  child:  GestureDetector(

                    onTap: (){
                      Get.to(descriptionScreen(
                        name:controller.product[index].name ,
                        title: controller.product[index].name,
                        description: controller.product[index].description.toString(),
                        image: controller.product[index].image.toString(),
                        price: controller.product[index].price.toString(),
                        oldPrice: controller.product[index].old_price.toString(),

                      ));
                    },
                    child:
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Hero(tag: '${controller.product[index].name}',
                            child:FadeInImage.assetNetwork(
                              placeholder: 'assets/images/loding.gif',
                              image: controller.product[index].image.toString(),
                            ), ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(

                              alignment: Alignment.topRight,
                              child: Text('${controller.product[index].name}',style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(

                                  child: custom_text(style:newprice , text: '${controller.product[index].price}',),
                                ),
                                Container(

                                  child: custom_text(style:oldprice, text: '${controller.product[index].old_price}', ),
                                ),
                                IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined,color: Colors.black,))

                              ],
                            ),
                          ),
                          GetBuilder<Searchcontrller>(
                            init:  Searchcontrller(),
                            builder: ( controller) {
                              return Container(

                                child: IconButton(onPressed: (){
                                  addremovecard(id: controller.product[index].id!);
                                },icon: Icon(Icons.shopping_cart_rounded,color: Colors.red[800],),iconSize: 30,),
                              );
                            },),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0, staggeredTileBuilder: (int index)=> new StaggeredTile.fit(1),
            );


          },),
      ),
    );
  }
}


