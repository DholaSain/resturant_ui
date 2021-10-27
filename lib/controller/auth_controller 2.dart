import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/Model/user_model.dart';
import 'package:resturant_ui/controller/category_controller.dart';
import 'package:resturant_ui/controller/orderStatus_Controller.dart';
import 'package:resturant_ui/controller/resturent_controller.dart';
import 'package:resturant_ui/controller/user_controller.dart';
import 'package:resturant_ui/screen/home.dart';
import 'package:resturant_ui/service/database.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>();

  User? get user => _firebaseUser.value;

//  @override
//   void dependencies() {
//     Get.lazyPut<AuthController>(() => AuthController());
//   }
  // ignore: must_call_super
  onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(
    String name,
    String email,
    String password,
    int contact,
  ) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      //create user in database.dart
      UserModel _user = UserModel(
        id: _authResult.user!.uid,
        name: name,
        email: _authResult.user!.email,
        contact: contact,
      );
      await Database().createNewUser(_user);
      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        // Get.to(Waiting());
      }
    } catch (e) {
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
          Get.put<ResturentController>(ResturentController());
  Get.put<CategoryController>(CategoryController());
  Get.put(OrderStatusController());
      Get.to(Home());
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user!.uid);
    } catch (e) {
      Get.snackbar('Error Signing In', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }


  void signOut() async {
    try {
    
      await _auth.signOut();
      // Get.to(() => Login());
      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar('Error Signing Out', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

}
