// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:resturant_ui/Model/cart_model.dart';
// import 'package:resturant_ui/Model/product_model.dart';
// import 'package:resturant_ui/Model/user_cartmodel.dart';
// import 'package:resturant_ui/service/database.dart';
// import 'package:resturant_ui/utils/global_variable.dart';

// class UserCartController extends GetxController {
//   Rxn<List<UserCartModel>> usercartlList = Rxn<List<UserCartModel>>();

//   List<UserCartModel>? get usercartdata => usercartlList.value;

//   @override
//   void onInit() {
  
//     super.onInit();
//     usercartlList.bindStream(Database().usercartFirestore());
//   }

//   @override
//   void onClose() {
//     // TODO: implement onClose
//     super.onClose();
//   }
// }