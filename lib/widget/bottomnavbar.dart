import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/controller/orderStatus_Controller.dart';
import 'package:resturant_ui/screen/orderPlace.dart';
import 'package:resturant_ui/screen/payment_proccec.dart';

class BottomNavbar extends StatelessWidget {
  // const BottomNavbar({Key? key}) : super(key: key);
  final statusController = Get.find<OrderStatusController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (statusController.status == null) {
        return Container();

      } 



      else if (statusController.status!.status == 'Complete') {
        return Text('');
      } else {
        return InkWell(
          onTap: () {
            Get.to(() => OrderPlace());
          },
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.orange,
            child: Text(
              "Your order is ${statusController.status!.status}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        );
      }
    });
  }
}
