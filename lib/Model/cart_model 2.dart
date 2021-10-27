import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel{
  String? id;
  String? ctitle;
  String?sqt;
  String? cdec;
 String? cimage;
 int? cprice;
CartModel({ this.sqt,this.id,this.ctitle,this.cdec,this.cimage,this.cprice});
CartModel.fromDocumentSnapshot(DocumentSnapshot myData) {
   id=myData.id;
   sqt = myData['sqt'];
   ctitle = myData['ctitle'];
   cdec = myData['cdec'];
   cimage = myData['cimage'];
   cprice = myData['cprice'];
  
  //  sqt=myData.get("sqt");
  //  show=myData.get("Show");
  //   ctitle = myData.get('title');
  //   cdec = myData.get('dec');
  //   cimage = myData.get('image');
  //   cprice = myData.get('price');
    }
}