import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/Binding/all_binding.dart';
import 'package:resturant_ui/controller/orderStatus_Controller.dart';
import 'package:resturant_ui/controller/product_Controller.dart';
import 'package:resturant_ui/controller/resturent_controller.dart';
import 'package:intl/intl.dart';
import 'package:resturant_ui/screen/home.dart';
import 'package:resturant_ui/service/database.dart';
import '../controller/UserCart_Controller.dart';
import 'orderPlace.dart';

class OrderSlip extends StatefulWidget {
  @override
  State<OrderSlip> createState() => _OrderSlipState();
}

class _OrderSlipState extends State<OrderSlip> {
  final cartController = Get.find<UserCartController>();
  final orderController = Get.find<OrderStatusController>();
  final user = FirebaseAuth.instance.currentUser!.uid;
  final resturentController = Get.find<ResturentController>();
  String formatter = DateFormat('d/M/y-(h:m)').format(DateTime.now());
  
  @override
  int? sum = 0;
  int? total = 0;
  @override
  void initState() {
    super.initState();
    price();
  }

  Future<void> price() {
    sum = 0;
    total = 0;
    return FirebaseFirestore.instance
        .collection('user')
        .doc(user)
        .collection("PendingOrder")
        .get()
        .then(
      (querySnapshot) {
        querySnapshot.docs.forEach((result) {
          sum = sum! + result.data()['totalprice'] as int?;
        });
        setState(() {
          total = sum;
        });
      },
    );
  }

  void onInit() {
    // super.onInit();
  }
//   Future<void> convertWidgetToImage() async {
//     RenderObject? renderRepaintBoundary = containerKey.currentContext!.findRenderObject();
// ui.Image boxImage = await renderRepaintBoundary!.toImage(pixelRatio:1);
// ByteData? byteData= await boxImage.toByteData(format: ui.ImageByteFormat.png);
//   }
  GlobalKey containerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (cartController.usercartdata == null &&
          resturentController.resturentGetter == null) {
        return CircularProgressIndicator();
      } else {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.orange,
              title: Center(child: Text("Order Slip"))),
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RepaintBoundary(
                    key: containerKey,
                    child: Container(
                      // alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            resturentController.resturentGetter!.name!,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            resturentController.resturentGetter!.branch!,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(color: Colors.grey),
                            child: Row(
                              children: [
                                Text(
                                  "Items",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  "Quantity",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  "Price",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: cartController.usercartdata!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      Text(
                                        cartController
                                            .usercartdata![index].title!,
                                        style: TextStyle(
                                          fontSize: 15,
                                          // fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "${cartController.usercartdata![index].quantity!}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          // fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Text(
                                        "${cartController.usercartdata![index].price!}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          // fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                          Divider(),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Total Price   " + "Rs $total",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Divider(),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "$formatter",
                            style: TextStyle(
                              fontSize: 15,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                          Image.asset(
                            'assets/imgs/paid.png',
                            height: 200,
                            width: 200,
                          ),
                          // SizedBox(
                          //   height: 50,
                          // ),
                        ],
                      ),
                    ),
                  ),

                  //   Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Container(
                  //         width: 100,
                  //         padding: EdgeInsets.all(15),
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(15),
                  //             gradient: LinearGradient(
                  //               colors: [
                  //                 Colors.orangeAccent,
                  //                 Colors.deepOrangeAccent
                  //               ],
                  //             ),
                  //             boxShadow: [
                  //               BoxShadow(blurRadius: 5.0, color: Colors.grey)
                  //             ]),
                  //         child: Row(
                  //           children: <Widget>[
                  //             Spacer(),
                  //             Text(
                  //               "Back",
                  //               textAlign: TextAlign.center,
                  //               style: TextStyle(
                  //                   color: Colors.white,
                  //                   fontWeight: FontWeight.bold,
                  //                   fontSize: 17),
                  //             ),
                  //             Spacer(),
                  //             Icon(
                  //               Icons.arrow_back,
                  //               color: Colors.white,
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: 100,
                  //       ),
                  //       Container(
                  //         width: 100,
                  //         padding: EdgeInsets.all(15),
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(15),
                  //             gradient: LinearGradient(
                  //               colors: [
                  //                 Colors.orangeAccent,
                  //                 Colors.deepOrangeAccent
                  //               ],
                  //             ),
                  //             boxShadow: [
                  //               BoxShadow(blurRadius: 5.0, color: Colors.grey)
                  //             ]),
                  //         child: Row(
                  //           children: <Widget>[
                  //             Spacer(),
                  //             Text(
                  //               "Save",
                  //               textAlign: TextAlign.center,
                  //               style: TextStyle(
                  //                   color: Colors.white,
                  //                   fontWeight: FontWeight.bold,
                  //                   fontSize: 17),
                  //             ),
                  //             Spacer(),
                  //             Icon(
                  //               Icons.save,
                  //               color: Colors.white,
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   )
                  // ],
                  TextButton(
                      onPressed: () async{
                        if(orderController.status!.order=='Dining'){
 await Database().orderNow();
 await Get.offAll(Home());
                        }
                        Get.off(() => OrderPlace(),binding: OrderStatusBinding());
                        Database().orderstatus('Pending');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Go To Home",
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      ))
                ]),
      
          ),
        );
      }
    });
  }
}
