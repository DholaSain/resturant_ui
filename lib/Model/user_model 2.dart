import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  int? contact;
  UserModel({this.id, this.name, this.email,this.contact});

  UserModel.fromDocumentSnapshot({required DocumentSnapshot doc}) {
    id = doc.id;
    name = doc["name"];
    email = doc['email'];
    contact = doc['contact'];

  }
}
