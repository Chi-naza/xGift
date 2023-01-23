import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_colors.dart';
import 'package:myapp/constants/app_dimensions.dart';
import 'package:myapp/screens/widgets/confirmation_popup.dart';

class UserFeedBack {

  // A function which shows confirmation dialog
  static void showConfirmation({ required String amount, required String phoneNumber, required VoidCallback onTap }){
    showDialog(
      context: Get.context!, 
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GiftDim.size5)
        ),
        content: ConfirmationPopup(
          amount: amount,
          phoneNumber: phoneNumber,
          onTap: onTap,
        ),
    ));
  }


  // Error snackbar
 static void showErrorSnackBar(String message){
   ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ),
  );
 }

// Success snackbar
 static void showSuccessSnackBar(String message){
   ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: GiftColors.mainColor.withOpacity(0.6),
    ),
  );
 }
   



}