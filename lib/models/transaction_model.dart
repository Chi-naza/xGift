import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionHistoryModel {
  String title;
  String amount;
  String date;
  String time;
  String transactionID;
  

  TransactionHistoryModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.time,
    required this.transactionID,
  });


  TransactionHistoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot):
    title = snapshot['title'],
    amount = snapshot['amount'],
    date = snapshot['date'],
    time = snapshot['time'],
    transactionID= snapshot['transaction_id'];
    



  TransactionHistoryModel.fromJson(Map<String, dynamic> json):
    title = json['title'],
    amount = json['amount'],
    date = json['date'],
    time = json['time'],
    transactionID= json['transaction_id'];


  
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['title'] = this.title;
    data['amount'] = this.amount;
    data['date'] = this.date;
    data['time'] =  this.time;
    data['transaction_id'] = this.transactionID;
    

    return data;
  }

  
}