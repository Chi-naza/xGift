import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/controllers/top_up_controller.dart';
import 'package:myapp/screens/airtime/buy_airtime_screen.dart';
import 'package:myapp/screens/widgets/app_button.dart';
import 'package:myapp/screens/widgets/bottom_navbar.dart';
import 'package:myapp/screens/widgets/header_n_template_widget.dart';
import 'package:myapp/screens/widgets/input_n_textfield_widget.dart';
import 'package:myapp/screens/widgets/input_n_textfield_widget2.dart';
import 'package:myapp/utilities/user_feedback.dart';

class SellAirtimeScreen extends StatefulWidget {
  
  @override
  State<SellAirtimeScreen> createState() => _SellAirtimeScreenState();
}

class _SellAirtimeScreenState extends State<SellAirtimeScreen> {

   // form key
  var sellAirtimeFormKey = GlobalKey<FormState>();

  // input controllers
  var amountController = TextEditingController();
  var currencyController = TextEditingController();
  var phoneNumberCountroller = TextEditingController();

  // auth controller instance
  var authController = Get.find<AuthController>();

  // top up controller instance
  var topUpController = Get.find<TopUpController>();

  // currency symbol
  var currencySymbol = '';

  // completeNumber picked
  String completeNumberPicked = '';


  @override
  Widget build(BuildContext context) {

    return GiftHeaderAndTemplateWidget( 
      titleText: 'Airtime', 
      isToSell: true,
      inputAreaContent: Form(
        key: sellAirtimeFormKey,
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
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: InputAndTextFieldWidget2(
                    inputController: phoneNumberCountroller, 
                    overLayText: 'Phone Number', 
                    onChanged: ((phoneNumber) {
                      completeNumberPicked = phoneNumber.completeNumber;
                    })
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
              if(sellAirtimeFormKey.currentState!.validate()){

                var amount = amountController.text.trim();
                var number = completeNumberPicked;
                var currencyCode = currencyController.text.trim();
                print(currencyCode);

                if(authController.currentUserDetails.balance > 0 && authController.currentUserDetails.balance !=null){
                   UserFeedBack.showConfirmation(
                    amount: "$currencySymbol$amount",  // amount
                    phoneNumber: number,// number
                    onTap: () { 
                      Get.back();
                      // calling the airTime topUp function
                      topUpController.sendAirtimeTopUp(
                        phoneNumber: number, 
                        currencyCode: currencyCode, 
                        amount: amount,
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