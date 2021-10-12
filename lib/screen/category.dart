import 'package:flutter/material.dart';
import 'package:resturant_ui/widget/product_card.dart';

// ignore: must_be_immutable
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
