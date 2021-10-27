import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/controller/orderStatus_Controller.dart';
import 'package:resturant_ui/screen/home.dart';
import 'package:resturant_ui/screen/login.dart';
import 'package:resturant_ui/screen/qrCode_scanner.dart';
import 'package:resturant_ui/service/dynamicLink.dart';
import 'package:resturant_ui/utils/create_dynamicLinks.dart';
import 'package:resturant_ui/utils/root.dart';
import 'controller/UserCart_Controller.dart';
import 'controller/auth_controller.dart';
import 'controller/category_controller.dart';
import 'controller/resturent_controller.dart';
import 'controller/user_controller.dart';
import 'screen/qr_code.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.lazyPut<AuthController>(() => AuthController());
  Get.lazyPut<UserController>(() => UserController());
  // Get.put<ResturentController>(ResturentController());
  // Get.put<CategoryController>(CategoryController());
  // Get.put(OrderStatusController());
  // Get.lazyPut<OrderStatusController>(() => OrderStatusController());
  DynamicLinkService().handleDynamicLinks();
  // Get.put<UserCartController>(UserCartController());
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
      home: QRViewExample(),
      // routes: {
      //   'restaurant': (ctx) => RestaurantPage(),
      // },
    );
  }
}
// ignore: must_be_immutable
class LinkScreen extends StatelessWidget {
  String name="MRsBaovyWkTXCLa95d2vMcymLjw1";
   LinkScreen({ Key? key }) : super(key: key);
   TextEditingController uid= TextEditingController(text: "MRsBaovyWkTXCLa95d2vMcymLjw1");
final Rxn<String> link = Rxn<String>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Obx(() => Text(link.value ?? 'link here')),
          TextFormField(
            controller: uid,
          ),
          MaterialButton(onPressed: () async{
          link.value = await AppUtils.buildDynamicLink(uid.text);
          print(link.value?? 'No link');
          }, child: Text('Generate Link'))
        ],),
      ),
    );
  }
}


