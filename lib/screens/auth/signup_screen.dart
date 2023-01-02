import 'package:flutter/material.dart';
import 'package:myapp/screens/widgets/input_n_textfield_widget.dart';
import 'package:myapp/utils.dart';

class SignUpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    var fnameController = TextEditingController();
    var LnameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    var pswd1Controller = TextEditingController();
    var pswq2Controller = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            // iphone13promax2n1o (1:202)
            padding: EdgeInsets.fromLTRB(38*fem, 0*fem, 0*fem, 128*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                  width: double.infinity,
                  height: 254*fem,
                  child: Stack(
                    children: [
                      // Line below signIn and SignUp text
                      Positioned(
                        // line1unZ (1:415)
                        left: 0*fem,
                        top: 207*fem,
                        child: Align(
                          child: SizedBox(
                            width: 351*fem,
                            height: 2*fem,
                            child: Container(
                              decoration: BoxDecoration (
                                color: Color(0xfff99601),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle9Nw3 (1:416)
                        left: 0*fem,
                        top: 170*fem,
                        child: Align(
                          child: SizedBox(
                            width: 179*fem,
                            height: 37*fem,
                            child: Container(
                              decoration: BoxDecoration (
                                color: Color(0xfff99601),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // signupgB3 (1:414)
                        left: 52*fem,
                        top: 180*fem,
                        child: Align(
                          child: SizedBox(
                            width: 58*fem,
                            height: 19*fem,
                            child: Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Poppins',
                                fontSize: 15*ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.2449999491*ffem/fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // signinkwb (1:417)
                        left: 243*fem,
                        top: 180*fem,
                        child: Align(
                          child: SizedBox(
                            width: 52*fem,
                            height: 19*fem,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom (
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                'Sign In',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Poppins',
                                  fontSize: 15*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2449999491*ffem/fem,
                                  color: Color(0xfff26b02),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Curved vector at the top of the screen
                      Positioned(
                        left: 128*fem,
                        top: 0*fem,
                        child: Align(
                          child: SizedBox(
                            width: 274.25*fem,
                            height: 246.49*fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-1-gt1.png',
                              width: 274.25*fem,
                              height: 246.49*fem,
                            ),
                          ),
                        ),
                      ),
                      // The circular white shape beside the vector
                      Positioned(
                        left: 269*fem,
                        top: 35*fem,
                        child: Align(
                          child: SizedBox(
                            width: 91*fem,
                            height: 89*fem,
                            child: Image.asset(
                              'assets/page-1/images/ellipse-1.png',
                              width: 91*fem,
                              height: 89*fem,
                            ),
                          ),
                        ),
                      ),
                      // The circular colored shape beside the vector
                      Positioned(
                        left: 291*fem,
                        top: 56*fem,
                        child: Align(
                          child: SizedBox(
                            width: 48*fem,
                            height: 47*fem,
                            child: Image.asset(
                              'assets/page-1/images/ellipse-2-uFX.png',
                              width: 48*fem,
                              height: 47*fem,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // First Name & Last Name here             
                Row(
                  children: [
                    Expanded(
                      child: InputAndTextFieldWidget(
                        overLayText: 'First Name',
                        inputController: fnameController,
                      )
                    ),
                    Expanded(
                      child: InputAndTextFieldWidget(
                        overLayText: 'Surname',
                        inputController: LnameController,
                      )
                    ),
                  ],
                ),
                // Email here
                Row(
                  children: [
                    Expanded(
                      child: InputAndTextFieldWidget(
                        overLayText: 'Email Address',
                        inputController: emailController,
                      )
                    ),                  
                  ],
                ),
                // Phone Number here
                Row(
                  children: [
                    Expanded(
                      child: InputAndTextFieldWidget(
                        overLayText: 'Phone Number',
                        inputController: phoneController,
                      )
                    ),                  
                  ],
                ),
                // Password & Confirm Password here             
                Row(
                  children: [
                    Expanded(
                      child: InputAndTextFieldWidget(
                        overLayText: 'Password',
                        inputController: pswd1Controller,
                      )
                    ),
                    Expanded(
                      child: InputAndTextFieldWidget(
                        overLayText: 'Confirm Password',
                        inputController: pswq2Controller,
                      )
                    ),
                  ],
                ),
                // Choose country section
                Container(
                  // countryctZ (1:418)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 294*fem, 3*fem),
                  child: Text(
                    'Country',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Poppins',
                      fontSize: 15*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2449999491*ffem/fem,
                      color: Color(0xfff26b02),
                    ),
                  ),
                ),
                Container(
                  // autogroup7koouMs (Enw3aqS5Dm9fyAPQda7Koo)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 32*fem, 61*fem),
                  padding: EdgeInsets.fromLTRB(18*fem, 18*fem, 26*fem, 14*fem),
                  decoration: BoxDecoration (
                    color: Color(0xfffff1de),
                    borderRadius: BorderRadius.circular(8*fem),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // line2ZxD (1:422)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
                        width: 73*fem,
                        height: 1*fem,
                        decoration: BoxDecoration (
                          color: Color(0xfff26b02),
                        ),
                      ),
                      Container(
                        // choosecountry5Qm (1:419)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
                        child: Text(
                          'Choose Country',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont (
                            'Poppins',
                            fontSize: 15*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2449999491*ffem/fem,
                            color: Color(0xfff26b02),
                          ),
                        ),
                      ),
                      Container(
                        // line3m2h (1:423)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 7*fem, 0*fem),
                        width: 52*fem,
                        height: 1*fem,
                        decoration: BoxDecoration (
                          color: Color(0xfff26b02),
                        ),
                      ),
                      Container(
                        // polygon1Gk9 (1:420)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2*fem),
                        width: 21*fem,
                        height: 13*fem,
                        child: Image.asset(
                          'assets/page-1/images/polygon-1-TQD.png',
                          width: 21*fem,
                          height: 13*fem,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (() {
                    print('Sign Up Now');
                  }),
                  child: Container(
                    // Get started button here
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 39*fem, 5*fem),
                    width: 335*fem,
                    height: 60*fem,
                    decoration: BoxDecoration (
                      color: Color(0xfff99601),
                      borderRadius: BorderRadius.circular(9*fem),
                    ),
                    child: Center(
                      child: Text(
                        'Get Started',
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
                Container(
                  // signinCGR (1:450)
                  margin: EdgeInsets.fromLTRB(240*fem, 0*fem, 0*fem, 0*fem),
                  child: TextButton(
                    onPressed: () {
                      print("go to sign in screen");
                    },
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'Sign In',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Poppins',
                        fontSize: 15*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2449999491*ffem/fem,
                        color: Color(0xfff26b02),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}