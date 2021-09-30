import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/Binding/all_binding.dart';
import 'package:resturant_ui/controller/cart_controller.dart';
import 'package:resturant_ui/screen/AddCart.dart';

class CartIcon extends StatelessWidget {
  // final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Stack(
      children: <Widget>[
        new IconButton(
          icon: new Icon(
            Icons.shopping_cart,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () {

             Get.to(()=>AddCart());

          },
        ),
        new Positioned(
          left: 25,
            child: new Stack(
          children: <Widget>[
            new Icon(Icons.brightness_1, size: 25.0, color: Colors.red),
            new Positioned(
                top: 6,
                right: 4,
                child: new Center(
                  child: new Text(
                    "20",
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 11.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ],
        )),
      ],
    ));
  }
}
