import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/screen/AddCart.dart';
class CartIcon extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: db.collection('user').doc(user).collection('PendingOrder').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var item = snapshot.data!.docs;

              return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Container(
                      height: 150.0,
                      width: 50.0,
                      child: new GestureDetector(
                        onTap: () {
                          Get.to(AddCart());
                        },
                        child: new Stack(
                          children: <Widget>[
                            new IconButton(
                              icon: new Icon(
                                Icons.shopping_cart,
                                size: 30,
                                color: Colors.white,
                              ),
                              onPressed: null,
                            ),
                            item.length == 0
                                ? new Container()
                                : new Positioned(
                                left: 20,
                                    child: new Stack(
                                    children: <Widget>[
                                      new Icon(Icons.brightness_1,
                                          size: 25.0, color: Colors.red),
                                      new Positioned(
                                          top: 5.0,
                                          right: 8.0,
                                          child: new Center(
                                            child: new Text(
                                              item.length.toString(),
                                              style: new TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    ],
                                  )),
                          ],
                        ),
                      )));
            } else {
              return LinearProgressIndicator();
            }
          }),
    );
  }
}
