import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_ui/restaurant.dart';

class AddtoCartCard extends StatefulWidget {
  @override
  _AddtoCartCardState createState() => _AddtoCartCardState();
}

class _AddtoCartCardState extends State<AddtoCartCard> {
   int _n = 1;

  void minus() {
    setState(() {
      if (_n != 1) _n--;
    });
  }

  void add() {
    setState(() {
      _n++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(RestaurantPage());
      },
      child: Container(
       height: 150,
      //  width: 200,
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
        padding: EdgeInsets.all(5),
        // width: MediaQuery.of(context).size.width / 2,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            
            Container(
                  height: 130,
                              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                image: DecorationImage(
                    image: AssetImage(
                      'assets/imgs/lobster.jpg',
                    ),
                     fit: BoxFit.fitHeight,),
              ),
            ),
            
           
             Expanded(
               child: Container(
                 padding: EdgeInsets.all(10),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                      Text("Title for item",style: TextStyle(
                               fontWeight: FontWeight.w400,
                               color: Colors.grey,
fontSize: 25,
                             ),),
                        SizedBox(height: 10,),
                     Text("Total: Rs.200",style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 20,
                         color: Colors.black
                       )),
                       Spacer(),
                     Row(children: [ 
                        Container(
                                  height: 30,
                                  child: new FloatingActionButton(
                                    onPressed: minus,
                                    child: new Icon(
                                      Icons.remove,size: 20,
                                      color: Colors.black,
                                    ),
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                new Text('$_n',
                                    style: new TextStyle(fontSize: 20.0)),
                                Container(
                                  height: 30,
                                  child: new FloatingActionButton(
                                    onPressed: add,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ),
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 5,),
                      //  Spacer(),
                      //  Container(
                      //  decoration: BoxDecoration(
                      //     color: Colors.red,
                      //    borderRadius: BorderRadius.all(Radius.circular(15))
                      //  ),
                      //  padding: EdgeInsets.all(10),
                                           
                      //  child: Text("Update",style: TextStyle(
                      //    fontWeight: FontWeight.bold,
                      //    color: Colors.white
                      //  ),),
                      //                     ),
                     ],)
                    
                   ],
                 ),
               ),
             ),
             
          ],
        ),
      ),
    );
  }
}
