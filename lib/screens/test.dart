import 'package:flutter/material.dart';
import 'package:myapp/screens/widgets/choose_network_widget.dart';
import 'package:myapp/screens/widgets/confirmation_popup.dart';
import 'package:myapp/screens/widgets/header_n_template_widget.dart';
import 'package:myapp/screens/widgets/input_n_textfield_widget.dart';
import 'package:myapp/utils.dart';

class TestScreen extends StatelessWidget {


 @override
  Widget build(BuildContext context) {

    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: Center(
        child: Text(''),
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.fromLTRB(24*fem, 0*fem, 0*fem, 0*fem),
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                // autogroupq2lzDxd (EnwJzPmBYfD5ADMYSpq2LZ)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 31*fem, 5*fem),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // homesvgrepocom1841 (3:242)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3.61*fem),
                      width: 34*fem,
                      height: 27.78*fem,
                      child: Image.asset(
                        'assets/page-1/images/home-svgrepo-com-1-h1j.png',
                        width: 34*fem,
                        height: 27.78*fem,
                      ),
                    ),
                    Container(
                      // homeneM (3:184)
                      margin: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 0*fem),
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
              Container(
                // autogroupqkqt4rm (EnwK9dzn3bVr23HFvDqKqT)
                width: 81*fem,
                height: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      // datasvgrepocom1Pe9 (3:174)
                      left: 22*fem,
                      top: 23*fem,
                      child: Align(
                        child: SizedBox(
                          width: 32*fem,
                          height: 32*fem,
                          child: Image.asset(
                            'assets/page-1/images/data-svgrepo-com-1-xaM.png',
                            width: 32*fem,
                            height: 32*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // dataEPs (3:183)
                      left: 28*fem,
                      top: 55*fem,
                      child: Align(
                        child: SizedBox(
                          width: 20*fem,
                          height: 12*fem,
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
                      ),
                    ),
                    Positioned(
                      // rectangle255vH (7:559)
                      left: 0*fem,
                      top: 0*fem,
                      child: Align(
                        child: SizedBox(
                          width: 81*fem,
                          height: 72*fem,
                          child: Opacity(
                            opacity: 0.17,
                            child: Container(
                              decoration: BoxDecoration (
                                color: Color(0x2bf99601),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // autogroupr6t9kWd (EnwKqTBmgwa9dP8DCJr6t9)
                padding: EdgeInsets.fromLTRB(31.2*fem, 17*fem, 12*fem, 3*fem),
                height: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // autogroupxrdbFyB (EnwKK3tm7T1z4h6dEhxRdb)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 57*fem, 0*fem),
                      width: 31.8*fem,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                            // airtimeYxH (3:180)
                            left: 0.7954101562*fem,
                            top: 40*fem,
                            child: Align(
                              child: SizedBox(
                                width: 31*fem,
                                height: 12*fem,
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
                            ),
                          ),
                          Positioned(
                            // talkingbyphonesvgrepocom1p97 (3:185)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 31.59*fem,
                                height: 40*fem,
                                child: Image.asset(
                                  'assets/page-1/images/talking-by-phone-svgrepo-com-1-kEu.png',
                                  width: 31.59*fem,
                                  height: 40*fem,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupxze1sNH (EnwKRYhwFF1ELtq5F9XZE1)
                      margin: EdgeInsets.fromLTRB(0*fem, 3.52*fem, 51*fem, 2*fem),
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // depositsvgrepocom1a1o (3:235)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2.52*fem),
                            width: 35*fem,
                            height: 31.96*fem,
                            child: Image.asset(
                              'assets/page-1/images/deposit-svgrepo-com-1-ram.png',
                              width: 35*fem,
                              height: 31.96*fem,
                            ),
                          ),
                          Container(
                            // depositEs3 (3:181)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
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
                    Container(
                      // autogroupccgyvzm (EnwKghwLtkyUL2sTGBCCGy)
                      margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 2*fem),
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // logoutsvgrepocom13Zb (3:232)
                            margin: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 0*fem),
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom (
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                width: 37*fem,
                                height: 37*fem,
                                child: Image.asset(
                                  'assets/page-1/images/log-out-svgrepo-com-1-WVf.png',
                                  width: 37*fem,
                                  height: 37*fem,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            // logoutHTw (3:182)
                            'Log out',
                            style: SafeGoogleFont (
                              'Poppins',
                              fontSize: 8*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.5*ffem/fem,
                              color: Color(0xfff26b02),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
  


//   @override
//   Widget build(BuildContext context) {
//     double baseWidth = 428;
//     double fem = MediaQuery.of(context).size.width / baseWidth;
//     double ffem = fem * 0.97;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           width: double.infinity,
//           child: TextButton(
//             // iphone13promax4MVB (1:458)
//             onPressed: () {},
//             style: TextButton.styleFrom (
//               padding: EdgeInsets.zero,
//             ),
//             child: Container(
//               width: double.infinity,
//               decoration: BoxDecoration (
//                 color: Color(0xffffffff),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Container(
//                     // autogroupgukbory (EnwBTGzCJSYZPaXKdKGUKB)
//                     width: double.infinity,
//                     height: 854*fem,
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           // autogroup5xuhJYq (Enw6T5zPdh8EFDAdHd5xUh)
//                           left: 14*fem,
//                           top: 99*fem,
//                           child: Container(
//                             padding: EdgeInsets.fromLTRB(82*fem, 82*fem, 36*fem, 50*fem),
//                             width: 399*fem,
//                             height: 256*fem,
//                             decoration: BoxDecoration (
//                               borderRadius: BorderRadius.circular(13*fem),
//                               gradient: LinearGradient (
//                                 begin: Alignment(-1, -0.91),
//                                 end: Alignment(1, 1),
//                                 colors: <Color>[Color(0xfff99601), Color(0xc6fc8d36), Color(0xfff26b02), Color(0xfff26b02)],
//                                 stops: <double>[0, 0.412, 0.723, 1],
//                               ),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   // autogrouponcqEau (Enw6jkBJPUAkunDsvSonCq)
//                                   margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
//                                   width: double.infinity,
//                                   height: 86*fem,
//                                   child: Row(
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       Container(
//                                         // 7ub (1:481)
//                                         margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
//                                         child: Text(
//                                           '\$',
//                                           style: SafeGoogleFont (
//                                             'Poppins',
//                                             fontSize: 32*ffem,
//                                             fontWeight: FontWeight.w700,
//                                             height: 1.5*ffem/fem,
//                                             color: Color(0xffffffff),
//                                           ),
//                                         ),
//                                       ),
//                                       Container(
//                                         // autogroupauymyS1 (Enw6rf9SwZERA3gTYcAuYM)
//                                         width: 257*fem,
//                                         height: double.infinity,
//                                         child: Stack(
//                                           children: [
//                                             Positioned(
//                                               // walletbalancetJ5 (1:460)
//                                               left: 32*fem,
//                                               top: 0*fem,
//                                               child: Align(
//                                                 child: SizedBox(
//                                                   width: 125*fem,
//                                                   height: 24*fem,
//                                                   child: Text(
//                                                     'Wallet Balance',
//                                                     style: SafeGoogleFont (
//                                                       'Poppins',
//                                                       fontSize: 16*ffem,
//                                                       fontWeight: FontWeight.w700,
//                                                       height: 1.5*ffem/fem,
//                                                       color: Color(0xffffffff),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             Positioned(
//                                               // 8y7 (1:477)
//                                               left: 0*fem,
//                                               top: 18*fem,
//                                               child: Align(
//                                                 child: SizedBox(
//                                                   width: 257*fem,
//                                                   height: 68*fem,
//                                                   child: RichText(
//                                                     text: TextSpan(
//                                                       style: SafeGoogleFont (
//                                                         'Poppins',
//                                                         fontSize: 40*ffem,
//                                                         fontWeight: FontWeight.w700,
//                                                         height: 1.5*ffem/fem,
//                                                         color: Color(0xffffffff),
//                                                       ),
//                                                       children: [
//                                                         TextSpan(
//                                                           text: '34,649',
//                                                           style: SafeGoogleFont (
//                                                             'Impact',
//                                                             fontSize: 58*ffem,
//                                                             fontWeight: FontWeight.w400,
//                                                             height: 1.1625*ffem/fem,
//                                                             color: Color(0xffffffff),
//                                                           ),
//                                                         ),
//                                                         TextSpan(
//                                                           text: '.',
//                                                           style: SafeGoogleFont (
//                                                             'Impact',
//                                                             fontSize: 40*ffem,
//                                                             fontWeight: FontWeight.w400,
//                                                             height: 1.1625*ffem/fem,
//                                                             color: Color(0xffffffff),
//                                                           ),
//                                                         ),
//                                                         TextSpan(
//                                                           text: '60',
//                                                           style: SafeGoogleFont (
//                                                             'Impact',
//                                                             fontSize: 32*ffem,
//                                                             fontWeight: FontWeight.w400,
//                                                             height: 1.1625*ffem/fem,
//                                                             color: Color(0xffffffff),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   // autogroupxmqtiTT (Enw759ndWPWp9yUQ2DxmqT)
//                                   margin: EdgeInsets.fromLTRB(65*fem, 0*fem, 106*fem, 0*fem),
//                                   width: double.infinity,
//                                   height: 29*fem,
//                                   decoration: BoxDecoration (
//                                     color: Color(0xfff8b551),
//                                     borderRadius: BorderRadius.circular(13*fem),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       'Top Up',
//                                       style: SafeGoogleFont (
//                                         'Poppins',
//                                         fontSize: 16*ffem,
//                                         fontWeight: FontWeight.w700,
//                                         height: 1.5*ffem/fem,
//                                         color: Color(0xffffffff),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           // autogroupneu9XA1 (Enw7JPuZdMLMVcmmojnEU9)
//                           left: 15*fem,
//                           top: 423*fem,
//                           child: Container(
//                             padding: EdgeInsets.fromLTRB(72*fem, 3*fem, 3*fem, 2*fem),
//                             width: 397*fem,
//                             height: 52*fem,
//                             decoration: BoxDecoration (
//                               color: Color(0xffffffff),
//                               borderRadius: BorderRadius.circular(13*fem),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Color(0x3f000000),
//                                   offset: Offset(0*fem, 1*fem),
//                                   blurRadius: 4*fem,
//                                 ),
//                               ],
//                             ),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   // purchaseKLm (1:484)
//                                   margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 49*fem, 1*fem),
//                                   child: Text(
//                                     'Purchase',
//                                     style: SafeGoogleFont (
//                                       'Poppins',
//                                       fontSize: 16*ffem,
//                                       fontWeight: FontWeight.w700,
//                                       height: 1.5*ffem/fem,
//                                       color: Color(0xfff99601),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   // autogroup6n8h1Db (Enw7iJPQ53uGn74uku6n8H)
//                                   width: 195*fem,
//                                   height: double.infinity,
//                                   decoration: BoxDecoration (
//                                     color: Color(0xfff99601),
//                                     borderRadius: BorderRadius.circular(13*fem),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       'Deposit ',
//                                       style: SafeGoogleFont (
//                                         'Poppins',
//                                         fontSize: 16*ffem,
//                                         fontWeight: FontWeight.w700,
//                                         height: 1.5*ffem/fem,
//                                         color: Color(0xffffffff),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           // historyfJ9 (1:485)
//                           left: 25*fem,
//                           top: 396*fem,
//                           child: Align(
//                             child: SizedBox(
//                               width: 59*fem,
//                               height: 24*fem,
//                               child: Text(
//                                 ' History',
//                                 style: SafeGoogleFont (
//                                   'Poppins',
//                                   fontSize: 16*ffem,
//                                   fontWeight: FontWeight.w700,
//                                   height: 1.5*ffem/fem,
//                                   color: Color(0xfff99601),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           // autogroupvxub7fw (Enw6AWdgANhPB44CaLvXuB)
//                           left: 347*fem,
//                           top: 23*fem,
//                           child: Container(
//                             width: 59*fem,
//                             height: 57*fem,
//                             child: Stack(
//                               children: [
//                                 Positioned(
//                                   // ellipse3zzd (1:482)
//                                   left: 2*fem,
//                                   top: 0*fem,
//                                   child: Align(
//                                     child: SizedBox(
//                                       width: 57*fem,
//                                       height: 57*fem,
//                                       child: Container(
//                                         decoration: BoxDecoration (
//                                           borderRadius: BorderRadius.circular(28.5*fem),
//                                           image: DecorationImage (
//                                             fit: BoxFit.cover,
//                                             image: AssetImage (
//                                               'assets/page-1/images/ellipse-3-bg.png',
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   // ellipse4r1F (2:2)
//                                   left: 0*fem,
//                                   top: 35*fem,
//                                   child: Align(
//                                     child: SizedBox(
//                                       width: 20*fem,
//                                       height: 20*fem,
//                                       child: Container(
//                                         decoration: BoxDecoration (
//                                           borderRadius: BorderRadius.circular(10*fem),
//                                           color: Color(0xff28e824),
//                                           boxShadow: [
//                                             BoxShadow(
//                                               color: Color(0x3f000000),
//                                               offset: Offset(0*fem, 4*fem),
//                                               blurRadius: 2*fem,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           // line4VK7 (2:4)
//                           left: 26*fem,
//                           top: 385*fem,
//                           child: Align(
//                             child: SizedBox(
//                               width: 381*fem,
//                               height: 3*fem,
//                               child: Container(
//                                 decoration: BoxDecoration (
//                                   color: Color(0xffe7d1af),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           // autogroupzynmxTb (Enw7moHZzKjwhSmcXkZYNM)
//                           left: 14*fem,
//                           top: 499*fem,
//                           child: Container(
//                             width: 412*fem,
//                             height: 209*fem,
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Container(
//                                   // autogroupjewb3V3 (Enw7uxidoJ2qquQb15JewB)
//                                   margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 12*fem, 9*fem),
//                                   width: 392*fem,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                       Container(
//                                         // group2jMs (2:19)
//                                         padding: EdgeInsets.fromLTRB(29*fem, 15*fem, 20*fem, 10*fem),
//                                         width: double.infinity,
//                                         decoration: BoxDecoration (
//                                           color: Color(0xfffff1de),
//                                           borderRadius: BorderRadius.circular(6*fem),
//                                         ),
//                                         child: Row(
//                                           crossAxisAlignment: CrossAxisAlignment.center,
//                                           children: [
//                                             Container(
//                                               // airtimeo6q (2:13)
//                                               margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 38*fem, 1*fem),
//                                               child: Text(
//                                                 'Airtime',
//                                                 style: SafeGoogleFont (
//                                                   'Poppins',
//                                                   fontSize: 16*ffem,
//                                                   fontWeight: FontWeight.w700,
//                                                   height: 1.5*ffem/fem,
//                                                   color: Color(0xfff26b02),
//                                                 ),
//                                               ),
//                                             ),
//                                             Container(
//                                               // UCy (2:17)
//                                               margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 47*fem, 0*fem),
//                                               child: Text(
//                                                 '3485001',
//                                                 style: SafeGoogleFont (
//                                                   'Poppins',
//                                                   fontSize: 10*ffem,
//                                                   fontWeight: FontWeight.w700,
//                                                   height: 1.5*ffem/fem,
//                                                   color: Color(0xfff26b02),
//                                                 ),
//                                               ),
//                                             ),
//                                             Container(
//                                               // autogrouppumkA5o (Enw8ACouKmEaJW3ss7puMK)
//                                               margin: EdgeInsets.fromLTRB(0*fem, 5*fem, 39*fem, 0*fem),
//                                               child: Column(
//                                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                                 children: [
//                                                   Container(
//                                                     // fHT (2:15)
//                                                     margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
//                                                     child: Text(
//                                                       '11/11/2022',
//                                                       style: SafeGoogleFont (
//                                                         'Poppins',
//                                                         fontSize: 10*ffem,
//                                                         fontWeight: FontWeight.w700,
//                                                         height: 1.5*ffem/fem,
//                                                         color: Color(0xfff26b02),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     // amkZo (2:16)
//                                                     '11:30:21 am',
//                                                     style: SafeGoogleFont (
//                                                       'Poppins',
//                                                       fontSize: 10*ffem,
//                                                       fontWeight: FontWeight.w700,
//                                                       height: 1.5*ffem/fem,
//                                                       color: Color(0xfff26b02),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Container(
//                                               // H3w (2:14)
//                                               margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
//                                               child: Text(
//                                                 '4,500',
//                                                 style: SafeGoogleFont (
//                                                   'Poppins',
//                                                   fontSize: 20*ffem,
//                                                   fontWeight: FontWeight.w700,
//                                                   height: 1.5*ffem/fem,
//                                                   color: Color(0xfff26b02),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),   
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
                       
                        
//                       ],
//                     ),
//                   ),
                  
//                 ],
//               ),
//             ),
//           ),
//               ),
//       ),
//     );
//   }
// }