import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:resturant_ui/controller/auth_controller.dart';
import 'package:resturant_ui/screen/home.dart';
import 'package:resturant_ui/screen/login.dart';


class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
 
    return Obx((){
return (Get.find<AuthController>().user != null) ?Home():LoginFormCard();
    });
  }
}