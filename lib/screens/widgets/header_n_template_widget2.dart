import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_dimensions.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/controllers/payment_controller.dart';
import 'package:myapp/screens/auth/update_profile.dart';
import 'package:myapp/screens/deposit/deposit_screen.dart';
import 'package:myapp/utilities/utils.dart';

class GiftHeaderAndTemplateWidget2 extends GetView<AuthController> {
  final String titleText;
  final bool isTabRequired;
  final Widget content;
  final Widget? bottomNavBarWidget;
  final bool isPurchaseScreen;
  final VoidCallback? purchaseTapped;
  final VoidCallback? depositTapped;

  const GiftHeaderAndTemplateWidget2({Key? key, required this.titleText, this.isTabRequired=true, required this.content, this.bottomNavBarWidget, this.isPurchaseScreen = false, this.purchaseTapped, this.depositTapped}) : super(key: key);

 @override
  Widget build(BuildContext context) {

    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    // instance of payment controller
    var paymentController = Get.find<PaymentController>();

    // instance of auth controller
    var authController = Get.find<AuthController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom (
              padding: EdgeInsets.zero,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    height: isTabRequired? 500*fem : 450*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 14*fem,
                          top: 99*fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(82*fem, 82*fem, 36*fem, 50*fem),
                            width: 399*fem,
                            height: 256*fem,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(13*fem),
                              gradient: LinearGradient (
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
                                  // autogrouponcqEau (Enw6jkBJPUAkunDsvSonCq)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                                  width: double.infinity,
                                  height: 86*fem,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        // 7ub (1:481)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                                        child: Text(
                                          '#', // '\$',  // Currency Symbol
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
                                        // autogroupauymyS1 (Enw6rf9SwZERA3gTYcAuYM)
                                        width: 257*fem,
                                        height: double.infinity,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              // walletbalancetJ5 (1:460)
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
                                              // 8y7 (1:477)
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
                                                          text: paymentController.moneyFormatter(controller.currentUserDetails.balance.toDouble()), // '34,649', AMOUNT
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
                                    // TOP UP container
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
                        // TITLE text here
                        Positioned(
                          // airtime
                          left: 25*fem,
                          top: 396*fem,
                          child: Align(
                            child: SizedBox(
                              width: 62*fem,
                              height: 24*fem,
                              child: Text(
                                titleText, //'Airtime', // TITLE TEXT
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
                        if(isTabRequired)
                          if(!isPurchaseScreen)
                            Positioned(
                              // ROW of Purchase and Deposit
                              left: 15*fem,
                              top: 423*fem,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(72*fem, 3*fem, 3*fem, 2*fem),
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
                                      onTap: purchaseTapped,
                                      child: Container(
                                        // purchase
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 49*fem, 1*fem),
                                        child: Text(
                                          'Purchase',
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
                                    InkWell(
                                      onTap: depositTapped,
                                      child: Container(
                                        // Deposit
                                        width: 195*fem,
                                        height: double.infinity,
                                        decoration: BoxDecoration (
                                          color: Color(0xfff99601),
                                          borderRadius: BorderRadius.circular(13*fem),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Deposit ',
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
                          if(isPurchaseScreen)  
                            Positioned(
                              // ROW of Purchase and Deposit
                              left: 15*fem,
                              top: 423*fem,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(3*fem, 3*fem, 68*fem, 2*fem),
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: purchaseTapped,
                                      child: Container(
                                        // purchase
                                        width: 195*fem,
                                        height: double.infinity,
                                        decoration: BoxDecoration (
                                          color: Color(0xfff99601),
                                          borderRadius: BorderRadius.circular(13*fem),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Purchase ',
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
                                      onTap: depositTapped,
                                      child: Container(
                                        // Deposit
                                        // margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 49*fem, 1*fem),
                                        child: Text(
                                          'Deposit',
                                          style: SafeGoogleFont (
                                            'Poppins',
                                            fontSize: 18*ffem,
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.w700,
                                            height: 1.5*ffem/fem,
                                            color: Color(0xfff99601),
                                          ),
                                        ),
                                      ),
                                    ),                                    
                                  ],
                                ),
                              ),
                            ),                     
                        Positioned(
                          // PROFILE PIC
                          left: 347*fem,
                          top: 23*fem,
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
                                        child: authController.currentUserDetails.imageUrl == null || authController.currentUserDetails.imageUrl == ""? Container(
                                          decoration: BoxDecoration (
                                            borderRadius: BorderRadius.circular(28.5*fem),
                                            image: DecorationImage (
                                              fit: BoxFit.cover,
                                              image: AssetImage (
                                                'assets/page-1/images/ellipse-3-bg.png',
                                              ),
                                            ),
                                          ),
                                        ) : Container(
                                          decoration: BoxDecoration (
                                            borderRadius: BorderRadius.circular(28.5*fem),
                                            image: DecorationImage (
                                              fit: BoxFit.cover,
                                              image: NetworkImage(authController.currentUserDetails.imageUrl),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // Online Indicator
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
                        Positioned(
                          // Divider is HERE
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
                      ],
                    ), // end  of STACK
                  ),
                  // INSIDE THE COLUMN
                  // Content Here, WRAPPED with Padding widget
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: GiftDim.size12),
                    child: content,
                  ),  
                  // Space at the end of the screen
                  SizedBox(height: GiftDim.size50)
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: bottomNavBarWidget,
    );
  }
}