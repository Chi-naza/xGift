import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/bindings/app_binding.dart';
import 'package:myapp/constants/routes.dart';
import 'package:myapp/screens/auth/signup_screen.dart';
import 'firebase_options.dart';
import 'package:myapp/screens/widgets/bottom_navbar.dart';
import 'package:myapp/screens/deposit/deposit_screen.dart';
import 'package:myapp/screens/test.dart';
import 'package:myapp/screens/widgets/header_n_template_widget2.dart';
import 'package:myapp/screens/widgets/transaction_history_card.dart';

import 'package:myapp/utils.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GiftAppBindings().dependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}




class MyApp extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
    return GestureDetector(
      child: GetMaterialApp(
        title: 'xGift',
        debugShowCheckedModeBanner: true,
        scrollBehavior: MyCustomScrollBehavior(),
        getPages: GiftRouter.routes,
        // home: SignUpScreen(),
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
      ),
    );
	}

}
