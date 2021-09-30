import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/screen/Product_details.dart';
import 'package:resturant_ui/screen/splashScreen.dart';
import 'package:resturant_ui/screen/product_detail.dart';
import 'package:resturant_ui/service/dynamicLink.dart';
import 'package:resturant_ui/utils/create_dynamicLinks.dart';

import 'controller/UserCart_Controller.dart';
import 'controller/cart_controller.dart';
import 'controller/category_controller.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Get.put(UserCartController());
    Get.put(CategoryController());
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
      home: SplashScreen(),
      // routes: {
      //   'restaurant': (ctx) => RestaurantPage(),
      // },
    );
  }
}

class LinkScreen extends StatelessWidget {
  String name="mdRPiDphpZZK4qSY81GY";
   LinkScreen({ Key? key }) : super(key: key);
   TextEditingController uid= TextEditingController(text: "mdRPiDphpZZK4qSY81GY");
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


