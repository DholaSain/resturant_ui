import 'package:flutter/material.dart';

class RestaurantPage extends StatefulWidget {
  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
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
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height / 1.9,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/imgs/meat.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RoundButton(
                        icon: Icons.arrow_back_ios,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Spacer(),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 51),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Text(
                      "\Rs.125",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(25),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "The American Meat",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                     Text(
                      "This eventually led to their use in meat production on an industrial scale with the aid of slaughterhouses. Meat is mainly composed of water, protein, and fat. It is edible raw, but is normally eaten after it has been cooked and seasoned or processed in a variety of ways.",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Container(
                      
                      width: 200,
                      child: new Center(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 40,
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
                                style: new TextStyle(fontSize: 30.0)),
                            Container(
                              height: 40,
                              child: new FloatingActionButton(
                                onPressed: add,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 200,
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
                              "Add to Cart",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final IconData icon;
  final onTap;
  const RoundButton({required this.icon, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white30,
      ),
      padding: EdgeInsets.all(5.0),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        onPressed: onTap,
      ),
      height: 50,
      width: 50,
    );
  }
}
