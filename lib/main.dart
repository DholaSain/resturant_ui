import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/restaurant.dart';
import 'package:resturant_ui/screen/splashScreen.dart';
import 'package:resturant_ui/widget/recipiesCard.dart';
void main() => runApp(MyApp());
List<String> buttonsTitle = ["All", "Popular", "Dessert", "Snack", "Fast Food"];


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


