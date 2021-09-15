import 'package:flutter/material.dart';
import 'package:resturant_ui/restaurant.dart';
import 'package:resturant_ui/widget/AddtoCartCard.dart';
import 'package:resturant_ui/widget/recipiesCard.dart';

class AddCart extends StatelessWidget {
  const AddCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: 
          new Size(MediaQuery.of(context).size.width, 150.0),
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [ Colors.orange,Colors.yellow,]),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 3),
                  blurRadius: 3.0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                   RoundButton(
                        icon: Icons.arrow_back_ios,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                     SizedBox(width: 20,),
                  Text(
                    'Order List',
                    style: new TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AddtoCartCard(),
              Spacer(),
                InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          width: 200,
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                colors: [Colors.yellow, Colors.orange],
                              ),
                              boxShadow: [
                                BoxShadow(blurRadius: 5.0, color: Colors.grey)
                              ]),
                          child: Row(
                            children: <Widget>[
                              Spacer(),
                              Text(
                                "Order know",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                 
            ],
          ),
        ));
  }
}
