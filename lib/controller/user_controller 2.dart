import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/Model/user_model.dart';
import 'package:resturant_ui/service/database.dart';
class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs;

  UserModel get user => _userModel.value;

  set user(UserModel value) => this._userModel.value = value;
 @override
  void onInit() {
    super.onInit();
   String user =FirebaseAuth.instance.currentUser!.uid;
    _userModel.bindStream(Stream.fromFuture(Database().getUser(user)));
  }
  void clear() {
    _userModel.value = UserModel();
  }
}
