import 'package:get/get.dart';
import 'package:resturant_ui/Model/cart_model.dart';
import 'package:resturant_ui/Model/product_model.dart';
import 'package:resturant_ui/service/database.dart';

class CartController extends GetxController {
  Rxn<List<CartModel>> cartlList = Rxn<List<CartModel>>();

  List<CartModel>? get cartdata => cartlList.value;

  @override
  void onInit() {
    super.onInit();
    cartlList.bindStream(Database().cartFirestore());
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}