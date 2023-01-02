import 'package:flutter/material.dart';
import 'package:myapp/constants/app_dimensions.dart';
import 'package:myapp/screens/widgets/app_button.dart';
import 'package:myapp/screens/widgets/header_n_template_widget2.dart';
import 'package:myapp/screens/widgets/input_n_textfield_widget.dart';
import 'package:myapp/utilities/user_feedback.dart';

class DepositScreen extends StatelessWidget {

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
                    inputController: TextEditingController(),
                    overLayText: 'Amount',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: InputAndTextFieldWidget(
                    inputController: TextEditingController(),
                    overLayText: 'Payment Method',
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
                        print('Deposited !');
                        UserFeedBack.showSuccessSnackBar('Success');
                      },
                    ),
                  ),
                ],
              ),
            ),           
          ],
        ),
      ),
    );
  }
}