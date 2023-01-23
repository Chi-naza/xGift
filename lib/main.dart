import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/bindings/app_binding.dart';
import 'package:myapp/constants/routes.dart';
import 'firebase_options.dart';


import 'package:myapp/utilities/utils.dart';


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
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyCustomScrollBehavior(),
        getPages: GiftRouter.routes,
        // home: PaymentScreen(),
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
      ),
    );
	}

}
