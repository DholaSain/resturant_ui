import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/Binding/all_binding.dart';
import 'package:resturant_ui/controller/UserCart_Controller.dart';
import 'package:resturant_ui/controller/cart_controller.dart';
import 'package:resturant_ui/controller/category_controller.dart';
import 'package:resturant_ui/controller/product_Controller.dart';
import 'package:resturant_ui/screen/category.dart';
import 'package:resturant_ui/utils/global_variable.dart';
import 'package:resturant_ui/widget/product_card.dart';

class CategoriesCard extends StatelessWidget {
  Color buttonDefualtColor = Colors.white;
  // final usercartController = Get.find<UserCartController>();
  bool? visibility;
  final categoryController = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return Obx(() {
      if (categoryController.categorydata == null) {
        return CircularProgressIndicator();
      } else {
        return SingleChildScrollView(
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: categoryController.categorydata!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      categoryName.value =
                          categoryController.categorydata![index].name!;
                      ProductController().onInit();
                      debugPrint(categoryName.value);
                      // visibility = !visibility;
                      
                      // Get.to(().
                      //   binding: ProductsBinding());
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          // width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5.0,
                                offset: Offset(0, 3),
                                color: Colors.grey.withOpacity(0.6),
                              ),
                            ],
                          ),
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(7),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              categoryController
                                                  .categorydata![index].image!,
                                            ),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      // "${itemsId.value}",
                                      // usercartController.usercartdata![index].categoryId!,
                                      categoryController
                                          .categorydata![index].name!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                             ],
                            ),
                          ),
                        ),
                          //  visibility
                          //           ? Text('-=-=-=-=')
                          //           : Text('')
                              
                      ],
                    ));
              }),
        );
      }
    });
  }
}
