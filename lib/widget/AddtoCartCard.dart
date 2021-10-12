import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/service/database.dart';

// ignore: must_be_immutable
class AddtoCartCard extends StatefulWidget {
  AddtoCartCard({this.price, this.total, this.name, this.status,this.id});
  String? id;
  String? name;
  bool?status;
  int? price;
  int? total;
  @override
  
  _AddtoCartCardState createState() => _AddtoCartCardState();
}

class _AddtoCartCardState extends State<AddtoCartCard> {
   RxBool orderStatus = false.obs;
     var curruntID = ''.obs;
  var expanded = false.obs;
  // final cartController = Get.find<CartController>();
  final db = FirebaseFirestore.instance;
  RxInt _n = 1.obs;
cheak(){
  if(widget.status==true){
 orderStatus.value=true;
  }
  else{
orderStatus.value=false;
  }
}
  void minus() {
    if (_n != 1) _n = _n - 1;
  }
  void add() {
    _n = _n + 1;
  }
@override
  void initState() {
    super.initState();
    cheak();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: db
            .collection('Resturent')
            .doc("MRsBaovyWkTXCLa95d2vMcymLjw1")
            .collection("items")
            .where("Show", isEqualTo: true)
            .where("category", isEqualTo: widget.name!)
            .where("id", isEqualTo: widget.id)
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
                  _n.value = widget.total!;
                  return Container(
                    height: 150,
                    width: 200,
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
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    // width: MediaQuery.of(context).size.width / 2,
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          height: 130,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(18.0)),
                            image: DecorationImage(
                              image: NetworkImage(item[index].get('image')),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item[index].get('title'),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    fontSize: 25,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Total: " + "${widget.price}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black)),
                                Spacer(),
                                 orderStatus.value?Text('Quantity : '+'${widget.total}',textAlign: TextAlign.center,style: TextStyle(
                                   fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red
                                 ),):  Row(
                                  children: [
                                 Container(
                                      height: 30,
                                      child: new FloatingActionButton(
                                        onPressed: () {
                                          Database().removeLike(widget.id!,
                                             item[index].get('price'), widget.total!);
                                        },
                                        child: new Icon(
                                          Icons.remove,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                    new Text('${widget.total}',
                                        style: new TextStyle(fontSize: 20.0)),
                                    Container(
                                      height: 30,
                                      child: new FloatingActionButton(
                                        onPressed: () {
                                          Database().addLike(widget.id!,
                                              item[index].get('price'), widget.total!);
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),

                                     Spacer(),
                                     InkWell(
                                       onTap: (){
                                         Database().removeCart(widget.id!);
                                       },
                                       child: Container(
                                       decoration: BoxDecoration(
                                          color: Colors.red,
                                         borderRadius: BorderRadius.all(Radius.circular(15))
                                       ),
                                       padding: EdgeInsets.all(10),
                                     
                                       child: Text("Remove",style: TextStyle(
                                         fontWeight: FontWeight.bold,
                                         color: Colors.white
                                       ),),
                                        ),
                                     ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return LinearProgressIndicator();
          }
        });
  }
}








    // return Obx(() {
    //   if (cartController.cartdata == null) {
    //     return CircularProgressIndicator();
    //   } else {
    //     return ListView.builder(
    //         // physics: NeverScrollableScrollPhysics(),
    //         shrinkWrap: true,
    //         itemCount: cartController.cartdata!.length,
          
    //         itemBuilder: (context, index) {
    //           return Text(cartController.cartdata![index].ctitle!);
              // return Expanded(
              //   child: GestureDetector(
              //     onTap: () {
              //       Get.to(RestaurantPage());
              //     },
              //     child: ),
              // );
            