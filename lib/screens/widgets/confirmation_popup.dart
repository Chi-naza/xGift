import 'package:flutter/material.dart';
import 'package:myapp/constants/app_dimensions.dart';
import 'package:myapp/screens/widgets/app_button.dart';
import 'package:myapp/utilities/utils.dart';

class ConfirmationPopup extends StatelessWidget {
  final String amount;
  final String phoneNumber;
  final VoidCallback onTap;
  
  const ConfirmationPopup({Key? key, required this.amount, required this.phoneNumber, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      width: GiftDim.screenWidth - GiftDim.size20,
      padding: EdgeInsets.symmetric(horizontal: GiftDim.size20, vertical: GiftDim.size20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GiftDim.size20),
        color: Colors.white,      
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
         children: [
            // The Image
            SizedBox(
              child: Image.asset(
                'assets/page-1/images/faq-svgrepo-com-1.png',
                width: GiftDim.size20*4,
                height: GiftDim.size20*4,
              ),
            ),
            SizedBox(height: GiftDim.size10),
            // The Texts
            SizedBox(
              width: 154*fem,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: SafeGoogleFont (
                    'Poppins',
                    fontSize: 16*ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.5*ffem/fem,
                    color: Color(0xfff26b02),
                  ),
                  children: [
                    TextSpan(
                      text: 'Recharge ',
                    ),
                    TextSpan(
                      text: amount, // '2500', AMOUNT
                      style: SafeGoogleFont (
                        'Poppins',
                        fontSize: 20*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.5*ffem/fem,
                        color: Color(0xfff26b02),
                      ),
                    ),
                    TextSpan(
                      text: ' to\n',
                    ),
                    TextSpan(
                      text: phoneNumber, // '08123456789',  PHONE
                      style: SafeGoogleFont (
                        'Poppins',
                        fontSize: 20*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.5*ffem/fem,
                        color: Color(0xfff26b02),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: GiftDim.size10),
            // The Confirm Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: GiftDim.size20),
              child: AppButton(
                text: 'Confirm', 
                onPressed: onTap,
              ),
            ),
         ],
      ),
    );
  }
}