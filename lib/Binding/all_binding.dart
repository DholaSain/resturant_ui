import 'package:get/get.dart';
import 'package:resturant_ui/controller/cart_controller.dart';
import 'package:resturant_ui/controller/product_Controller.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
// class CartBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<CartController>(() => CartController());
//   }
// }