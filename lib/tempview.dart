import 'package:flutter/material.dart';

class TempView extends StatelessWidget {
   TempView({ Key? key , required this.title}) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
    );
  }
}