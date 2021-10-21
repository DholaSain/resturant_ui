
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:resturant_ui/controller/orderStatus_Controller.dart';
import 'package:resturant_ui/screen/home.dart';
import 'package:resturant_ui/screen/payment_method.dart';
import 'package:resturant_ui/service/database.dart';

// ignore: must_be_immutable
class OrderPlace extends StatelessWidget {
  final statusController = Get.find<OrderStatusController>();
  String? status;
  RxBool visibilityStatus = false.obs;
  RxBool orderStatus = false.obs;
  RxBool doneStatus = false.obs;
  image(String done ,String order) {
    if (done == 'Done'&& order=='Dining') {
      visibilityStatus.value = true;
      orderStatus.value=false;
      return Lottie.asset('assets/imgs/1.json');
    } 
    else if(done=='Done'){
      visibilityStatus.value=false;
      orderStatus.value=true;
      doneStatus.value=true;
    }
    else if (done == 'Preparing') {
      visibilityStatus.value = false;
      orderStatus.value=true;
      return Lottie.asset('assets/imgs/3.json');
    } else if (done == 'Pending') {
      visibilityStatus.value = false;
      orderStatus.value=true;
      return Lottie.asset('assets/imgs/p.json', height: 100);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (statusController.status == null) {
        return Center(
          child: Container(
              height: 80, width: 80, child: CircularProgressIndicator()),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () => Get.to(Home())),
  
            toolbarHeight: 80,
            backgroundColor: Colors.orange,
            title: Text("Your order is ${statusController.status!.status}"),
          ),
          body: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            
              Spacer(),
              Container(
                // color: Colors.orange,
                child: Center(
                  child: image('${statusController.status!.status}','${statusController.status!.order}'),
                ),
              ),
             
              SizedBox(
                height: 50,
              ),
              orderStatus.value
                  ? Text(
                      "Your Order is ${statusController.status!.status}", style: TextStyle(
             
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                    )
                  : Text(""),
                
              visibilityStatus.value
                  ? InkWell(
                      onTap: () {
                        Get.to(PymentMethod());
                      },
                      child: Container(
                        width: 200,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [Colors.redAccent, Colors.red],
                            ),
                            boxShadow: [
                              BoxShadow(blurRadius: 5.0, color: Colors.grey)
                            ]),
                        child: Row(
                          children: <Widget>[
                            Spacer(),
                            Text(
                              "Payment Now",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(),
                    Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(20),
               
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Order id is ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     Text(
                      "${statusController.status!.orderId}",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
                doneStatus.value?
                  InkWell(
                      onTap: () async{
                       await  Database().orderstatus('Complete');
                        Database().orderNow();
                       
                        Get.offAll(Home());
                      },
                      child: Container(
                        width: 200,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [Colors.redAccent, Colors.red],
                            ),
                            boxShadow: [
                              BoxShadow(blurRadius: 5.0, color: Colors.grey)
                            ]),
                        
                            // Spacer(),
                         child:   Expanded(
                              child: Text(
                                "Have You Receive Your Order",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              ),
                            ),
                            
                          
                      ),
                    ):Container(),
                  Spacer()
            ],
          )),
        );
      }
    });
  }
}
