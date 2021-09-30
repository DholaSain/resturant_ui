import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/Model/cart_model.dart';
import 'package:resturant_ui/Model/categroy_model.dart';
import 'package:resturant_ui/Model/product_model.dart';
import 'package:resturant_ui/Model/user_cartmodel.dart';
import 'package:resturant_ui/utils/global_variable.dart';

class Database {
  
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> addCart(String id, int quantity, int price) async {
    try {
      await _firestore.collection("user").doc(id).set({
        "category": categoryName.value,
        "ProductId": id,
        "quantity": quantity,
        "totalprice": price,
      });
    } catch (e) {
      Get.snackbar("Not upload", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> removeCart(String id) async {
    try {
      await _firestore.collection("user").doc(id).delete();
    } catch (e) {
      Get.snackbar("", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> delet(String id) async {
    try {
      await _firestore.collection("Product").doc(id).delete();
    } catch (e) {
      Get.snackbar("Not upload", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

//  Stream<List<CartModel>> cartFirestore( String category, String product){
//   return _firestore
//         .collection('categories')
//         .where("name",isEqualTo: category)
//         .firestore
//         .collection('allProducts')
//         .where('id',isEqualTo: product)
//         .snapshots()
//         // return CartModel.fromDocumentSnapshot(doc);
//         .map((QuerySnapshot queryData) {
//      List<CartModel> dataList = [];
//       queryData.docs.forEach((id) {
//         dataList.add(CartModel.fromDocumentSnapshot(id));
//       });
//        return dataList;
//     });

//   }
  // Stream<List<UserCartModel>> usercartFirestore() {

  //   return _firestore
  //       .collection('user')
  //       .snapshots()
  //       .map((QuerySnapshot queryData) {
  //    List<UserCartModel> dataList = [];
  //     queryData.docs.forEach((id) {
  //       dataList.add(UserCartModel.fromDocumentSnapshot(id));
  //     });
  //      return dataList;
  //   });

  // }
  Stream<List<CategoryModel>> categoryFirestore() {
    return _firestore
        .collection('Resturent')
        .doc("MRsBaovyWkTXCLa95d2vMcymLjw1")
        .collection("categories")
        .snapshots()
        .map((QuerySnapshot queryData) {
      List<CategoryModel> dataList = [];
      queryData.docs.forEach((id) {
        dataList.add(CategoryModel.fromDocumentSnapshot(id));
      });
      return dataList;
    });
  }

  Stream<List<ProductModel>> allProducts() {
    return _firestore
        .collection('Resturent')
        .doc("MRsBaovyWkTXCLa95d2vMcymLjw1")
        .collection("items")
        .where(
          "Show",
          isEqualTo: true,
        )
        .where(
          "category",
          isEqualTo: categoryName.value,
        )
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<ProductModel> productsList = [];
      for (var element in querySnapshot.docs) {
        productsList.add(ProductModel.fromDocumentSnapshot(element));
      }
      return productsList;
    });
  }

  Future<void> addLike(String uid, int price, int quantity) async {
    int sum;
    quantity = quantity + 1;
    sum = quantity;
    _firestore.collection("user").doc(uid).update(
      {
        'quantity': sum,
        'totalprice': sum * price,
      },
    );
  }

  Future<void> removeLike(String uid, int price, int quantity) async {
    int sum;
    if (quantity == 1) {
      quantity = 1;
    } else if(quantity>1){
      quantity = quantity - 1;
    };
    //  quantity=quantity-1;
    sum = quantity;
    _firestore.collection("user").doc(uid).update(
      {
        'quantity': sum,
        'totalprice': sum * price,
      },
    );
  }
   Future<void> order() async {
   


  var l = new Random().nextInt(99999);
  // var l = new  rng.nextInt(10000);

    try {
      await _firestore.collection("Resturent").doc("MRsBaovyWkTXCLa95d2vMcymLjw1").collection("order").doc('$l').set({
'tokenId':l,
'time':FieldValue.serverTimestamp()
      });
        await FirebaseFirestore.instance.collection('user').get().then(
      (querySnapshot) {
        querySnapshot.docs.forEach((product) {
  _firestore.collection("Resturent").doc("MRsBaovyWkTXCLa95d2vMcymLjw1").collection("order").doc('$l').collection("$l").add({
'productId':product.data()['ProductId'],
'quantity':product.data()['quantity'],

      });
        });});
      
    } catch (e) {
      Get.snackbar("", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
