import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/Binding/all_binding.dart';
import 'package:resturant_ui/screen/Product_details.dart';
import 'package:resturant_ui/screen/orderPlace.dart';
import 'package:resturant_ui/screen/payment_method.dart';
import 'package:resturant_ui/service/database.dart';
import 'package:resturant_ui/widget/AddtoCartCard.dart';

class AddCart extends StatefulWidget {
  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
   String radioItem = '';
  String userId = FirebaseAuth.instance.currentUser!.uid;
  int? sum = 0;
  int? total = 0;
  RxBool orderStatus = false.obs;
  @override
  void initState() {
    super.initState();
    price();
    cheak();
  }

  cheak() {
    return FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .collection("PendingOrder")
        .get()
        .then(
      (querySnapshot) {
        querySnapshot.docs.forEach((result) {
          if (result.data()['status'] == 'Pending' ||
              result.data()['status'] == 'Preparing'||result.data()['status'] == 'Done') {
            orderStatus.value = true;
          } else {
            orderStatus.value = false;
          }
        });
        // setState(() {
        //   total = sum;
        // });
      },
    );
  }

  Future<void> price() {
    sum = 0;
    total = 0;
    return FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
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

  String? id;

  String? category;

  int? quantity;
  String? status;
  int? totalprice;

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: new Size(MediaQuery.of(context).size.width, 150.0),
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.orange,
                Colors.orange,
              ]),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 3),
                  blurRadius: 3.0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  RoundButton(
                    icon: Icons.arrow_back_ios,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Order List',
                    style: new TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                height: 60,
                width: 300,
                color: Colors.red,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Total Price RS:$total',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          price();
                        },
                        color: Colors.white,
                        iconSize: 30,
                        icon: Icon(Icons.refresh),
                      ),
                      // IconButton(Icons.refresh,color:Colors.white,onTap(){price()});
                    ],
                  ),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: db
                    .collection('user')
                    .doc(userId)
                    .collection("PendingOrder")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var item = snapshot.data!.docs;

                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          id = item[index].get('ProductId');
                          category = item[index].get('category');
                          quantity = item[index].get('quantity');
                          totalprice = item[index].get('totalprice');
                          status = item[index].get('status');
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Text("${item[index].get('category')}"),
                                AddtoCartCard(
                                  total: quantity,
                                  price: totalprice,
                                  id: id,
                                  name: category,
                                  status: orderStatus.value,
                                ),
                                // Spacer(),
                              ],
                            ),
                          );
                        });
                  } else {
                    return LinearProgressIndicator();
                  }
                },
              ),
              SizedBox(height: 30,),
        Column(
        children: <Widget>[
 
          RadioListTile(
              groupValue: radioItem,
              title: Text('Dining'),
              value: 'Dining',
              onChanged: (String ?val) {
                setState(() {
                  radioItem = val!;
                });
              },
            ),
 
           RadioListTile(
              groupValue: radioItem,
              title: Text('Takeaway'),
              value: 'Takeaway',
              onChanged: (String?val) {
                setState(() {
                  radioItem = val!;
                });
              },
            ),
 
          //  Text('$radioItem', style: TextStyle(fontSize: 23),)
          
        ],
    ),
              // Text('$status'),
              orderStatus.value
                  ? Container()
                  : InkWell(
                      onTap: () async {
                        // ignore: unnecessary_null_comparison
                        if(id!=null&&radioItem!=null){
                        await Database().order(radioItem);
                        // Database().statusCahnge();
if(radioItem=='Takeaway'){
Get.off(()=>PymentMethod());
}
else
                        Get.off(() => OrderPlace(),
                            binding: OrderStatusBinding());
                        }  
                      },
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: 200,
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [Colors.yellow, Colors.orange],
                            ),
                            boxShadow: [
                              BoxShadow(blurRadius: 5.0, color: Colors.grey)
                            ]),
                        child: Row(
                          children: <Widget>[
                            Spacer(),
                            Text(
                              "Order Now",
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
                    ),
            ],
          ),
        ));
  }
}
