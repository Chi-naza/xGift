import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/API/secret_keys.dart';
import 'package:myapp/constants/app_dimensions.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/controllers/payment_controller.dart';
import 'package:myapp/screens/widgets/app_button.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

class PaymentScreen extends StatefulWidget {
  final String amount;

  const PaymentScreen({Key? key, required this.amount}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  var publicKey = payStackPublicKey;
  final plugin = PaystackPlugin();

  // instance of payment controller
  var paymentController = Get.find<PaymentController>();

  @override
  void initState() {
    plugin.initialize(publicKey: publicKey);
    super.initState();
    
  }

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
            text: 'Pay With PayStack: [${widget.amount}]', 
              onPressed: (() {

                // calling the charge card function from paymentController
                paymentController.chargeCard(plugin, int.parse(widget.amount));
                
              }
            ),
          ),
        ),
      ),
    );
  }
}