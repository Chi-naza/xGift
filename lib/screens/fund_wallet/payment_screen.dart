import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/API/secret_keys.dart';
import 'package:myapp/constants/app_dimensions.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/controllers/payment_controller.dart';
import 'package:myapp/screens/widgets/app_button.dart';
import 'package:pay_with_paystack/pay_with_paystack.dart';

class PaymentScreen extends StatelessWidget {
  final String amount;

  const PaymentScreen({Key? key, required this.amount}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {

    // instance of authController
    AuthController _authController = Get.find<AuthController>();

    // instance of payment COntroller
    var paymentController = Get.find<PaymentController>();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 242, 232),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: GiftDim.size20),
          child: AppButton(
            text: 'Pay With PayStack: [$amount]', 
              onPressed: (() {
                // get a unique ID from date time
                var uniqueIdReference = DateTime.now().microsecondsSinceEpoch.toString();
                
                PayWithPayStack().now(
                  context: context, 
                  secretKey: payStackTestSecretKey, 
                  customerEmail: _authController.getUser()!.email!, 
                  reference: uniqueIdReference, 
                  currency: 'NGN', 
                  amount: '${amount}00', // amount comming from deposit screen
                  transactionCompleted: () { 
                    // done when transaction succeeds
                    paymentController.transactionSucceeded(int.parse(amount), 'Txn$uniqueIdReference'); 
                  }, 
                  transactionNotCompleted: () { 
                    // done when transaction fails
                    paymentController.transactionFailed(); 
                  },  
                );
                
              }
            ),
          ),
        ),
      ),
    );
  }
}