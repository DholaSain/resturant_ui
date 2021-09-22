import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/controller/product_Controller.dart';
import 'package:resturant_ui/screen/Product_details.dart';

const defaultPadding = 16.0;

class ProductsCard extends StatelessWidget {

 

  Color buttonDefualtColor = Colors.white;

  final productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Obx(() {
      if (productController.dataGetter == null) {
        return CircularProgressIndicator();
      } else {
        return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: productController.dataGetter!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              childAspectRatio: 1/1.3,
            ),
            itemBuilder: (context, index) {
            
              return GestureDetector(
                  onTap: () {
                    Get.to(RestaurantPage(
                      id: productController.dataGetter![index].id!,
                      dec: productController.dataGetter![index].fdec!,
                      title: productController.dataGetter![index].ftitle!,
                      price: productController.dataGetter![index].fprice!,
                      image: productController.dataGetter![index].fimage!,
                      
                    ));
                    //  categoryName.value=  productController.dataGetter![index].name!;
                            // Get.to(() => CategoryProduct(productController.dataGetter![index].name!),
                            //   binding: ProductsBinding());
                  },
                  child: Container(
                    height: 350,
                    width: 250,
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
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    // width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.0)),
                              image: DecorationImage(
                                  image: NetworkImage(productController
                                      .dataGetter![index].fimage!),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        
                        Text(
                                     productController.dataGetter![index].ftitle!,
                                      // textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                     productController.dataGetter![index].fdec!,
                                      // textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("Rs "
                                     '${productController.dataGetter![index].fprice!}',
                                      // textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                        // Text(
                        //   productController.dataGetter![index].ftitle!,
                        //   style: TextStyle(fontWeight: FontWeight.bold),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Text(
                        //   "Rs:" +
                        //       "${categoryController.dataGetter![index].fprice!}",
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold, color: Colors.red),
                        // ),
                       ],
                    ),
                  ));
            });
      }
    });
  }
}
