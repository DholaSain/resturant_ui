import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'home.dart';
class SplashScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     Timer(
            Duration(seconds:5),
                () =>
           Get.to(Home()));

    return Stack(
      children: <Widget>[
     Container(
       height: 1000,
       width: 700,
     decoration: BoxDecoration(
     gradient: LinearGradient(
     tileMode: TileMode.mirror,
     begin: Alignment.topLeft,
     end: Alignment.bottomRight,
     colors: [
       Color(0xffe79102),
       Color(0xfffbe263),
     ],
     stops: [
       0,
       1,
     ],
     ),
     backgroundBlendMode: BlendMode.srcOver,
     ),
     
            ),
            Center(child: Expanded(child: Lottie.asset('assets/imgs/logo.json',height: 300,width: 250  ))),

      ]
    );
  }
}