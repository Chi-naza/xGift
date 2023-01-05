import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_colors.dart';
import 'package:myapp/constants/app_dimensions.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/screens/airtime/buy_airtime_screen.dart';
import 'package:myapp/screens/data/buy_data_screen.dart';
import 'package:myapp/screens/deposit/deposit_screen.dart';
import 'package:myapp/utils.dart';

class GiftBottomNavBar extends GetView<AuthController> {

  final bool isHome;
  final bool isData;
  final bool isAirtime;
  final bool isDeposit;

  const GiftBottomNavBar({
    Key? key, 
    this.isHome=false, 
    this.isData=false, 
    this.isAirtime=false, 
    this.isDeposit=false
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      width: double.infinity,
      height: 72*fem,
      decoration: BoxDecoration (
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(8*fem),
        boxShadow: [
          BoxShadow(
            color: Color(0x1e000000),
            offset: Offset(0*fem, -4*fem),
            blurRadius: 6*fem,
          ),
        ],
      ),
      child: Row(
        children: [
          // HOME
          Expanded(
            child: InkWell(
              onTap: (() {
                controller.goToTransactionHistoryScreen();
              }),
              child: Container(
                color: isHome? GiftColors.mainColor.withOpacity(0.2) : null,
                padding: EdgeInsets.all(GiftDim.size10),
                child: Column(
                  children: [
                    Container(                  
                      width: 34*fem,
                      height: 27.78*fem,                    
                      child: Image.asset(
                        'assets/page-1/images/home-svgrepo-com-1-h1j.png',
                        width: 34*fem,
                        height: 27.78*fem,
                      ),
                    ),
                    Container(
                      // home TEXT
                      child: Text(
                        'Home',
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 8*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.5*ffem/fem,
                          color: Color(0xfff26b02),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // DATA
          Expanded(
            child: InkWell(
              onTap: () {
                Get.to(BuyDataScreen());
              },
              child: Container(
                color: isData? GiftColors.mainColor.withOpacity(0.2) : null,
                padding: EdgeInsets.all(GiftDim.size10),
                child: Column(
                  children: [
                    Container(                  
                      width: 34*fem,
                      height: 27.78*fem,                    
                      child: Image.asset(
                        'assets/page-1/images/data-svgrepo-com-1-xaM.png',
                        width: 34*fem,
                        height: 27.78*fem,
                      ),
                    ),
                    Container(
                      // data TEXT
                      child: Text(
                        'Data',
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 8*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.5*ffem/fem,
                          color: Color(0xfff26b02),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // CALL SYMBOL :  Airtime
          Expanded(
            child: InkWell(
              onTap: (() {
                Get.to(BuyAirtimeScreen());
              }),
              child: Container(
                color: isAirtime? GiftColors.mainColor.withOpacity(0.2) : null,
                padding: EdgeInsets.all(GiftDim.size10),
                child: Column(
                  children: [
                    Container(                  
                      width: 34*fem,
                      height: 27.78*fem,                    
                      child: Image.asset(
                        'assets/page-1/images/talking-by-phone-svgrepo-com-1-kEu.png',
                        width: 34*fem,
                        height: 27.78*fem,
                      ),
                    ),
                    Container(
                      // Airtime TEXT
                      child: Text(
                        'Airtime',
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 8*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.5*ffem/fem,
                          color: Color(0xfff26b02),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // DEPOSIT
          Expanded(
            child: InkWell(
              onTap: (() {
                Get.to(const DepositScreen());
              }),
              child: Container(
                color: isDeposit? GiftColors.mainColor.withOpacity(0.2) : null,
                padding: EdgeInsets.all(GiftDim.size10),
                child: Column(
                  children: [
                    Container(                  
                      width: 34*fem,
                      height: 27.78*fem,                    
                      child: Image.asset(
                        'assets/page-1/images/deposit-svgrepo-com-1-ram.png',
                        width: 34*fem,
                        height: 27.78*fem,
                      ),
                    ),
                    Container(
                      // deposit TEXT
                      child: Text(
                        'Deposit',
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 8*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.5*ffem/fem,
                          color: Color(0xfff26b02),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // LOG OUT
          Expanded(
            child: InkWell(
              onTap: (() {
                controller.signOutUser();
              }),
              child: Container(
                padding: EdgeInsets.all(GiftDim.size10),
                child: Column(
                  children: [
                    Container(                  
                      width: 34*fem,
                      height: 27.78*fem,                    
                      child: Image.asset(
                        'assets/page-1/images/log-out-svgrepo-com-1-WVf.png',
                        width: 34*fem,
                        height: 27.78*fem,
                      ),
                    ),
                    Container(
                      // logout TEXT
                      child: Text(
                        'Log out',
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 8*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.5*ffem/fem,
                          color: Color(0xfff26b02),
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
    );
  }
}