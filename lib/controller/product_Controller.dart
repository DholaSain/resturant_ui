import 'package:get/get.dart';
import 'package:resturant_ui/Model/product_model.dart';
import 'package:resturant_ui/service/database.dart';

class ProductController extends GetxController {
  Rxn<List<ProductModel>> productModelList = Rxn<List<ProductModel>>();

  List<ProductModel>? get dataGetter => productModelList.value;

  @override
  void onInit() {
    super.onInit();
    productModelList.bindStream(Database().allProducts());
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}