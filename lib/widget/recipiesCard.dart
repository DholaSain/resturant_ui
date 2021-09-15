import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/restaurant.dart';

class RecipiesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(RestaurantPage());
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
        // width: MediaQuery.of(context).size.width / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
             
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/imgs/lobster.jpg',
                      ),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text("Title for item"),
             SizedBox(
              height: 5,
            ),
             Text("Rs.200"),
             
          ],
        ),
      ),
    );
  }
}
