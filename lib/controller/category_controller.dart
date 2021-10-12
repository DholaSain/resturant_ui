import 'package:get/get.dart';
import 'package:resturant_ui/Model/categroy_model.dart';
import 'package:resturant_ui/service/database.dart';

class CategoryController extends GetxController {
  Rxn<List<CategoryModel>> categoryModelList = Rxn<List<CategoryModel>>();

  List<CategoryModel>? get categorydata => categoryModelList.value;

  @override
  void onInit() {
    super.onInit();

    categoryModelList.bindStream(Database().categoryFirestore());
    
  }

  @override
  void onClose() {
    
    super.onClose();
  }
}