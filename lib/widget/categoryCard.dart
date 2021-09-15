import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/restaurant.dart';
import 'package:resturant_ui/widget/recipiesCard.dart';

class CategoryCard extends StatefulWidget {
  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: () {
          Get.to(RecipiesCard());
        },
        child: Container(
          
          height: 200,
          
          decoration: BoxDecoration(
            color: Color(0xffffC069),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                 
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    // image: DecorationImage(
                    
                    //     image: AssetImage(
                    //       'assets/imgs/burger.png',
                    //     ),
                    //     fit: BoxFit.contain),
                  ),
                  child:  Image.asset(
                          'assets/imgs/burgericon.png',height: 100,width: 100,fit: BoxFit.contain,
                        ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Burger",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,),
              )
            ],
          ),
        ),
      );
    
  }
}
