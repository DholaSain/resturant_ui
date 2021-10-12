import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:resturant_ui/Binding/all_binding.dart';
import 'package:resturant_ui/controller/orderStatus_Controller.dart';
import 'package:resturant_ui/screen/orderSlip.dart';

class PaymentProcess extends StatelessWidget {
  final statusController = Get.find<OrderStatusController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (statusController.status == null) {
        return CircularProgressIndicator();
      } else if (statusController.status!.status == 'Done') {
        // ignore: unused_element
        return Scaffold(
          body: Center(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset('assets/imgs/p.json', height: 100),
                 SizedBox(height: 50,),
                  Text("Pleas Pay Your Bill",style: TextStyle(
                    fontSize:20,
                    fontWeight: FontWeight.bold
                  ),)
                
              ],
            ),
          )),
        );
      } else if (statusController.status!.status == 'Complete') {
          // ignore: unused_element
         return Compelet();
      } else {
        return CircularProgressIndicator();
      }
    });
  }
}
class Compelet extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
   Timer(Duration(seconds: 2), () => Get.to(OrderSlip(),binding: UserCartBinding()));
          return Scaffold(
            body: Center(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/imgs/checked.png', height: 100),
                  SizedBox(height: 50,),
                  Text(" Payment is done ",style: TextStyle(
                    fontSize:20,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            )),
          );
  }
}