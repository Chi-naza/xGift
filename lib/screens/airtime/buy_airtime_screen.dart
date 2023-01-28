import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/controllers/top_up_controller.dart';
import 'package:myapp/screens/airtime/sell_airtime_screen.dart';
import 'package:myapp/screens/widgets/app_button.dart';
import 'package:myapp/screens/widgets/bottom_navbar.dart';
import 'package:myapp/screens/widgets/header_n_template_widget.dart';
import 'package:myapp/screens/widgets/input_n_textfield_widget.dart';
import 'package:myapp/utilities/user_feedback.dart';

class BuyAirtimeScreen extends StatefulWidget {

  @override
  State<BuyAirtimeScreen> createState() => _BuyAirtimeScreenState();
}

class _BuyAirtimeScreenState extends State<BuyAirtimeScreen> {

  // form key
  var buyAirtimeFormKey = GlobalKey<FormState>();

  // input controllers
  var amountController = TextEditingController();
  var currencyController = TextEditingController();

  // auth controller instance
  var authController = Get.find<AuthController>();

  // top up controller instance
  var topUpController = Get.find<TopUpController>();

  // currency symbol
  var currencySymbol = '';


  @override
  Widget build(BuildContext context) {

    return GiftHeaderAndTemplateWidget( 
      titleText: 'Airtime', 
      inputAreaContent: Form(
        key: buyAirtimeFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InputAndTextFieldWidget(
                    inputController: amountController, 
                    overLayText: 'Amount',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // Currency picker from the currency_picker package
                      showCurrencyPicker(
                        context: context, 
                        onSelect: ((value) {
                          setState(() {
                            currencyController.text = value.code;                            
                          });    
                          currencySymbol = value.symbol;                      
                        })
                      );
                    },
                    child: AbsorbPointer(
                      child: InputAndTextFieldWidget(
                        inputController: currencyController, 
                        overLayText: 'Pick Currency',
                        helperText: currencyController.text,
                      ),
                    ),
                  ),
                ),
              ]
            ),
          ],
        ),
      ),
      buttonWidget: Obx(() {
          return  topUpController.isLoading.value? const CircularProgressIndicator() : AppButton(
            text: 'Recharge', 
            onPressed:(){
              if(buyAirtimeFormKey.currentState!.validate()){

                var amount = amountController.text.trim();

                if(authController.currentUserDetails.balance > 0 && authController.currentUserDetails.balance !=null){
                   UserFeedBack.showConfirmation(
                    amount: "$currencySymbol$amount",  // amount
                    phoneNumber: '+2349039427144',//authController.currentUserDetails.phoneNumber, // number
                    onTap: () { 
                      Get.back();
                      print("$amount.0");
                      // calling the airTime topUp function
                      topUpController.sendAirtimeTopUp(
                        phoneNumber: authController.currentUserDetails.phoneNumber, 
                        currencyCode: currencyController.text.trim(), 
                        amount: "$amount.0",
                      );
                    }
                  );
                }else{
                  UserFeedBack.showErrorSnackBar('You do not have enough money in your wallet !');
                }
               
              }
            }
          );
        }
      ),
      buyButtonPressed: () => Get.to(BuyAirtimeScreen()),
      sellButtonPressed: () => Get.to(SellAirtimeScreen()),
      bottomNavBarWidget: const GiftBottomNavBar(isAirtime: true),
    );
  }
}