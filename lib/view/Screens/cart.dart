import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:softagi/const.dart';
import 'package:softagi/controller/add_or_remove%20_card_controller.dart';
import 'package:softagi/controller/card_data_contolloer.dart';
import 'package:softagi/controller/home_data_controller.dart';
import 'package:softagi/theme.dart';
import 'package:softagi/view/widgets/custom_text.dart';
void doNothing(BuildContext context) {}
void dosomting(BuildContext context) {


}

class cartscreen extends StatefulWidget {

  @override
  _cartscreenState createState() => _cartscreenState();
}

class _cartscreenState extends State<cartscreen> {
  final cartcontroller c=Get.put(cartcontroller());



@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: GetBuilder<cartcontroller>(
        init: cartcontroller(),
        builder: ( controller) {
          return controller.cartit.isEmpty?Center(
            child: CircularProgressIndicator(),
          ): Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              custom_text(text:" ${controller.cartit.length}",style: titlestyle,),

              Expanded(
                child: ListView.builder(

                  itemCount: controller.cartit.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Slidable(

                      // Specify a key if the Slidable is dismissible.
                        key: const ValueKey(0),

                        // The start action pane is the one at the left or the top side.
                        startActionPane: ActionPane(
                          extentRatio: 0.5,
                          // A motion is a widget used to control how the pane animates.
                          motion: const ScrollMotion(),

                          // A pane can dismiss the Slidable.
                          dismissible: DismissiblePane(
                              motion: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                color: Color(0xFFFE4A49),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.delete),
                                    Text('Delete',style:TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),),
                                  ],
                                ),
                              ),


                              onDismissed: () {

                            addremovecard(id:  controller.cartit[index].product!.id);

                          }),

                          // All actions are defined in the children parameter.
                          children:  [
                            // A SlidableAction can have an icon and/or a label.


                          ],
                        ),

                        // The end action pane is the one at the right or the bottom side.
                        endActionPane: const ActionPane(
                          extentRatio: 1,

                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(

                              // An action can be bigger than the others.
                              onPressed: doNothing,
                              backgroundColor: Color(0xFF7BC043),
                              foregroundColor: Colors.white,
                              icon: Icons.info_rounded,
                              label: 'Archive',
                            ),
                            SlidableAction(
                              onPressed: doNothing,
                              backgroundColor: Color(0xFF0392CF),
                              foregroundColor: Colors.white,
                              icon: Icons.save,
                              label: 'Save',
                            ),
                            SlidableAction(

                              onPressed: doNothing,
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),

                        // The child of the Slidable is what the user sees when the
                        // component is not dragged.
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                          child: Card(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Expanded(
                                  flex: 4,
                                  child: Container(

                                    alignment: Alignment.center,
                                    child: FadeInImage.assetNetwork(
                                      fit: BoxFit.cover,
                                      placeholder: 'assets/images/loding.gif',
                                      image: controller.cartit[index].product!.image.toString(),

                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5,),
                                Expanded(
                                    flex: 7,
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10,),

                                        Container(
                                            alignment: Alignment.topRight,
                                            child: custom_text(text:" ${controller.cartit[index].product!.name}",style: titlestyle,)),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            custom_text(text:" ${controller.cartit[index].product!.price.toString()}",style: newprice,max: 1,),
                                            custom_text(text:" ${controller.cartit[index].product!.old_price.toString()}",style: oldprice,max: 1,),

                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Card(
                                                elevation: 20,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30)
                                                ),
                                                color: Colors.deepOrange,
                                                child: IconButton(onPressed: (){
                                                  int? to=(controller.cartit[index].quantity>1)?controller.cartit[index].product!.price + controller.cartit[index].product!.price:null;
                                                }, icon: Icon(Icons.add))),
                                    custom_text(text:" ${controller.cartit[index].quantity.toString()}",style: titlestyle,max: 1,),
                                            Card(
                                                elevation: 20,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30)
                                                ),
                                                color: Colors.deepOrange,

                                                child: IconButton(onPressed: (){}, icon: Icon(Icons.remove))),
                                          ],
                                        ),
                                        const SizedBox(height: 5,),
                                      ],
                                    )),



                              ],
                            ),
                          ),
                        )
                    );
                  },),
              ),



            ],
          );
        },),
    );
  }
}

