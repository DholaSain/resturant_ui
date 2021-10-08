import 'package:get/get.dart';
import 'package:resturant_ui/controller/UserCart_Controller.dart';
import 'package:resturant_ui/controller/auth_controller.dart';
import 'package:resturant_ui/controller/cart_controller.dart';
import 'package:resturant_ui/controller/orderStatus_Controller.dart';
import 'package:resturant_ui/controller/product_Controller.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}

class AuthBinding extends Bindings {
  @override  
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
      }
    
      
}
class OrderStatusBinding extends Bindings {
  @override  
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
      }  
}
class UserCartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserCartController>(() => UserCartController());
  }
}
