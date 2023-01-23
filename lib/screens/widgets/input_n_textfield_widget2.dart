import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:myapp/constants/app_colors.dart';
import 'package:myapp/constants/app_dimensions.dart';

class InputAndTextFieldWidget2 extends StatefulWidget {

  final TextEditingController inputController;
  final String overLayText;
  final Function(PhoneNumber phoneNumber)? onChanged;

  
  const InputAndTextFieldWidget2({
    Key? key, 
    required this.inputController, 
    required this.overLayText,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<InputAndTextFieldWidget2> createState() => _InputAndTextFieldWidget2State();
}

class _InputAndTextFieldWidget2State extends State<InputAndTextFieldWidget2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // The Text Above the Input Text
        Padding(
          padding: EdgeInsets.symmetric(horizontal: GiftDim.size5),
          child: Text(
            widget.overLayText, // overlay text
            style: const TextStyle(
              color: GiftColors.textMainColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // The Input Field
        Container(
          padding: EdgeInsets.only(top: GiftDim.size5, bottom: GiftDim.size20, right: GiftDim.size20), 
          decoration: BoxDecoration(
           
          ), 
          child: IntlPhoneField(
              controller: widget.inputController,
              decoration: InputDecoration(
                fillColor: GiftColors.inputBoxColor,
                filled: true,                 
                 enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(GiftDim.size10),
                ),            
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: GiftColors.textMainColor, width: GiftDim.size3*0.7),
                  borderRadius: BorderRadius.circular(GiftDim.size10),
                ),    
              ),
              initialCountryCode: 'NG',
              onChanged: widget.onChanged,              
            ),
          ),                                  
      ],
    );
  }
}