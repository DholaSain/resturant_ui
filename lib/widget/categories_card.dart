import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/Binding/all_binding.dart';
import 'package:resturant_ui/controller/UserCart_Controller.dart';
import 'package:resturant_ui/controller/cart_controller.dart';
import 'package:resturant_ui/controller/category_controller.dart';
import 'package:resturant_ui/screen/category.dart';
import 'package:resturant_ui/utils/global_variable.dart';


class CategoriesCard extends StatelessWidget {
  
  Color buttonDefualtColor = Colors.white;
  // final usercartController = Get.find<UserCartController>();

  final categoryController = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Obx(() {
      if (categoryController.categorydata == null) {
        return CircularProgressIndicator();
      } else {
        return GridView.builder(
            // physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: categoryController.categorydata!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              childAspectRatio: 1/1.3,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                   categoryName.value=  categoryController.categorydata![index].name!;
                   debugPrint(  categoryName.value);
                          Get.to(() => CategoryPage( categoryController.categorydata![index].name!),
                            binding: ProductsBinding());
                  },
                  child: Container(
                    height: 250,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
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
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.0)),
                              image: DecorationImage(
                                  image: NetworkImage(categoryController
                                      .categorydata![index].image!,),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          // "${itemsId.value}",
                          // usercartController.usercartdata![index].categoryId!,
                          categoryController.categorydata![index].name!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      
                      ],
                    ),
                  ));
            });
      }
    });
  }
}
