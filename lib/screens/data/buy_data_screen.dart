import 'package:flutter/material.dart';
import 'package:myapp/screens/widgets/choose_network_widget.dart';
import 'package:myapp/screens/widgets/header_n_template_widget.dart';
import 'package:myapp/screens/widgets/input_n_textfield_widget.dart';


class BuyDataScreen extends StatefulWidget {
  
  @override
  State<BuyDataScreen> createState() => _BuyDataScreenState();
}

class _BuyDataScreenState extends State<BuyDataScreen> {

 

  @override
  Widget build(BuildContext context) {
  
    return GiftHeaderAndTemplateWidget( 
      titleText: 'Data', 
      buttonText: 'Subscribe', 
      onTap: (() {
        var CNDropdownInstance = ChooseNetworkDropDown();
        var choiceNetwork = CNDropdownInstance.networkChoice;
        setState(() {
          
        });
        print(choiceNetwork);
      }),
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