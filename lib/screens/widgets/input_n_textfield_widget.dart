import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/constants/app_colors.dart';
import 'package:myapp/constants/app_dimensions.dart';

class InputAndTextFieldWidget extends StatelessWidget {
  final TextEditingController inputController;
  final String overLayText;
  final bool isPassword;
  final bool isEmail;
  final bool isNumber;
  final String? helperText;
  
  const InputAndTextFieldWidget({
    Key? key, 
    required this.inputController, 
    required this.overLayText,
    this.isPassword=false,
    this.isEmail=false,
    this.isNumber=false, 
    this.helperText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // The Text Above the Input Text
        Padding(
          padding: EdgeInsets.symmetric(horizontal: GiftDim.size5),
          child: Text(
            overLayText, // overlay text
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
          child: TextFormField(
            autocorrect: true,
            obscureText: isPassword? true : false,
            obscuringCharacter: '*',
            controller: inputController,
            keyboardType: isNumber? TextInputType.phone : TextInputType.text,
            // onChanged: onChanged,    
            validator: ((value) {
              if(!isEmail){
                if(value!.isEmpty){
                  return 'Provide a value';
                }else{
                  return null;
                }
              }

              if(isEmail){
                if(value!.isEmpty){
                  return 'Email field is empty. Provide your email';
                }else if(!value.contains('@') || !value.contains('.')){
                  return 'Invalid email address';
                }else{
                  return null;
                }
              }
                         
            }),
            decoration: InputDecoration(  
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(GiftDim.size10),
              ),            
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: GiftColors.textMainColor, width: GiftDim.size3*0.7),
                borderRadius: BorderRadius.circular(GiftDim.size10),
              ),    
              hintText: helperText, 
              hintStyle: GoogleFonts.montserrat(letterSpacing: 3, fontWeight: FontWeight.bold, color: Colors.grey.shade400, fontSize: GiftDim.size18),
              // hintStyle: const TextStyle(
              //   color: Colors.white,
              //   letterSpacing: 1,
              //   fontWeight: FontWeight.w600,                
              // ),                    
              fillColor: GiftColors.inputBoxColor,
              filled: true,                                 
            ),
          ),
        ),
      ],
    );
  }
}