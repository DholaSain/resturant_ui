import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  String?id;
  String? name;
  String? image;
  bool?expanded;
  CategoryModel({this.image,this.name});
  CategoryModel.fromDocumentSnapshot(DocumentSnapshot category){
    id=category.id;
    name = category.get("name");
    image = category.get("image");
    expanded= category.get('expanded');

  }

}