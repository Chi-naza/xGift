import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/screens/auth/signup_screen.dart';
import 'package:myapp/screens/widgets/input_n_textfield_widget.dart';
import 'package:myapp/utils.dart';

class SignInScreen extends StatefulWidget {

  @override
  State<SignInScreen> createState() => _SignInScreenState();

  static const String routeName = '/sign-in';
}

class _SignInScreenState extends State<SignInScreen> {

  // input controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // form key
  var signInFormKey = GlobalKey<FormState>();

  // instance of authController
  AuthController authController = Get.find<AuthController>();


 @override
  Widget build(BuildContext context) {

    double baseWidth = 428.2546386719;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.fromLTRB(38*fem, 0*fem, 0*fem, 124*fem),
            width: double.infinity,
            decoration: const BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 61.51*fem),
                  width: double.infinity,
                  height: 246.49*fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // line1
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
                        // rectangle
                        left: 172*fem,
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
                        // signup
                        left: 52*fem,
                        top: 180*fem,
                        child: Align(
                          child: SizedBox(
                            width: 58*fem,
                            height: 19*fem,
                            child: TextButton(
                              onPressed: () {
                                // Go to signup screen on Tap
                                Get.toNamed(SignUpScreen.routeName);
                              },
                              style: TextButton.styleFrom (
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                'Sign Up',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Poppins',
                                  fontSize: 15*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2449999491*ffem/fem,
                                  color: Color(0xfff99601),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // signin
                        left: 243*fem,
                        top: 180*fem,
                        child: Align(
                          child: SizedBox(
                            width: 52*fem,
                            height: 19*fem,
                            child: Text(
                              'Sign In',
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
                      // The top magic curve is here
                      Positioned(
                        // vector1
                        left: 128*fem,
                        top: 0*fem,
                        child: Align(
                          child: Container(                            
                            width: 274.25*fem,
                            height: 246.49*fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-1.png',
                              width: 274.25*fem,
                              height: 246.49*fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // ellipse1: white
                        left: 269*fem,
                        top: 36*fem,
                        child: Align(
                          child: SizedBox(
                            width: 91*fem,
                            height: 89*fem,
                            child: Image.asset(
                              'assets/page-1/images/ellipse-1-aJ5.png',
                              width: 91*fem,
                              height: 89*fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // ellipse2: colored
                        left: 291*fem,
                        top: 57*fem,
                        child: Align(
                          child: SizedBox(
                            width: 48*fem,
                            height: 47*fem,
                            child: Image.asset(
                              'assets/page-1/images/ellipse-2.png',
                              width: 48*fem,
                              height: 47*fem,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: signInFormKey,
                  child: Column(
                    children: [
                      // Email
                      Row(
                        children: [
                          Expanded(
                            child: InputAndTextFieldWidget(
                              overLayText: 'Email Address',
                              inputController: emailController,
                              isEmail: true,
                            )
                          ),                  
                        ],
                      ),
                      // Password
                      Row(
                        children: [
                          Expanded(
                            child: InputAndTextFieldWidget(
                              overLayText: 'Password',
                              inputController: passwordController,
                              isPassword: true,
                            )
                          ),                  
                        ],
                      ),
                    ],
                  ),
                ),
               // Forgot Password text
                Container(
                  // forgotpassword
                  margin: EdgeInsets.fromLTRB(174.75*fem, 0*fem, 0*fem, 100*fem),
                  child: Text(
                    '', //'Forgot Password?',
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
                InkWell(
                  onTap: (() {
                    var email = emailController.text.trim();
                    var pswd = passwordController.text.trim();
                    
                    if(signInFormKey.currentState!.validate()){
                      // calling the sign in function from auth controller
                      authController.signInUser(email, pswd);
                    }
                  }),
                  child: Obx(() {
                      return Container(
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 39.25*fem, 9*fem),
                        width: 335*fem,
                        height: 60*fem,
                        decoration: BoxDecoration (
                          color: Color(0xfff99601),
                          borderRadius: BorderRadius.circular(9*fem),
                        ),
                        child: Center(
                          child: authController.isLoading.value? const CircularProgressIndicator.adaptive(backgroundColor: Colors.white) : Text(
                            'Sign In',
                            style: SafeGoogleFont (
                              'Poppins',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.5*ffem/fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ),
                Container(
                  // signup textButton
                  margin: EdgeInsets.fromLTRB(232.75*fem, 0*fem, 0*fem, 0*fem),
                  child: TextButton(
                    onPressed: () {
                      // Go to signup screen on Tap
                      Get.toNamed(SignUpScreen.routeName);
                    },
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'Sign Up',
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