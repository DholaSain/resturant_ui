import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/controller/orderStatus_Controller.dart';
import 'package:resturant_ui/screen/home.dart';
import 'package:resturant_ui/screen/login.dart';
import 'package:resturant_ui/service/dynamicLink.dart';
import 'package:resturant_ui/utils/create_dynamicLinks.dart';
import 'package:resturant_ui/utils/root.dart';
import 'controller/UserCart_Controller.dart';
import 'controller/auth_controller.dart';
import 'controller/category_controller.dart';
import 'controller/resturent_controller.dart';
import 'controller/user_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.lazyPut<AuthController>(() => AuthController());
  Get.lazyPut<UserController>(() => UserController());

  DynamicLinkService().handleDynamicLinks();

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.orange,
        fontFamily: 'Montserrat',
      ),
      home: Home(),
      // routes: {
      //   'restaurant': (ctx) => RestaurantPage(),
      // },
    );
  }
}
// ignore: must_be_immutable



