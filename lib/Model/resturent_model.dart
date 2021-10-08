import 'package:cloud_firestore/cloud_firestore.dart';

class ResturentModel {
  String? name;
  String? contact;
  String? branch;
  String? image;
  String? email;
  String? id;
  ResturentModel(
      {this.branch, this.contact, this.email, this.id, this.image, this.name});
  ResturentModel.fromDocumentSnapshot(DocumentSnapshot data) {
    id = data.get("id");
    name = data.get("name");
    contact = data.get("contact");
    branch = data.get("branch");
    image = data.get("imageUrl");
    email = data.get("email");
  }
}
