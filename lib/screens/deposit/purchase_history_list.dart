import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_dimensions.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/controllers/payment_controller.dart';
import 'package:myapp/screens/deposit/deposit_history_list.dart';
import 'package:myapp/screens/widgets/bottom_navbar.dart';
import 'package:myapp/screens/widgets/header_n_template_widget2.dart';
import 'package:myapp/screens/widgets/transaction_history_card.dart';

class PurchaseHistoryList extends GetView<PaymentController> {

  const PurchaseHistoryList({Key? key}): super(key: key);


  @override
  Widget build(BuildContext context) {

    var authController = Get.find<AuthController>();
    
    return GiftHeaderAndTemplateWidget2(
      titleText: 'History', 
      content: Obx(() {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: authController.purchaseTransactionsList.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(height: GiftDim.size4),          
            itemBuilder: (context, index) {
              // a variable to make work easier
              var txn = authController.purchaseTransactionsList[index];
              return TransactionHistoryCard(
                title: txn.title, //'Airtime', 
                txnID: txn.transactionID, //'3485001', 
                date: txn.date, //'27/12/2022', 
                time: txn.time, //'11:30:21 am', 
                amount: controller.moneyFormatter(double.parse(txn.amount)),
              );       
            },
          );
        }
      ),
      isPurchaseScreen: true,
      depositTapped: () => Get.toNamed(DepositHistoryList.routeName),
      purchaseTapped: () => Get.to(const PurchaseHistoryList()),
      bottomNavBarWidget: const GiftBottomNavBar(isHome: true),
    );
  }
}