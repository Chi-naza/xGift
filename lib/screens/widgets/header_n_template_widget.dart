import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_dimensions.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/controllers/payment_controller.dart';
import 'package:myapp/screens/auth/update_profile.dart';
import 'package:myapp/screens/deposit/deposit_screen.dart';
import 'package:myapp/utilities/utils.dart';

class GiftHeaderAndTemplateWidget extends GetView<AuthController> {

  final Widget inputAreaContent;
  final String titleText;
  final bool isToSell;
  final Widget? bottomNavBarWidget;
  final VoidCallback? buyButtonPressed;
  final VoidCallback? sellButtonPressed;
  final Widget buttonWidget;
  final double? buttonSpaceHeight;

  
  const GiftHeaderAndTemplateWidget({
    Key? key, 
    required this.inputAreaContent, 
    required this.titleText, 
    required this.buttonWidget, 
    this.isToSell = false,
    this.bottomNavBarWidget,
    this.buyButtonPressed,
    this.sellButtonPressed, 
    this.buttonSpaceHeight, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    // instance of payment controller
    var paymentController = Get.find<PaymentController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 854*fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // The Gradient Box / Container
                        left: 14*fem,
                        top: 99*fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(82*fem, 82*fem, 36*fem, 50*fem),
                          width: 399*fem,
                          height: 256*fem,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(13*fem),
                            gradient: const LinearGradient (
                              begin: Alignment(-1, -0.91),
                              end: Alignment(1, 1),
                              colors: <Color>[Color(0xfff99601), Color(0xc6fc8d36), Color(0xfff26b02), Color(0xfff26b02)],
                              stops: <double>[0, 0.412, 0.723, 1],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // Container for texts inside the gradient box at the top
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                                width: double.infinity,
                                height: 86*fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7*fem),
                                      child: Text(
                                        "#", // '\$',  // Currency Symbol
                                        style: SafeGoogleFont (
                                          'Poppins',
                                          fontSize: 25*ffem,
                                          fontWeight: FontWeight.w700,
                                          // height: 1.5*ffem/fem,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 257*fem,
                                      height: double.infinity,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            // walletbalance text
                                            left: 32*fem,
                                            top: 0*fem,
                                            child: Align(
                                              child: SizedBox(
                                                width: 125*fem,
                                                height: 24*fem,
                                                child: Text(
                                                  'Wallet Balance',
                                                  style: SafeGoogleFont (
                                                    'Poppins',
                                                    fontSize: 16*ffem,
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.5*ffem/fem,
                                                    color: Color(0xffffffff),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            // Rich Text for the amount/balance
                                            left: 0*fem,
                                            top: 18*fem,
                                            child: Align(
                                              child: SizedBox(
                                                width: 257*fem,
                                                height: 68*fem,
                                                child: RichText(
                                                  text: TextSpan(
                                                    style: SafeGoogleFont (
                                                      'Poppins',
                                                      fontSize: 40*ffem,
                                                      fontWeight: FontWeight.w700,
                                                      height: 1.5*ffem/fem,
                                                      color: Color(0xffffffff),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: paymentController.moneyFormatter(controller.currentUserDetails.balance.toDouble()), //'34,649',  // AMOUNT
                                                        style: SafeGoogleFont (
                                                          'Impact',
                                                          fontSize: 58*ffem,
                                                          fontWeight: FontWeight.w400,
                                                          height: 1.1625*ffem/fem,
                                                          color: Color(0xffffffff),
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '.',
                                                        style: SafeGoogleFont (
                                                          'Impact',
                                                          fontSize: 40*ffem,
                                                          fontWeight: FontWeight.w400,
                                                          height: 1.1625*ffem/fem,
                                                          color: Color(0xffffffff),
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '00',
                                                        style: SafeGoogleFont (
                                                          'Impact',
                                                          fontSize: 32*ffem,
                                                          fontWeight: FontWeight.w400,
                                                          height: 1.1625*ffem/fem,
                                                          color: Color(0xffffffff),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(DepositScreen.routeName);
                                },
                                child: Container(
                                  // Top up Box
                                  margin: EdgeInsets.fromLTRB(65*fem, 0*fem, 106*fem, 0*fem),
                                  width: double.infinity,
                                  height: 29*fem,
                                  decoration: BoxDecoration (
                                    color: Color(0xfff8b551),
                                    borderRadius: BorderRadius.circular(13*fem),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Top Up',
                                      style: SafeGoogleFont (
                                        'Poppins',
                                        fontSize: 16*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.5*ffem/fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // The widget below is visible is the user wants to buy
                      if(!isToSell)
                        Positioned(
                          // Buy & Sell Container (with BUY as priority)
                          left: 15*fem,
                          top: 423*fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(4*fem, 3*fem, 89*fem, 2*fem),
                            width: 397*fem,
                            height: 52*fem,
                            decoration: BoxDecoration (
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(13*fem),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  offset: Offset(0*fem, 1*fem),
                                  blurRadius: 4*fem,
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: buyButtonPressed,
                                  child: Container(
                                    // Buy
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 76*fem, 0*fem),
                                    width: 195*fem,
                                    height: double.infinity,
                                    decoration: BoxDecoration (
                                      color: Color(0xfff99601),
                                      borderRadius: BorderRadius.circular(13*fem),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Buy',
                                        style: SafeGoogleFont (
                                          'Poppins',
                                          fontSize: 16*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.5*ffem/fem,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: sellButtonPressed,
                                  child: Container(
                                    // Sell
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                                    child: Text(
                                      'Sell ',
                                      style: SafeGoogleFont (
                                        'Poppins',
                                        fontSize: 16*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.5*ffem/fem,
                                        color: Color(0xfff26b02),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      // The below widget is visible if the user wants to sell  
                      if(isToSell)
                        Positioned(
                          // Buy & Sell Container (with SELL as priority)
                          left: 15*fem,
                          top: 423*fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(80*fem, 3*fem, 4*fem, 2*fem),
                            width: 397*fem,
                            height: 52*fem,
                            decoration: BoxDecoration (
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(13*fem),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  offset: Offset(0*fem, 1*fem),
                                  blurRadius: 4*fem,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: buyButtonPressed,
                                    child: Container(
                                      // Sell
                                      child: Text(
                                        'Buy ',
                                        style: SafeGoogleFont (
                                          'Poppins',
                                          fontSize: 16*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.5*ffem/fem,
                                          color: Color(0xfff26b02),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: sellButtonPressed,
                                    child: Container(
                                      // Buy                                
                                      width: 195*fem,
                                      height: double.infinity,
                                      decoration: BoxDecoration (
                                        color: Color(0xfff99601),
                                        borderRadius: BorderRadius.circular(13*fem),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Sell',
                                          style: SafeGoogleFont (
                                            'Poppins',
                                            fontSize: 16*ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 1.5*ffem/fem,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),                              
                              ],
                            ),
                          ),
                        ),
                      Positioned(
                        // The BUTTON at the end of the screen details
                        left: 22*fem,
                        top: buttonSpaceHeight??760*fem,
                        child: Container(
                          width: GiftDim.size100*3.5,
                          child: buttonWidget,
                        ),
                      ),
                      Positioned(
                        // DATA INPUT AREA
                        left: 18*fem,
                        top: 513*fem,
                        child: Container(
                          width: 408*fem,
                          height: 300*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // autogroupvpzrPZ3 (EnwHQrZNgM5r6VVUsqvPzR)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
                                width: 392*fem,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // INPUT AREA CONTENT
                                    inputAreaContent                                    
                                  ],
                                ),
                              ),                             
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // airtime
                        left: 25*fem,
                        top: 396*fem,
                        child: Align(
                          child: SizedBox(
                            width: 62*fem,
                            height: 24*fem,
                            child: Text(
                              titleText, // 'Airtime', TITLE TEXT
                              style: SafeGoogleFont (
                                'Poppins',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.5*ffem/fem,
                                color: Color(0xfff99601),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // The Divider here
                        left: 26*fem,
                        top: 385*fem,
                        child: Align(
                          child: SizedBox(
                            width: 381*fem,
                            height: 3*fem,
                            child: Container(
                              decoration: BoxDecoration (
                                color: Color(0xffe7d1af),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // Profile Image Container
                        left: 349*fem,
                        top: 25*fem,
                        child: InkWell(
                          onTap: () => Get.to(UpdateProfileScreen()),
                          child: Container(
                            width: 59*fem,
                            height: 57*fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 2*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 57*fem,
                                      height: 57*fem,
                                      child: Container(
                                        decoration: BoxDecoration (
                                          borderRadius: BorderRadius.circular(28.5*fem),
                                          image: DecorationImage (
                                            fit: BoxFit.cover,
                                            image: AssetImage (
                                              'assets/page-1/images/ellipse-5-bg.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // ONLINE indicator
                                  left: 0*fem,
                                  top: 35*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 20*fem,
                                      height: 20*fem,
                                      child: Container(
                                        decoration: BoxDecoration (
                                          borderRadius: BorderRadius.circular(10*fem),
                                          color: Color(0xff28e824),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x3f000000),
                                              offset: Offset(0*fem, 4*fem),
                                              blurRadius: 2*fem,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),               
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: bottomNavBarWidget,
    );
  }
}