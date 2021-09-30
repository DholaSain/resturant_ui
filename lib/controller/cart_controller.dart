// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:resturant_ui/Model/cart_model.dart';
// import 'package:resturant_ui/Model/product_model.dart';
// import 'package:resturant_ui/controller/UserCart_Controller.dart';
// import 'package:resturant_ui/service/database.dart';
// import 'package:resturant_ui/utils/global_variable.dart';

// class CartController extends GetxController {
//   Rxn<List<CartModel>> cartlList = Rxn<List<CartModel>>();

//   List<CartModel>? get cartdata => cartlList.value;

//   @override
//   void onInit() {
//     FirebaseFirestore.instance.collection('user').get().then((querySnapshot) {
//       querySnapshot.docs.forEach((product) {
//         cartlList.bindStream(Database().cartFirestore(
//             product.data()["category"], product.data()["ProductId"]));
//       });
//     });
//     super.onInit();
//     // Get.put(UserCartController());
//     // final usercart = Get.find<UserCartController>();
//     //       List<CartModel> list= [];

//     // usercart.usercartdata!.forEach((element) {
//     //   list.add(Database().cartFirestore(element.categoryId!,
//     //         element.id!));
//     //   cartlList.bindStream(Stream.fromFuture(
//     //     Database().cartFirestore(element.categoryId!,
//     //         element.id!),
//     //   ));
//     // });
//     // for (var i = 0; i > usercart.usercartdata!.length; i++) {
//     //   cartlList.bindStream(
//     //     Stream.fromFuture(
//     //       Database().cartFirestore(usercart.usercartdata![i].categoryId!,
//     //           usercart.usercartdata![i].id!),
//     //     ).toList() as Stream<List<CartModel>>,
//     //   );
//     // }
//   }

//   @override
//   void onClose() {
//     // TODO: implement onClose
//     super.onClose();
//   }
// }
