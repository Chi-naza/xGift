import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:myapp/API/Afri_Talking_API.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/controllers/payment_controller.dart';
import 'package:myapp/models/airtime_response_model.dart';
import 'package:myapp/utilities/message_logger.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/utilities/user_feedback.dart';


class TopUpController extends GetxController {

  // an instance of authController
  var authController = Get.find<AuthController>();

  // an instance of payment controller
  var paymentController = Get.find<PaymentController>();

  final isLoading = false.obs;
  




  // A function to make airtime top up
  Future<void> sendAirtimeTopUp({ required String phoneNumber, required String currencyCode, required String amount}) async {
    try{
      isLoading.value = true;

      var url = Uri.parse(AfricasTalkingAPI.sendAirtimeSANDBOX);

      // sending a request and capturing the result in our API
      var response = await http.post(
        url,
        headers: AfricasTalkingAPI.headers,
        body: AfricasTalkingAPI.getAirtimePayLoad(phoneNumber, currencyCode, amount),
        encoding: Encoding.getByName('utf-8'),
      );

      // Deserializing the data to our model
      var airTimeResponseData = AirtimeResponseModel.fromJson(jsonDecode(response.body));

      if(airTimeResponseData.errorMessage == 'None'){
        // calling the function that will save our transaction in the Database
        await paymentController.saveMyTransaction('Airtime', amount, airTimeResponseData.responses.first.requestId);

        // delay before the next api call
        Future.delayed(Duration(seconds: 1));

        // calling the function that will update my balance
        await paymentController.updateMyBalance(int.parse(amount), false);

        // calling a function that fetches all transactions
        await paymentController.fetchAllTransactions();

        // stop loading
        isLoading.value = false;

        // give feedback to user
        UserFeedBack.showSuccessSnackBar('Airtime sent');

        // delay before the next api call
        Future.delayed(Duration(seconds: 1));

        // navigate to home
        authController.goToTransactionHistoryScreen();
      }else{
        // stop loading
        isLoading.value = false;
        UserFeedBack.showErrorSnackBar('Airtime not sent');
      }

    }catch (e){
      // stop loading
      isLoading.value = false;
      UserFeedBack.showErrorSnackBar('Airtime not sent');
      if(kDebugMode){
        AppLogger.e(e);
      }
    }
  }



  // A function to make mobile data top up
  Future<void> sendMobileDataTopUp({ required String phoneNumber, required String amountOfDataInMB, required String validity}) async {
    try{
      isLoading.value = true;

      var url = Uri.parse(AfricasTalkingAPI.mobileDataTopUpAPI);

      // sending a request and capturing the result in our API
      var response = await http.post(
        url,
        headers: AfricasTalkingAPI.headersForData,
        body: jsonEncode(AfricasTalkingAPI.getMobileDataPayLoad(phoneNumber, amountOfDataInMB, validity)) ,
        encoding: Encoding.getByName('utf-8'),
      );

      print(response.body);

      // // Deserializing the data to our model
      // var dataResponseData = DataResponseModel.fromJson(jsonDecode(response.body[0]));
      // print(dataResponseData.phoneNumber); //testing
      // print(dataResponseData.provider); //testing
      // print(dataResponseData.value); //testing


      // if(dataResponseData.status == "Queued"){
      //  print('Data topUp Successful');
      // }else{
      //   UserFeedBack.showErrorSnackBar('Data Top-Up Failed');
      // }

      // stop loading
      isLoading.value = false;

    }catch (e){
      // stop loading
      isLoading.value = false;

      UserFeedBack.showErrorSnackBar('Data Top-Up Failed');

      if(kDebugMode){
        AppLogger.e(e);
      }
    }
  }






  // A function that gets and returns the currency of a country









}