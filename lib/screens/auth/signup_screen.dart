import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_dimensions.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/screens/auth/signin_screen.dart';
import 'package:myapp/screens/widgets/input_n_textfield_widget.dart';
import 'package:myapp/screens/widgets/input_n_textfield_widget2.dart';
import 'package:myapp/utilities/user_feedback.dart';
import 'package:myapp/utilities/utils.dart';

class SignUpScreen extends StatefulWidget {

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();

   static const String routeName = '/sign-up';
}

class _SignUpScreenState extends State<SignUpScreen> {

   // input controllers
    var fnameController = TextEditingController();
    var surnameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    var pswd1Controller = TextEditingController();
    var pswq2Controller = TextEditingController();

    // form key
    var signUpFormKey = GlobalKey<FormState>();

  // instance of authController
  var authController = Get.find<AuthController>();

  // country picked variable
  String pickedCountry = '';
  String isoCode = '';
  String completePhoneNumber = '';

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
            padding: EdgeInsets.fromLTRB(38*fem, 0*fem, 0*fem, 128*fem),
            width: double.infinity,
            decoration: const BoxDecoration (
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
                        // line
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
                        // signup Text
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
                        // signin TextButton
                        left: 243*fem,
                        top: 180*fem,
                        child: Align(
                          child: SizedBox(
                            width: 52*fem,
                            height: 19*fem,
                            child: TextButton(
                              onPressed: () {
                                // go to sign in
                                Get.toNamed(SignInScreen.routeName);
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
                Form(
                  key: signUpFormKey,
                  child: Column(
                    children: [
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
                              inputController: surnameController,
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
                              isEmail: true,
                            )
                          ),                  
                        ],
                      ),                     
                      // PHONE new
                      Row(
                        children: [
                          Expanded(
                            child: InputAndTextFieldWidget2(
                              inputController: phoneController, 
                              overLayText: 'Phone Number', 
                              onChanged: ((phoneNumber) {
                                // Getting the complete Number 
                                completePhoneNumber = phoneNumber.completeNumber;
                                // testing
                                print(phoneNumber.completeNumber);
                              })
                            ),
                          )
                        ],
                      ),
                      // Password & Confirm Password here             
                      Row(
                        children: [
                          Expanded(
                            child: InputAndTextFieldWidget(
                              overLayText: 'Password',
                              inputController: pswd1Controller,
                              isPassword: true,
                            )
                          ),
                          Expanded(
                            child: InputAndTextFieldWidget(
                              overLayText: 'Confirm Password',
                              inputController: pswq2Controller,
                              isPassword: true,
                            )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),               
                // Choose country section
                Container(
                  // country overLay Text
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
                InkWell(
                  onTap: () {
                    print('Choose Country');
                    showCountryPicker(
                      context: context, 
                      showPhoneCode: false,
                      onSelect: (Country country){
                        setState(() {
                          pickedCountry = country.name;
                          isoCode = country.countryCode;
                        });
                        // testing
                        print('Country picked is ${country.name}');
                        print('Country CODE picked is ${country.countryCode}');
                        print('Country CODE picked is ${country.phoneCode}');
                      }
                    );
                  },
                  child: Container(
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
                          // choose country text
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
                          width: GiftDim.size100*1.2,
                          child: Text(
                            pickedCountry.isEmpty? 'Choose Country' : pickedCountry,
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
                          // line
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 7*fem, 0*fem),
                          width: 52*fem,
                          height: 1*fem,
                          decoration: BoxDecoration (
                            color: Color(0xfff26b02),
                          ),
                        ),
                        Container(
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
                ),
                InkWell(
                  onTap: (() {
                    var pswd1 = pswd1Controller.text.trim();
                    var pswd2 = pswq2Controller.text.trim();
                    var firstName = fnameController.text.trim();
                    var surName = surnameController.text.trim();
                    var email = emailController.text.trim();
                    var phoneNumber = phoneController.text.trim();

                    // if pswd1 != pswd2 do not submit the form, show a snackbar
                    if(pswd1 != pswd2){
                      UserFeedBack.showErrorSnackBar('Password Mismatch');
                    }else{ 
                       if(signUpFormKey.currentState!.validate()){
                          // password less than 8 chars
                          if(pswd1.length < 8){
                            UserFeedBack.showErrorSnackBar('Your password should be at least 8 characters long!');
                            return;
                          }
                          // If user has not picked a country
                          if(pickedCountry.isEmpty || isoCode.isEmpty){
                            UserFeedBack.showErrorSnackBar('You have not picked a country. Click on the CHOOSE COUNTRY to select your country of origin');
                          }else{
                            // calling our sign up function from auth controller
                            authController.signUpUser(
                              email: email, 
                              password: pswd1, 
                              fName: firstName, 
                              surName: surName, 
                              phoneNumber: completePhoneNumber, 
                              country: pickedCountry,
                              ISOcode: isoCode
                            );
                          }                         
                        }
                    } 
                  }),
                  child: Obx(() {
                      return Container(
                        // Sign UP button here
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 39*fem, 5*fem),
                        width: 335*fem,
                        height: 60*fem,
                        decoration: BoxDecoration (
                          color: Color(0xfff99601),
                          borderRadius: BorderRadius.circular(9*fem),
                        ),
                        child: Center(
                          child: authController.isLoading.value? const CircularProgressIndicator.adaptive(backgroundColor: Colors.white) : Text(
                            'Sign Up',
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
                  // signin textButton
                  margin: EdgeInsets.fromLTRB(240*fem, 0*fem, 0*fem, 0*fem),
                  child: TextButton(
                    onPressed: () {
                      authController.goToLoginScreen();
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