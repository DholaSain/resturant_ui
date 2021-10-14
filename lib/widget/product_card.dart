import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/controller/UserCart_Controller.dart';
import 'package:resturant_ui/controller/product_Controller.dart';
import 'package:resturant_ui/screen/Product_details.dart';
import 'package:resturant_ui/service/database.dart';

const defaultPadding = 16.0;

// ignore: must_be_immutable
class ProductsCard extends StatelessWidget {
  int? quantity = 0;
  final uid = FirebaseAuth.instance.currentUser!.uid;

  Color buttonDefualtColor = Colors.white;
  final cartController = Get.find<UserCartController>();
  final productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.dataGetter == null) {
        return CircularProgressIndicator();
      } else {
        return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: productController.dataGetter!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              childAspectRatio: 1 / 1.5,
            ),
            itemBuilder: (context, index) {
              //  FutureBuilder<DocumentSnapshot>(
              //                             future: FirebaseFirestore.instance
              //                                 .collection('user')
              //                                 .doc(uid)
              //                                 .collection('PendingOrder')
              //                                 .doc(productController
              //                                     .dataGetter![index].id)
              //                                 .get(),
              //                             builder: (context,
              //                                 AsyncSnapshot<DocumentSnapshot>
              //                                     snapshot) {
              //                               if (snapshot.hasError)
              //                                 return Center(
              //                                   child: Text(snapshot.hasError
              //                                       .toString()),
              //                                 );
              //                               if (snapshot.hasData) {
              //                                 return quantity=
              //                                       snapshot.data!['quantity'];
              //                               } else {
              //                                 return Container();
              //                               }
              //                             },
              //                           );
              return GestureDetector(
                  onTap: () {
                    Get.to(RestaurantPage(
                      id: productController.dataGetter![index].id!,
                      dec: productController.dataGetter![index].fdec!,
                      title: productController.dataGetter![index].ftitle!,
                      price: productController.dataGetter![index].fprice!,
                      image: productController.dataGetter![index].fimage!,
                    ));
                    //  categoryName.value=  productController.dataGetter![index].name!;
                    // Get.to(() => CategoryProduct(productController.dataGetter![index].name!),
                    //   binding: ProductsBinding());
                  },
                  child: Container(
                    height: 450,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
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
                    padding: EdgeInsets.all(7),
                    // width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              image: DecorationImage(
                                  image: NetworkImage(productController
                                      .dataGetter![index].fimage!),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),

                        Text(
                          productController.dataGetter![index].ftitle!,
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          productController.dataGetter![index].fdec!,
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Rs "
                          '${productController.dataGetter![index].fprice!}',
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),

                        Obx(() {
                          return cartController.usercartdata!.any((element) =>
                                  element.id!.contains(
                                      '${productController.dataGetter![index].id}'))
                              // ? InkWell(
                              //     onTap: () {
                              //       try {
                              //         // totalPrice = widget.price! * _n;
                              //         Database().addCart(
                              //             productController
                              //                 .dataGetter![index].id!,
                              //             1,
                              //             productController
                              //                 .dataGetter![index].fprice!,
                              //             productController
                              //                 .dataGetter![index].fimage!,
                              //             productController
                              //                 .dataGetter![index].ftitle!,
                              //             productController
                              //                 .dataGetter![index].fdec!);

                              //         Get.snackbar(
                              //             "${productController.dataGetter![index].ftitle} Add in Cart",
                              //             "Cheak in Cart",
                              //             snackPosition: SnackPosition.BOTTOM,
                              //             backgroundColor: Colors.green,
                              //             colorText: Colors.white);
                              //       } catch (e) {
                              //         Get.snackbar(
                              //             "${productController.dataGetter![index].ftitle} Not Added",
                              //             e.toString(),
                              //             snackPosition: SnackPosition.BOTTOM);
                              //       }
                              //     },
                              //     child: InkWell(
                              //       onTap: () {
                              //         Database().removeCart(productController
                              //             .dataGetter![index].id!);
                              //       },
                              //       child: Container(
                              //         width: 40,
                              //         margin: EdgeInsets.all(5),
                              //         padding: EdgeInsets.all(5),
                              //         decoration: BoxDecoration(
                              //           border: Border.all(color: Colors.red),
                              //           borderRadius: BorderRadius.circular(10),
                              //           color: Colors.white,
                              //         ),
                              //         child: Text(
                              //           'Delete to Cart',
                              //           textAlign: TextAlign.center,
                              //           style: TextStyle(
                              //               fontSize: 18,
                              //               fontWeight: FontWeight.bold,
                              //               color: Colors.red),
                              //         ),
                              //       ),
                              //     ),
                              //   )
                              ? Column(
                                  children: [
                                    Divider(),
                                    FutureBuilder<DocumentSnapshot>(
                                      future: FirebaseFirestore.instance
                                          .collection('user')
                                          .doc(uid)
                                          .collection('PendingOrder')
                                          .doc(productController
                                              .dataGetter![index].id)
                                          .get(),
                                      builder: (context,
                                          AsyncSnapshot<DocumentSnapshot>
                                              snapshot) {
                                        if (snapshot.hasError)
                                          return Center(
                                            child: Text(
                                                snapshot.hasError.toString()),
                                          );
                                        return snapshot.hasData
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 20,
                                                    child:
                                                        new FloatingActionButton(
                                                      onPressed: () {
                                                        Database().removeLike(
                                                            productController
                                                                .dataGetter![
                                                                    index]
                                                                .id!,
                                                            productController
                                                                .dataGetter![
                                                                    index]
                                                                .fprice!,
                                                            snapshot.data![
                                                                'quantity']!);
                                                      },
                                                      child: new Icon(
                                                        Icons.remove,
                                                        size: 20,
                                                        color: Colors.black,
                                                      ),
                                                      backgroundColor:
                                                          Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    "${snapshot.data!['quantity']}",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    height: 20,
                                                    child:
                                                        new FloatingActionButton(
                                                      onPressed: () {
                                                        Database().addLike(
                                                            productController
                                                                .dataGetter![
                                                                    index]
                                                                .id!,
                                                            productController
                                                                .dataGetter![
                                                                    index]
                                                                .fprice!,
                                                            snapshot.data![
                                                                'quantity']!);
                                                      },
                                                      child: Icon(
                                                        Icons.add,
                                                        size: 20,
                                                        color: Colors.black,
                                                      ),
                                                      backgroundColor:
                                                          Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Container();
                                      },
                                    ),
                                  ],
                                )
                              : InkWell(
                                  onTap: () {
                                    try {
                                      // totalPrice = widget.price! * _n;
                                      Database().addCart(
                                          productController
                                              .dataGetter![index].id!,
                                          1,
                                          productController
                                              .dataGetter![index].fprice!,
                                          productController
                                              .dataGetter![index].fimage!,
                                          productController
                                              .dataGetter![index].ftitle!,
                                          productController
                                              .dataGetter![index].fdec!);

                                      Get.snackbar(
                                          "${productController.dataGetter![index].ftitle} Add in Cart",
                                          "Cheak in Cart",
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.green,
                                          duration: Duration(
                                              seconds: 1, milliseconds: 500),
                                          colorText: Colors.white);
                                    } catch (e) {
                                      Get.snackbar(
                                          "${productController.dataGetter![index].ftitle} Not Added",
                                          e.toString(),
                                          snackPosition: SnackPosition.BOTTOM);
                                    }
                                  },
                                  child: Container(
                                    width: 40,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red,
                                    ),
                                    child: Text(
                                      'Add to Cart',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                );
                        }),

                        SizedBox(
                          height: 5,
                        )
                        // Text("${productController.dataGetter![index].id}"),
                        // Text('${cartController.usercartdata![index].id}'),
                        // msgs.id ==cartController.usercartdata![index].id?

//                                     Container(
//                                       width: 50,
//                                       margin: EdgeInsets.all(5),
//                                       padding: EdgeInsets.all(5),
//                                       decoration:BoxDecoration(
// borderRadius: BorderRadius.circular(10),
//                                         color: Colors.red,
//                                       ),
//                                       child: Text('Add to Cart',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white),),
//                                     )
//                                   : Container()
                        // Text(
                        //   productController.dataGetter![index].ftitle!,
                        //   style: TextStyle(fontWeight: FontWeight.bold),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Text(
                        //   "Rs:" +
                        //       "${categoryController.dataGetter![index].fprice!}",
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold, color: Colors.red),
                        // ),
                      ],
                    ),
                  ));
            });
      }
    });
  }
}
