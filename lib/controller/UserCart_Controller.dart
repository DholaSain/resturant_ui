import 'package:get/get.dart';
import 'package:resturant_ui/Model/user_cartmodel.dart';
import 'package:resturant_ui/service/database.dart';

class UserCartController extends GetxController {
  Rxn<List<UserCartModel>> usercartlList = Rxn<List<UserCartModel>>();

  List<UserCartModel>? get usercartdata => usercartlList.value;

  @override
  void onInit() {
  
    super.onInit();
    usercartlList.bindStream(Database().usercartFirestore());
  }

  @override
  void onClose() {
    
    super.onClose();
  }
}