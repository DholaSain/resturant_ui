import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/screen/AddCart.dart';
import 'package:resturant_ui/widget/CategoriesList.dart';
import 'package:resturant_ui/widget/cartIcon.dart';
import 'package:resturant_ui/widget/recipiesCard.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: <Widget>[
        
       
      
    
   Scaffold(
      backgroundColor: Colors.white,
     
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("User Name"),
                          Text(
                            "What would you like to EAT ?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ],
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        child: CircleAvatar(
                          
                          backgroundImage: AssetImage("assets/imgs/profile.jpg"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 11.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search for a dish",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
                SizedBox(height: 15.0),
                CategoriesList(),
                SizedBox(height: 15.0),
                Container(
                  height: 720,
                  // padding: EdgeInsets.all(15),
                  child: GridView.builder(
                    
                      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:  2, mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,),
      itemBuilder: (BuildContext context, int index) {
                  
                    return RecipiesCard();
                    },
                  ),
                ),
                SizedBox(height: 5.0),
              ],
            ),
          ),
        ),
      ),
   ),
   Positioned(
     bottom: 20,
     right: 15,
     child: Container(
       height: 70,
       width: 70,
       child: FloatingActionButton(
         backgroundColor: Colors.white,
         onPressed: (){
           Get.to(AddCart());
         },
       child: CartIcon()),
     ),
   )
             ]
    );
  }
}

