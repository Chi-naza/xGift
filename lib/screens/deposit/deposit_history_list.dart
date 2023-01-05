import 'package:flutter/material.dart';
import 'package:myapp/constants/app_dimensions.dart';
import 'package:myapp/screens/widgets/bottom_navbar.dart';
import 'package:myapp/screens/widgets/header_n_template_widget2.dart';
import 'package:myapp/screens/widgets/transaction_history_card.dart';

class DepositHistoryList extends StatelessWidget {

  const DepositHistoryList({Key? key}): super(key: key);

  static const String routeName = '/deposit-tranction-history';

  @override
  Widget build(BuildContext context) {
    
    return GiftHeaderAndTemplateWidget2(
      titleText: 'History', 
      content: Container(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 15,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: GiftDim.size4),          
          itemBuilder: (context, index) {
            return const TransactionHistoryCard(
              title: 'Airtime', 
              txnID: '3485001', 
              date: '27/12/2022', 
              time: '11:30:21 am', 
              amount: '4,500',
            );       
          },
        ),
      ),
      bottomNavBarWidget: const GiftBottomNavBar(isHome: true),
    );
  }
}