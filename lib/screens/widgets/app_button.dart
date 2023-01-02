import 'package:flutter/material.dart';
import 'package:myapp/constants/app_dimensions.dart';
import 'package:myapp/utils.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          height: GiftDim.size50,
          decoration: BoxDecoration (
            color: Color(0xfff99601),
            borderRadius: BorderRadius.circular(GiftDim.size10),
          ),
          child: Center(
            child: Text(
              text, // nutton text
              style: SafeGoogleFont (
                'Poppins',
                fontSize: GiftDim.size14,
                fontWeight: FontWeight.w700,
                color: Color(0xffffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }
}