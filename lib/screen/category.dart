import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/screen/Product_details.dart';
import 'package:resturant_ui/widget/categoryCard.dart';
import 'package:resturant_ui/widget/product_card.dart';

class CategoryPage extends StatelessWidget {
CategoryPage(this.category);
String? category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(backgroundColor: Colors.orange,
      title: Text("$category"+" Category"),),
      body: ProductsCard(),
);

      // Column(
      //   children: [
      //     CategoryCard(),
      //   ],
      // )
    
  }
}
