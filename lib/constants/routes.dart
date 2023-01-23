import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:myapp/controllers/payment_controller.dart';
import 'package:myapp/screens/auth/signin_screen.dart';
import 'package:myapp/screens/auth/signup_screen.dart';
import 'package:myapp/screens/deposit/deposit_history_list.dart';
import 'package:myapp/screens/deposit/deposit_screen.dart';
import 'package:myapp/screens/intro/intro_screen.dart';

class GiftRouter {

  static List<GetPage> routes = [
    // intro
    GetPage(
      name: '/', 
      page: () => IntroScreen(),
    ),
    // sign in
    GetPage(
      name: SignInScreen.routeName, 
      page: () => SignInScreen(),
    ),
    // sign up
    GetPage(
      name: SignUpScreen.routeName, 
      page: () => SignUpScreen(),
    ),
    // deposit history
    GetPage(
      name: DepositHistoryList.routeName, 
      page: () => const DepositHistoryList(),
    ),
    // deposit screen
    GetPage(
      name: DepositScreen.routeName, 
      page: () => const DepositScreen(),
      binding: BindingsBuilder.put(() => PaymentController()),
    ),
  ];

}