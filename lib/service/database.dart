import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/Model/cart_model.dart';
import 'package:resturant_ui/Model/categroy_model.dart';
import 'package:resturant_ui/Model/orderStatus_model.dart';
import 'package:resturant_ui/Model/product_model.dart';
import 'package:resturant_ui/Model/resturent_model.dart';
import 'package:resturant_ui/Model/user_cartmodel.dart';
import 'package:resturant_ui/Model/user_model.dart';
import 'package:resturant_ui/utils/global_variable.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String userId = FirebaseAuth.instance.currentUser!.uid;
  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection('user').doc(user.id).set({
        'name': user.name,
        'email': user.email,
        'contact': user.contact,
        'id': user.id,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection('user').doc(uid).get();
      return UserModel.fromDocumentSnapshot(doc: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

Stream<List<OrderStatusModel>> orderStatus()  {
    try {
       return _firestore
        .collection('user')
        .doc(userId)
        .collection("orderStatus")
        .snapshots()
        .map((QuerySnapshot queryData) {
      List<OrderStatusModel> dataList = [];
      queryData.docs.forEach((id) {
        dataList.add(OrderStatusModel.fromDocumentSnapshot(id));
      });
      return dataList;
    });
     
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  Future<void> addCart(String id, int quantity, int price, String image,
      String title, String dec) async {
    try {
      await _firestore
          .collection("user")
          .doc(userId)
          .collection('PendingOrder')
          .doc(id)
          .set({
        "category": categoryName.value,
        "ProductId": id,
        "quantity": quantity,
        "totalprice": price,
        "image": image,
        "title": title,
        "dec": dec,
        'status':'start',
      });
    } catch (e) {
      Get.snackbar("Not upload", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> removeCart(String id) async {
    try {
      await _firestore
          .collection("user")
          .doc(userId)
          .collection("PendingOrder")
          .doc(id)
          .delete();
    } catch (e) {
      Get.snackbar("", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> orderNow() async {
    try {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(userId)
          .collection("PendingOrder")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((product) {
          _firestore.collection("user").doc(userId).collection('PendingOrder').doc(product.get('ProductId')).delete();
        });
      });
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
//         .collection('user')
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
  Future<ResturentModel> getResturent() async {
    try {
      DocumentSnapshot _docSnapShot = await _firestore
          .collection("Resturent")
          .doc("MRsBaovyWkTXCLa95d2vMcymLjw1")
          .get();
      return ResturentModel.fromDocumentSnapshot(_docSnapShot);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
Future statusCahnge()async{

  await _firestore
          .collection('user')
          .doc(userId)
          .collection('PendingOrder')
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((product) {
_firestore.collection('user').doc(userId).collection("PendingOrder").doc(product.get('ProductId')).update({
  'status':'Pending',
});

        });});


}
  Stream<List<UserCartModel>> usercartFirestore() {
    return _firestore
        .collection('user')
        .doc(userId)
        .collection("PendingOrder")
        .snapshots()
        .map((QuerySnapshot queryData) {
      List<UserCartModel> dataList = [];
      queryData.docs.forEach((id) {
        dataList.add(UserCartModel.fromDocumentSnapshot(id));
      });
      return dataList;
    });
  }

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
    _firestore
        .collection("user")
        .doc(userId)
        .collection("PendingOrder")
        .doc(uid)
        .update(
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
    } else if (quantity > 1) {
      quantity = quantity - 1;
    }
    
    //  quantity=quantity-1;
    sum = quantity;
    _firestore
        .collection("user")
        .doc(userId)
        .collection("PendingOrder")
        .doc(uid)
        .update(
      {
        'quantity': sum,
        'totalprice': sum * price,
      },
    );
  }

  Future<void> order() async {
    var l;
    String? name;
    late int number = 0;
    // var l = new  rng.nextInt(10000);FirebaseFirestore.instance

// l=namenumber;
    try {
      await _firestore
          .collection('Resturent')
          .doc('MRsBaovyWkTXCLa95d2vMcymLjw1')
          .collection('ordertoken')
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((product) {
          name = product.data()['name'];
          number = product.data()['number'];
          number++;
          _firestore
              .collection("Resturent")
              .doc("MRsBaovyWkTXCLa95d2vMcymLjw1")
              .collection("ordertoken")
              .doc('token')
              .update({'number': number});
          number.toString();
        });
      });

      l = '$name' + '$number';

      await _firestore
          .collection("Resturent")
          .doc("MRsBaovyWkTXCLa95d2vMcymLjw1")
          .collection("order")
          .doc(l)
          .set({'tokenId': l, 'time': FieldValue.serverTimestamp()});
      await FirebaseFirestore.instance
          .collection('user')
          .doc(userId)
          .collection("PendingOrder")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((product) {
          _firestore
              .collection("Resturent")
              .doc("MRsBaovyWkTXCLa95d2vMcymLjw1")
              .collection("order")
              .doc('$l')
              .collection("$l")
              .add({
            'quantity': product.data()['quantity'],
            'image': product.data()['image'],
            'title': product.data()['title'],
            'dec': product.data()['dec'],
          });
        });
      });
      _firestore.collection('user').doc(userId).collection("orderStatus").doc("orderStatus").set({
  'orderId':l,
  'status':"Pending"
      });
      
    } catch (e) {
      Get.snackbar("", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
  Future<void> expended(String id,bool cheak)async{
     try {
      await _firestore.collection("Product").doc(id).delete();
    } catch (e) {
      Get.snackbar("Not upload", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
