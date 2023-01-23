import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_colors.dart';
import 'package:myapp/constants/app_dimensions.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/controllers/top_up_controller.dart';
import 'package:myapp/screens/data/buy_data_screen.dart';
import 'package:myapp/screens/widgets/app_button.dart';
import 'package:myapp/screens/widgets/bottom_navbar.dart';
import 'package:myapp/screens/widgets/header_n_template_widget.dart';
import 'package:myapp/screens/widgets/input_n_textfield_widget.dart';
import 'package:myapp/screens/widgets/input_n_textfield_widget2.dart';
import 'package:myapp/utilities/user_feedback.dart';


class SellDataScreen extends StatefulWidget {

  @override
  State<SellDataScreen> createState() => _SellDataScreenState();
}

class _SellDataScreenState extends State<SellDataScreen> {

  // form key
  var sellDataFormKey = GlobalKey<FormState>();

  // input controllers
  var quantityController = TextEditingController();
  var phoneNumberCountroller = TextEditingController();

  // auth controller instance
  var authController = Get.find<AuthController>();

  // top up controller instance
  var topUpController = Get.find<TopUpController>();


  // complete number picked
  String completeNumberPicked = '';

  // For DropDown: Mobile Data Validity
  var variousValidity = ["Day", "Week", "Month", "Quarterly"];
  String validityPicked = "Day"; 

  
  @override
  Widget build(BuildContext context) {
  
    return GiftHeaderAndTemplateWidget( 
      titleText: 'Data', 
      isToSell: true,
      inputAreaContent: Form(
        key: sellDataFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InputAndTextFieldWidget(
                    inputController: quantityController, 
                    overLayText: 'Quantity(MB)',
                    isNumber: true,
                  ),
                ),
                SizedBox(width: GiftDim.size50),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // network TEXT
                      const Text(
                        'Validity',
                        style: TextStyle(
                          color: GiftColors.textMainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: GiftDim.size3),
                      // DropdownList wrapped in a Container widget
                      Container(
                        decoration: BoxDecoration(
                          color: GiftColors.inputBoxColor,
                          borderRadius: BorderRadius.circular(GiftDim.size4*1.5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: GiftDim.size12),
                          // Wrapping dropdown button widget with this: to remove the persitent underline
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(                            
                              isExpanded: false,
                              icon: Icon(Icons.keyboard_arrow_down, size: GiftDim.size25),  
                              value: validityPicked,
                              items: variousValidity.map((e) {
                                return DropdownMenuItem(value: e, child: Text(e));
                              }).toList(), 
                              onChanged: (String? newValue){
                                setState(() {
                                  validityPicked = newValue!;                                  
                                });
                              },
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
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
      buttonWidget:  Obx(() {
          return  topUpController.isLoading.value? const CircularProgressIndicator() : AppButton(
            text: 'Subscribe', 
            onPressed:(){
              if(sellDataFormKey.currentState!.validate()){
                // quantity
                var quantity = quantityController.text.trim();
                // number
                var number = completeNumberPicked;
                print(completeNumberPicked);

               
                if(authController.currentUserDetails.balance > 0 && authController.currentUserDetails.balance !=null){
                   UserFeedBack.showConfirmation(
                    amount: "${quantity}MB",  // amount
                    phoneNumber: authController.currentUserDetails.phoneNumber, // number
                    onTap: () { 
                      Get.back();
                      // calling the mobile Data topUp function
                      topUpController.sendMobileDataTopUp(
                        phoneNumber: number, 
                        amountOfDataInMB: quantity, 
                        validity: validityPicked, // picked from the dropdown
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
      buyButtonPressed: () => Get.to(BuyDataScreen()),
      sellButtonPressed: () => Get.to(SellDataScreen()),
      bottomNavBarWidget: const GiftBottomNavBar(isData: true)
    );
  }
}