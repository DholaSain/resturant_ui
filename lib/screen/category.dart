import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/restaurant.dart';
import 'package:resturant_ui/widget/categoryCard.dart';

class CategoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: GridView.count(
         crossAxisCount: 2,
          childAspectRatio: 1.0,
         
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 20.0,
       
      padding: EdgeInsets.all(20),
      children: 
      [
      CategoryCard(),
       CategoryCard(),
        CategoryCard(),
         CategoryCard(),
          CategoryCard(),
           CategoryCard(),
            CategoryCard(),
             CategoryCard(),
         
      ],
      ),
);

      // Column(
      //   children: [
      //     CategoryCard(),
      //   ],
      // )
    
  }
}
