import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/models/transaction_model.dart';
import 'package:myapp/models/user_model.dart';
import 'package:myapp/utilities/firebase_references.dart';
import 'package:myapp/utilities/message_logger.dart';
import 'package:myapp/utilities/user_feedback.dart';

class PaymentController extends GetxController {


  // instance of auth controller
  AuthController authController = Get.find<AuthController>();

  // Lists
  var depositTransactionsList = <TransactionHistoryModel>[].obs;
  var purchaseTransactionsList = <TransactionHistoryModel>[].obs;



  @override
  void onReady() {
    fetchAllTransactions();
    super.onReady();
  }



  // A function which executes when a transaction is successful
  void transactionSucceeded(int amount, String txnID){
    // Calling the deposit function upon successful payment with payment Gateway
    depositToMyWallet(amount, true, txnID);
    // Give user a feedback
    UserFeedBack.showSuccessSnackBar('Transaction Successful');
  }

  // A function called when transaction fails
  void transactionFailed() {
    UserFeedBack.showErrorSnackBar('Transaction Failed');
  }



  // A function which updates user's balance after topUp
  Future<void> updateMyBalance(int amount, bool isDeposit) async {
    try{
      // Get the current user's info and data
      DocumentSnapshot<Map<String, dynamic>> userData = await userFirestoreReference.doc(authController.getUser()!.email).get();

      // deserializing the data gotten
      final currentUser = UserModel.fromSnapshot(userData); 

      int oldBalance = currentUser.balance;
      int totalbalance = 0;

      // if deposit add to our balance, but if not, then subtract from our balance
      if(isDeposit){
        totalbalance  = amount + oldBalance;
      }else{
        totalbalance = oldBalance - amount;
      }     
      
      // delay
      await Future.delayed(const Duration(seconds: 1));

      // update the balance field which is gotten from fetched user data
      await userData.reference.update({'balance' : totalbalance });

      // delay before next API call
      await Future.delayed(const Duration(seconds: 1));

      // Get details of user after balance update
      await authController.fetchUserData();
    
    }catch (e){
      if(kDebugMode){
        AppLogger.e(e);
      }
    }
  }




  // A function which saves record of transactions the user has done in the database
  Future<void> saveMyTransaction(String title, String amount, String txnID) async {

    // Arranging the data using the TransactionHistoryModel
    var transaction = TransactionHistoryModel(
      title: title, 
      amount: amount, 
      date: DateFormat('yMd').format(DateTime.now()), // eg 1/3/2023 
      time: DateFormat.jm().format(DateTime.now()), // eg 5:09 am
      transactionID: txnID
    );

    // Saving the data in our database
    await userFirestoreReference.doc(authController.getUser()!.email).collection('TXN').doc(txnID).set(transaction.toJson());
  }




  // A function which makes a deposit to the user's wallet when called 
  Future<void> depositToMyWallet(int amount, bool isDeposit, String transactionID) async {
    try{
      // calling a function that updates balance
      await updateMyBalance(amount, isDeposit);
      // delay
      await Future.delayed(const Duration(seconds: 1));
      // calling a function that saves the transaction in the DB
      await saveMyTransaction('Deposit', amount.toString(), transactionID);
      // delay
      await Future.delayed(const Duration(seconds: 1));
      // calling a function that fetches all transactions
      await fetchAllTransactions();
      // go to home
      authController.goToTransactionHistoryScreen();

    }catch (e){
      if(kDebugMode){
        AppLogger.e(e);
      }
    }
  }



  // A function which makes a deposit to the user's wallet when called 
  Future<void> fetchAllTransactions() async {
    try{
      // Making a query to our database for the transactions
      QuerySnapshot<Map<String, dynamic>> txnData = await userFirestoreReference.doc(authController.getUser()!.email).collection('TXN').get();

      var transactionData = txnData.docs.map((e) => TransactionHistoryModel.fromSnapshot(e)).toList();

      // Set the lists to empty
      depositTransactionsList.value = [];
      purchaseTransactionsList.value = [];

      // filtering all the transactions to their respective lists
      for(var a in transactionData){
        if(a.title == 'Deposit'){
          depositTransactionsList.add(a);
        }else{
          purchaseTransactionsList.add(a);
        }
      }

    }catch (e){
      if(kDebugMode){
        AppLogger.e(e);
      }
    }
  }





  // A function which formats a number to money-like number
  String moneyFormatter(double amount){

    MoneyFormatter mf = MoneyFormatter(amount: amount);

    // Get the digits only without decimal number
    String newFig = mf.output.withoutFractionDigits;

    return newFig;
  }


  
}