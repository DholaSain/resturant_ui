import 'package:cloud_firestore/cloud_firestore.dart';

class UserCartModel{
  String? id;
 String? categoryId;
 String?image;
 String?dec;
 String? title;
 int? quantity;
 int? price;

UserCartModel({this.title,this.dec,this.image,this.id,this.categoryId,this.quantity,this.price});
UserCartModel.fromDocumentSnapshot(DocumentSnapshot myData) {
   id=myData.get("ProductId");
    categoryId = myData.get('category');
    quantity = myData.get('quantity');
    price = myData.get('totalprice');
    dec = myData.get('dec');
    image = myData.get('image');
    title = myData.get('title'); 
    }
}