import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/widgets/bottom_navbar.dart';
import 'package:myapp/screens/deposit/deposit_screen.dart';
import 'package:myapp/screens/test.dart';
import 'package:myapp/screens/widgets/header_n_template_widget2.dart';
import 'package:myapp/screens/widgets/transaction_history_card.dart';

import 'package:myapp/utils.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
	return GetMaterialApp(
		title: 'xGift',
		debugShowCheckedModeBanner: false,
		scrollBehavior: MyCustomScrollBehavior(),
		theme: ThemeData(
		primarySwatch: Colors.blue,
		),
		home: DepositScreen(),
	);
	}
}
