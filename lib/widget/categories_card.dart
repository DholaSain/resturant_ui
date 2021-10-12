import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/controller/category_controller.dart';
import 'package:resturant_ui/controller/product_Controller.dart';
import 'package:resturant_ui/utils/global_variable.dart';
import 'package:resturant_ui/widget/product_card.dart';

// ignore: must_be_immutable
class CategoriesCard extends StatelessWidget {
  Color buttonDefualtColor = Colors.white;
  var curruntID = ''.obs;
  var expanded = false.obs;

  // final usercartController = Get.find<UserCartController>();
  var visibility = false.obs;
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
                var msgs = categoryController.categorydata![index];
                return GestureDetector(
                    onTap: () {
                      categoryName.value =
                          categoryController.categorydata![index].name!;

                      if (curruntID.value == msgs.id) {
                        curruntID.value = '';
                        categoryName.value = '';
                      } else {
                        curruntID.value = msgs.id!;
                      }
                      debugPrint(categoryName.value);
                      Get.put(ProductController()).onInit();
                    
                      
                    },
                    child: Column(
                      children: [
                        Container(
                          // height: 220,
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
                            child: Obx(() => Container(
                                  color: msgs.id == curruntID.value
                                      ? Colors.grey[100]
                                      : Colors.white,
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                        .categorydata![index]
                                                        .image!,
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
                                          Spacer(),
                                        msgs.id == curruntID.value?Icon(Icons.keyboard_arrow_up):  Icon(Icons.keyboard_arrow_down),
                                          SizedBox(
                                            width: 15,
                                          ),
                                        ],
                                      ),
                                      msgs.id == curruntID.value
                                          ? ProductsCard()
                                          : Container()
                                    ],
                                  ),
                                )),
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