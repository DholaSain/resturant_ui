import 'package:get/get.dart';
import 'package:resturant_ui/controller/product_Controller.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}