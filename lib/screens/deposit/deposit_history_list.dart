import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/app_dimensions.dart';
import 'package:myapp/controllers/payment_controller.dart';
import 'package:myapp/screens/deposit/purchase_history_list.dart';
import 'package:myapp/screens/widgets/bottom_navbar.dart';
import 'package:myapp/screens/widgets/header_n_template_widget2.dart';
import 'package:myapp/screens/widgets/transaction_history_card.dart';

class DepositHistoryList extends GetView<PaymentController> {

  const DepositHistoryList({Key? key}): super(key: key);

  static const String routeName = '/deposit-tranction-history';

  @override
  Widget build(BuildContext context) {
    
    return GiftHeaderAndTemplateWidget2(
      titleText: 'History', 
      content: ListView.separated(
        shrinkWrap: true,
        itemCount: controller.depositTransactionsList.length,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(height: GiftDim.size4),          
        itemBuilder: (context, index) {
          // txn model variable
          var txn = controller.depositTransactionsList[index];

          return TransactionHistoryCard(
            title: txn.title, // 'Deposit'
            txnID: txn.transactionID, 
            date: txn.date, // '27/12/2022', 
            time: txn.time, //'11:30:21 am', 
            amount: controller.moneyFormatter(double.parse(txn.amount)),
          );       
        },
      ),
      depositTapped: () => Get.toNamed(DepositHistoryList.routeName),
      purchaseTapped: () => Get.to(const PurchaseHistoryList()),
      bottomNavBarWidget: const GiftBottomNavBar(isHome: true),
    );
  }
}