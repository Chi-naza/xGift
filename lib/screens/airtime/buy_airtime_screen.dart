import 'package:flutter/material.dart';
import 'package:myapp/screens/widgets/choose_network_widget.dart';
import 'package:myapp/screens/widgets/header_n_template_widget.dart';
import 'package:myapp/screens/widgets/input_n_textfield_widget.dart';
import 'package:myapp/utilities/utils.dart';

class BuyAirtimeScreen extends StatefulWidget {

  @override
  State<BuyAirtimeScreen> createState() => _BuyAirtimeScreenState();
}

class _BuyAirtimeScreenState extends State<BuyAirtimeScreen> {
  @override
  Widget build(BuildContext context) {

    return GiftHeaderAndTemplateWidget( 
      titleText: 'Airtime', 
      buttonText: 'Recharge', 
      inputAreaContent: Form(
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
                Expanded(
                  child: InputAndTextFieldWidget(
                    inputController: TextEditingController(), 
                    overLayText: 'Phone Number',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: ChooseNetworkDropDown())
              ]
            ),
          ],
        ),
      ),
    );
  }
}