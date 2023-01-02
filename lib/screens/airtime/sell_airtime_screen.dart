import 'package:flutter/material.dart';
import 'package:myapp/screens/widgets/choose_network_widget.dart';
import 'package:myapp/screens/widgets/header_n_template_widget.dart';
import 'package:myapp/screens/widgets/input_n_textfield_widget.dart';

class SellAirtimeScreen extends StatefulWidget {
  
  @override
  State<SellAirtimeScreen> createState() => _SellAirtimeScreenState();
}

class _SellAirtimeScreenState extends State<SellAirtimeScreen> {

  @override
  Widget build(BuildContext context) {

    return GiftHeaderAndTemplateWidget( 
      titleText: 'Airtime', 
      buttonText: 'Sell', 
      isToSell: true,
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