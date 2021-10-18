import 'package:cloud_firestore/cloud_firestore.dart';

class OrderStatusModel{
  String? id;
  String? orderId;
  String? status;
  String?order;

  OrderStatusModel({this.order,this.id,this.orderId,this.status});

  OrderStatusModel.fromDocumentSnapshot(DocumentSnapshot data){
   id=data.id;
   orderId=data['orderId'];
   status=data['status'];
   order=data['order'];
  }

}