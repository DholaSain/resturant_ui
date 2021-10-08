import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryModel{
  String? resturentName;
  String? branch;
  int? totalprice;
  String? date;
  String? image;
  HistoryModel({this.image,this.branch,this.date,this.resturentName,this.totalprice});

  HistoryModel.fromDocumentSnapshot(DocumentSnapshot data){
    resturentName = data.get("returentname");
    branch = data.get("branch");
    totalprice = data.get("totalprice");
    date = data.get("date");
    image = data.get("image");
  }
}