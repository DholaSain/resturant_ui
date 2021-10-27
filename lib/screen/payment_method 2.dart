import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/screen/payment_proccec.dart';

class PymentMethod extends StatelessWidget {
  const PymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Payment Methods",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 80,
              width: 250,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    offset: Offset(0, 3),
                    color: Colors.grey.withOpacity(0.6),
                  ),
                ],
              ),
              child: Image.asset('assets/imgs/jazzcash.png'),
            ),
            Container(
              height: 80,
              width: 250,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    offset: Offset(0, 3),
                    color: Colors.grey.withOpacity(0.6),
                  ),
                ],
              ),
              child: Image.asset('assets/imgs/easypaisa.png'),
            ),
            Container(
              height: 80,
              width: 250,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    offset: Offset(0, 3),
                    color: Colors.grey.withOpacity(0.6),
                  ),
                ],
              ),
              child: Image.asset('assets/imgs/bank.png'),
            ),
            InkWell(
              onTap: (){
                Get.to(PaymentProcess());
              },
              child: Container(
                height: 80,
                width: 250,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      offset: Offset(0, 3),
                      color: Colors.grey.withOpacity(0.6),
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("By Cash",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
            
                          Image.asset('assets/imgs/cash.png'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
