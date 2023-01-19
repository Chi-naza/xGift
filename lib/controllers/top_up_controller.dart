import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:myapp/API/api_endpoints.dart';
import 'package:myapp/API/local_storage.dart';
import 'package:myapp/API/secret_keys.dart';
import 'package:myapp/models/company_balance_model.dart';
import 'package:myapp/models/telecom_operators_model.dart';
import 'package:myapp/models/user_country_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopUpController extends GetxController {

  // an instance of getConnect
  final _getConnect = GetConnect();

  // Reactive Lists
  final availableOperators = <TeleComOperatorsModel>[].obs;
  final numberDetails = <TeleComOperatorsModel>[].obs;
  
  TeleComOperatorsModel get phoneNumberDetails => numberDetails.first;



  // a function which gets an access token which can expire, from Reloadly API
  Future<void> getAccessToken() async {
    // Obtain shared preferences.
    var prefs = await SharedPreferences.getInstance();

    try{      
      Response response = await _getConnect.post(APIendPoints.getAccessTokenAPI, payloadData, headers: headersData);

      if(response.body['access_token'] != null){
        // save access token using sharedPreferences
        await prefs.setString(StorageLocals.ACCESS_TOKEN, response.body['access_token']);
        var savedToken =  prefs.getString(StorageLocals.ACCESS_TOKEN);
        //testing
        debugPrint("ACCESS_TOKEN: $savedToken");

      }
      
    }catch (e){
      if(kDebugMode){
        debugPrint(e.toString());
      }
    }
  }





  // A function to fetch comapny's balance
  Future<void> checkCompanysBalance() async {
    try{
      // instance of SharedPreferences   
      var preferences = await SharedPreferences.getInstance();

      // Getting token saved in the locals 
      var accessToken = await preferences.getString(StorageLocals.ACCESS_TOKEN);

      var headers = APIendPoints.headerWithToken(accessToken!);       

      Response response = await _getConnect.get(APIendPoints.getCompanyBalanceAPI, headers: headers);

      // deserializing the data to a model
      var balanceModel = CompanyReloadlyBalanceModel.fromJson(jsonDecode(response.body));

      // save balance to the locals
      await preferences.setString(StorageLocals.COMPANY_BALANCE, balanceModel.balance.toString());
      
      // print test
      print(balanceModel);
      print("BALANCE: ${balanceModel.balance}");


    }catch (e){
      if(kDebugMode){
        debugPrint(e.toString());
      }
    }
  }






  // A function to fetch details of a particular country
  Future<void> fetchDetailsofACountry(String countryCode) async {
    try{     

      // instance of SharedPreferences   
      var preferences = await SharedPreferences.getInstance();

      // Getting token saved in the locals 
      var accessToken = await preferences.getString(StorageLocals.ACCESS_TOKEN);

      // GET request to the API
      Response response = await _getConnect.get(
        APIendPoints.getDetailsofACountryAPI(countryCode),
        headers: APIendPoints.headerWithToken(accessToken!)
      );

      // Deserializing the country's info gotten
      var countryInfo = UserCountryDetailModel.fromJson(jsonDecode(response.body));

      print(countryInfo.name); //test

      
    }catch (e){
      if(kDebugMode){
        debugPrint(e.toString());
      }
    }
  }







  // A function which decifers a number (finding out it's operator)
  Future<void> deciferThisNumber(String phoneNumber, String countryCode) async {
    try{     

      // instance of SharedPreferences   
      var preferences = await SharedPreferences.getInstance();

      // Getting token saved in the locals 
      var accessToken = await preferences.getString(StorageLocals.ACCESS_TOKEN);

      // GET API for decifering a phone number
      Response response = await _getConnect.get(
        APIendPoints.deciferAMobileNumberAPI(phoneNumber, countryCode),
        headers: APIendPoints.headerWithToken(accessToken!)
      );

      // Saving data gotten in a LIst
      numberDetails.add(TeleComOperatorsModel.fromJson(jsonDecode(response.body)));

      // testing
      print(phoneNumberDetails.operatorId);

    }catch (e){
      if(kDebugMode){
        debugPrint(e.toString());
      }
    }  
  }





  // A function which fetches all the available operators in a particular country
  Future<void> fetchAvailableOperators(String countryCode) async {
    
    try{     

      // instance of SharedPreferences   
      var preferences = await SharedPreferences.getInstance();

      // Getting token saved in the locals 
      var accessToken = await preferences.getString(StorageLocals.ACCESS_TOKEN);

      // GET API for fetching available operators
      Response response = await _getConnect.get(
        APIendPoints.fetchAvailableOperatorsAPI(countryCode),
        headers: APIendPoints.headerWithToken(accessToken!)
      );

      // deserializing the data to a model and saving it as a LIST
      availableOperators.addAll((jsonDecode(response.body) as List).map((e) => TeleComOperatorsModel.fromJson(e)).toList());

      // testing
      print("B: ${availableOperators[3].name}");
      print("LENGTH: ${availableOperators.length}");
       for(var a in availableOperators) {
        print(a.name);
       }

    }catch (e){
      if(kDebugMode){
        debugPrint(e.toString());
      }
    }  
  }





  // A function which makes the real top-up
  Future<void> makeATopUp({required String operatorID, required String amount, required String recipientEmail, required String recipientPhoneNumber, required String recipientCountryCode, required String senderCountryCode, required String senderPhoneNumber}) async {

    try{     

      // instance of SharedPreferences   
      var preferences = await SharedPreferences.getInstance();

      // Getting token saved in the locals 
      var accessToken = await preferences.getString(StorageLocals.ACCESS_TOKEN);

      // POST API for making a topup
      Response response = await _getConnect.post(
        APIendPoints.makeATopUpAPI,
        APIendPoints.payloadForTopUp(operatorID: operatorID, amount: amount, recipientEmail: recipientEmail, recipientPhoneNumber: recipientPhoneNumber, recipientCountryCode: recipientCountryCode, senderCountryCode: senderCountryCode, senderPhoneNumber: senderPhoneNumber),
        headers: APIendPoints.headerWithToken(accessToken!),
      );

      print(response.body);

    }catch (e){
      if(kDebugMode){
        debugPrint(e.toString());
      }
    }  
  }



}