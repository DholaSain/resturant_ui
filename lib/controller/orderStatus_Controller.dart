import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/Model/orderStatus_model.dart';
import 'package:resturant_ui/Model/user_model.dart';
import 'package:resturant_ui/service/database.dart';
class OrderStatusController extends GetxController {
  Rxn<List<OrderStatusModel>> _statusModel = Rxn<List<OrderStatusModel>>();

 OrderStatusModel? get status => _statusModel.value?.first;
  
 @override
  void onInit() {
    super.onInit();
    _statusModel.bindStream(Database().orderStatus());
  }

}
