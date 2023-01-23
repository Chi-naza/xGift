import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_colors.dart';
import 'package:myapp/constants/app_dimensions.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/controllers/top_up_controller.dart';
import 'package:myapp/screens/data/sell_data_screen.dart';
import 'package:myapp/screens/widgets/app_button.dart';
import 'package:myapp/screens/widgets/bottom_navbar.dart';
import 'package:myapp/screens/widgets/header_n_template_widget.dart';
import 'package:myapp/screens/widgets/input_n_textfield_widget.dart';
import 'package:myapp/utilities/user_feedback.dart';


class BuyDataScreen extends StatefulWidget {
  
  @override
  State<BuyDataScreen> createState() => _BuyDataScreenState();
}

class _BuyDataScreenState extends State<BuyDataScreen> {

  // form key
  var buyDataFormKey = GlobalKey<FormState>();

  // input controllers
  var quantityController = TextEditingController();
 

  // auth controller instance
  var authController = Get.find<AuthController>();

  // top up controller instance
  var topUpController = Get.find<TopUpController>();

  // For DropDown: Mobile Data Validity
  var variousValidity = ["Day", "Week", "Month", "Quarterly"];
  String validityPicked = "Day"; 

 

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
  
    return GiftHeaderAndTemplateWidget( 
      titleText: 'Data',  
      buttonSpaceHeight: 700*fem,
      inputAreaContent: Form(
        key: buyDataFormKey,
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
          ],
        ),
      ),
       buttonWidget: Obx(() {
          return  topUpController.isLoading.value? const CircularProgressIndicator() : AppButton(
            text: 'Subscribe', 
            onPressed:(){
              if(buyDataFormKey.currentState!.validate()){
                // quantity
                var quantity = quantityController.text.trim();
               
                if(authController.currentUserDetails.balance > 0 && authController.currentUserDetails.balance !=null){
                   UserFeedBack.showConfirmation(
                    amount: "${quantity}MB",  // amount
                    phoneNumber: authController.currentUserDetails.phoneNumber, // number
                    onTap: () { 
                      Get.back();
                      // calling the mobile Data topUp function
                      topUpController.sendMobileDataTopUp(
                        phoneNumber: authController.currentUserDetails.phoneNumber, 
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
      bottomNavBarWidget: const GiftBottomNavBar(isData: true),
    );
  }
}