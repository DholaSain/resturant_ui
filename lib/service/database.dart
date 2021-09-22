import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/Model/cart_model.dart';
import 'package:resturant_ui/Model/categroy_model.dart';
import 'package:resturant_ui/Model/product_model.dart';
import 'package:resturant_ui/utils/global_variable.dart';

class Database{
   FirebaseFirestore _firestore= FirebaseFirestore.instance;
  Future<void> addCart(String id, int quantity, int price) async {
    try {
      await _firestore.collection("user").doc(id).set({
        "category":categoryName.value,
        "ProductId": id,
        "quantity": quantity,
        "totalprice": price,
      });
    } catch (e) {
      Get.snackbar("Not upload", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
 
  Future<void> removeCart(String id)async{
 try {
      await _firestore.collection("items").doc(id).delete();
      
    } catch (e) {
      Get.snackbar("", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
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

 Stream<List<CartModel>> cartFirestore() {
 
    _firestore. collection('Product').get().then(
      (querySnapshot) {
        querySnapshot.docs.forEach((product) {
        itemsId.value= product.data()["ProductId"];
categoryId.value= product.data()["category"];
        });});
    return _firestore
        .collection('categories')
        .where('name',isEqualTo: categoryId.value)
       .snapshots()
       .
        .collection('allProducts')
        .where('id',isEqualTo: itemsId.value)
        .snapshots()
        .map((QuerySnapshot queryData) {
     List<CartModel> dataList = [];
      queryData.docs.forEach((id) {
        dataList.add(CartModel.fromDocumentSnapshot(id));
      });
       return dataList; 
    });
   
  }
   Stream<List<CategoryModel>> categoryFirestore() {
    return _firestore
        .collection('categories')
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
        
        .collection('categories')
        .doc(categoryName.value)
        .collection('allProducts')
        .where("Show",isEqualTo: true)
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<ProductModel> productsList = [];
      for (var element in querySnapshot.docs) {
        productsList.add(ProductModel.fromDocumentSnapshot(element));
      }
      return productsList;
    });
  }
}