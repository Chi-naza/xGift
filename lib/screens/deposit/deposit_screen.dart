import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_dimensions.dart';
import 'package:myapp/screens/fund_wallet/payment_screen.dart';
import 'package:myapp/screens/widgets/app_button.dart';
import 'package:myapp/screens/widgets/bottom_navbar.dart';
import 'package:myapp/screens/widgets/header_n_template_widget2.dart';
import 'package:myapp/screens/widgets/input_n_textfield_widget.dart';


class DepositScreen extends StatefulWidget {

  const DepositScreen({Key? key }): super(key: key);

  @override
  State<DepositScreen> createState() => _DepositScreenState();

  static const String routeName = '/deposit-screen';

}

class _DepositScreenState extends State<DepositScreen> {

  var amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return GiftHeaderAndTemplateWidget2(
      titleText: 'Deposit', 
      isTabRequired: false,
      content: Container(
        padding: EdgeInsets.only(left: GiftDim.size20),
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
                  child: AbsorbPointer(
                    child: InputAndTextFieldWidget(
                      inputController: TextEditingController(),
                      overLayText: 'Payment Method',
                      helperText: 'PayStack',
                    ),
                  ),
                ),
              ],
            ),     
            SizedBox(height: GiftDim.size25),
            // App Button wrapped with Padding      
            Padding(
              padding: EdgeInsets.only(right: GiftDim.size20),
              child: Row(
                children: [
                  Expanded(
                    child:  AppButton(
                      text: 'Top Up',
                      onPressed: (){                        
                        if(amountController.text.trim().isEmpty || amountController.text.trim() == null){
                          return;
                        }else{
                          Get.to(PaymentScreen(amount: amountController.text.trim()));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),           
          ],
        ),
      ),
      bottomNavBarWidget: const GiftBottomNavBar(isDeposit: true),
    );
  }
}