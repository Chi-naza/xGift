import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String firstName;
  String surname;
  String email;
  String phoneNumber;
  String country;
  String dateRegistered;
  String imageUrl;
  String ISOcode;
  // List<SalesModel> mySales;

  UserModel({
    required this.firstName,
    required this.surname,
    required this.email,
    required this.phoneNumber,
    required this.country,
    required this.dateRegistered,
    required this.imageUrl,
    required this.ISOcode,
    // required this.mySales,
  });


  UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot):
    firstName = snapshot['first_name'],
    surname = snapshot['surname'],
    email = snapshot['email'],
    phoneNumber = snapshot['phone'],
    country = snapshot['country'],
    dateRegistered = snapshot['date_registered'],
    imageUrl = snapshot['image_url'],
    ISOcode = snapshot['ISOcode'];
    // mySales = snapshot['my_sales'] == null? [] : (snapshot['my_sales'] as List).map((e) => SalesModel.fromJson(e as Map<String, dynamic>)).toList();



  UserModel.fromJson(Map<String, dynamic> json):
    firstName = json['first_name'],
    surname = json['surname'],
    email = json['email'],
    phoneNumber = json['phone'],
    country = json['country'],
    dateRegistered = json['date_registered'],
    imageUrl = json['image_url'],
    ISOcode = json['ISOcode'];
    // mySales = json['my_sales'] == null? [] : (json['my_sales'] as List).map((e) => SalesModel.fromJson(e as Map<String, dynamic>)).toList();


  
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['first_name'] = this.firstName;
    data['surname'] = this.surname;
    data['email'] = this.email;
    data['phone'] = this.phoneNumber;
    data['country'] = this.country;
    data['date_registered'] = this.dateRegistered;
    data['image_url'] = this.imageUrl;
    data['ISOcode'] = this.ISOcode;
    // data['my_sales'] = this.mySales;

    return data;
  }

  
}