import 'package:flutter/material.dart';
import 'package:myapp/utilities/utils.dart';

class GiftHeaderAndTemplateWidget extends StatelessWidget {
  final Widget inputAreaContent;
  final String titleText;
  final String buttonText;
  final VoidCallback? onTap;
  final bool isToSell;
  
  const GiftHeaderAndTemplateWidget({
    Key? key, 
    required this.inputAreaContent, 
    required this.titleText, 
    required this.buttonText, 
    this.onTap,
    this.isToSell = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

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
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 7*fem),
                                      child: Text(
                                        '\$',
                                        style: SafeGoogleFont (
                                          'Poppins',
                                          fontSize: 32*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.5*ffem/fem,
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
                                                        text: '34,649',  // AMOUNT
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
                              Container(
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
                                Container(
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
                                Container(
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
                                Expanded(
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
                              ],
                            ),
                          ),
                        ),
                      Positioned(
                        // The BUTTON at the end of the screen details
                        left: 22*fem,
                        top: 723*fem,
                        child: InkWell(
                          onTap: onTap,
                          child: Container(
                            width: 389*fem,
                            height: 47*fem,
                            decoration: BoxDecoration (
                              color: Color(0xfff99601),
                              borderRadius: BorderRadius.circular(9*fem),
                            ),
                            child: Center(
                              child: Text(
                                buttonText, //'Recharge',  BUTTON TEXT
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
                      Positioned(
                        // DATA INPUT AREA
                        left: 18*fem,
                        top: 513*fem,
                        child: Container(
                          width: 408*fem,
                          height: 195*fem,
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
                    ],
                  ),
                ),
                // THE BOTTOM NAV BAR
                // Container(
                //   // autogroupesnmzpy (EnwJeEg6scKsaJbb39eSNM)
                //   padding: EdgeInsets.fromLTRB(24*fem, 0*fem, 0*fem, 0*fem),
                //   width: double.infinity,
                //   height: 72*fem,
                //   decoration: BoxDecoration (
                //     color: Color(0xffffffff),
                //     borderRadius: BorderRadius.circular(8*fem),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Color(0x1e000000),
                //         offset: Offset(0*fem, -4*fem),
                //         blurRadius: 6*fem,
                //       ),
                //     ],
                //   ),
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.end,
                //     children: [
                //       Container(
                //         // autogroupq2lzDxd (EnwJzPmBYfD5ADMYSpq2LZ)
                //         margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 31*fem, 5*fem),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             Container(
                //               // homesvgrepocom1841 (3:242)
                //               margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3.61*fem),
                //               width: 34*fem,
                //               height: 27.78*fem,
                //               child: Image.asset(
                //                 'assets/page-1/images/home-svgrepo-com-1-h1j.png',
                //                 width: 34*fem,
                //                 height: 27.78*fem,
                //               ),
                //             ),
                //             Container(
                //               // homeneM (3:184)
                //               margin: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 0*fem),
                //               child: Text(
                //                 'Home',
                //                 style: SafeGoogleFont (
                //                   'Poppins',
                //                   fontSize: 8*ffem,
                //                   fontWeight: FontWeight.w700,
                //                   height: 1.5*ffem/fem,
                //                   color: Color(0xfff26b02),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       Container(
                //         // autogroupqkqt4rm (EnwK9dzn3bVr23HFvDqKqT)
                //         width: 81*fem,
                //         height: double.infinity,
                //         child: Stack(
                //           children: [
                //             Positioned(
                //               // datasvgrepocom1Pe9 (3:174)
                //               left: 22*fem,
                //               top: 23*fem,
                //               child: Align(
                //                 child: SizedBox(
                //                   width: 32*fem,
                //                   height: 32*fem,
                //                   child: Image.asset(
                //                     'assets/page-1/images/data-svgrepo-com-1-xaM.png',
                //                     width: 32*fem,
                //                     height: 32*fem,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             Positioned(
                //               // dataEPs (3:183)
                //               left: 28*fem,
                //               top: 55*fem,
                //               child: Align(
                //                 child: SizedBox(
                //                   width: 20*fem,
                //                   height: 12*fem,
                //                   child: Text(
                //                     'Data',
                //                     style: SafeGoogleFont (
                //                       'Poppins',
                //                       fontSize: 8*ffem,
                //                       fontWeight: FontWeight.w700,
                //                       height: 1.5*ffem/fem,
                //                       color: Color(0xfff26b02),
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             Positioned(
                //               // rectangle255vH (7:559)
                //               left: 0*fem,
                //               top: 0*fem,
                //               child: Align(
                //                 child: SizedBox(
                //                   width: 81*fem,
                //                   height: 72*fem,
                //                   child: Opacity(
                //                     opacity: 0.17,
                //                     child: Container(
                //                       decoration: BoxDecoration (
                //                         color: Color(0x2bf99601),
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       Container(
                //         // autogroupr6t9kWd (EnwKqTBmgwa9dP8DCJr6t9)
                //         padding: EdgeInsets.fromLTRB(31.2*fem, 17*fem, 12*fem, 3*fem),
                //         height: double.infinity,
                //         child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.end,
                //           children: [
                //             Container(
                //               // autogroupxrdbFyB (EnwKK3tm7T1z4h6dEhxRdb)
                //               margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 57*fem, 0*fem),
                //               width: 31.8*fem,
                //               height: double.infinity,
                //               child: Stack(
                //                 children: [
                //                   Positioned(
                //                     // airtimeYxH (3:180)
                //                     left: 0.7954101562*fem,
                //                     top: 40*fem,
                //                     child: Align(
                //                       child: SizedBox(
                //                         width: 31*fem,
                //                         height: 12*fem,
                //                         child: Text(
                //                           'Airtime',
                //                           style: SafeGoogleFont (
                //                             'Poppins',
                //                             fontSize: 8*ffem,
                //                             fontWeight: FontWeight.w700,
                //                             height: 1.5*ffem/fem,
                //                             color: Color(0xfff26b02),
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                   Positioned(
                //                     // talkingbyphonesvgrepocom1p97 (3:185)
                //                     left: 0*fem,
                //                     top: 0*fem,
                //                     child: Align(
                //                       child: SizedBox(
                //                         width: 31.59*fem,
                //                         height: 40*fem,
                //                         child: Image.asset(
                //                           'assets/page-1/images/talking-by-phone-svgrepo-com-1-kEu.png',
                //                           width: 31.59*fem,
                //                           height: 40*fem,
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //             Container(
                //               // autogroupxze1sNH (EnwKRYhwFF1ELtq5F9XZE1)
                //               margin: EdgeInsets.fromLTRB(0*fem, 3.52*fem, 51*fem, 2*fem),
                //               height: double.infinity,
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 children: [
                //                   Container(
                //                     // depositsvgrepocom1a1o (3:235)
                //                     margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2.52*fem),
                //                     width: 35*fem,
                //                     height: 31.96*fem,
                //                     child: Image.asset(
                //                       'assets/page-1/images/deposit-svgrepo-com-1-ram.png',
                //                       width: 35*fem,
                //                       height: 31.96*fem,
                //                     ),
                //                   ),
                //                   Container(
                //                     // depositEs3 (3:181)
                //                     margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
                //                     child: Text(
                //                       'Deposit',
                //                       style: SafeGoogleFont (
                //                         'Poppins',
                //                         fontSize: 8*ffem,
                //                         fontWeight: FontWeight.w700,
                //                         height: 1.5*ffem/fem,
                //                         color: Color(0xfff26b02),
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //             Container(
                //               // autogroupccgyvzm (EnwKghwLtkyUL2sTGBCCGy)
                //               margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 2*fem),
                //               height: double.infinity,
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Container(
                //                     // logoutsvgrepocom13Zb (3:232)
                //                     margin: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 0*fem),
                //                     child: TextButton(
                //                       onPressed: () {},
                //                       style: TextButton.styleFrom (
                //                         padding: EdgeInsets.zero,
                //                       ),
                //                       child: Container(
                //                         width: 37*fem,
                //                         height: 37*fem,
                //                         child: Image.asset(
                //                           'assets/page-1/images/log-out-svgrepo-com-1-WVf.png',
                //                           width: 37*fem,
                //                           height: 37*fem,
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                   Text(
                //                     // logoutHTw (3:182)
                //                     'Log out',
                //                     style: SafeGoogleFont (
                //                       'Poppins',
                //                       fontSize: 8*ffem,
                //                       fontWeight: FontWeight.w700,
                //                       height: 1.5*ffem/fem,
                //                       color: Color(0xfff26b02),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
              ),
      ),
    );
  }
}