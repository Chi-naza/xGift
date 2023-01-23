import 'dart:convert';

import 'package:myapp/API/secret_keys.dart';

class AfricasTalkingAPI {
  
  // FOR AIRTIME (POST request)
  static const String sendAirtimeAPI = "https://api.africastalking.com/version1/airtime/send";
  static const String sendAirtimeSANDBOX = "https://api.sandbox.africastalking.com/version1/airtime/send";


  // FOR MOBILE DATA (POST request)
  static const String mobileDataTopUpAPI = "https://payments.africastalking.com/mobile/data/request";


  // API Headers
  static Map<String, String> headers = {
    "apiKey": afriTalkAPIKey,
    "Content-Type": "application/x-www-form-urlencoded",
    "Accept": "application/json"
  };

  static Map<String, String> headersForData = {
    "apiKey": afriTalkAPIKey,
    "Content-Type": "application/json",
    "Accept": "application/json"
  };


  // A function which returns the payLoad for airTime top up
  static getAirtimePayLoad(String phoneNumber, String currencyCode, String amount){

    var payLoad = {
      "username" : "sandbox",
      "recipients" : jsonEncode([{"phoneNumber":"$phoneNumber","amount":"$currencyCode $amount"},])
    };

    return payLoad;
  }



  // A function which returns the payLoad for mobile data top up
  static getMobileDataPayLoad(String phoneNumber, String amountOfDataInMB, String validity) {

    var payLoad = {      
      "username" : "sandbox",
      "productName" : "Data Top-Up",      
      "recipients" : [{"phoneNumber":phoneNumber}], // e.g +234811222333  
      "quantity" : amountOfDataInMB,    
      "unit" : "MB",
      "validity" : validity, // eg  can be Day, Week, Month, or Quarterly.
    };

    return payLoad;
  }


}