import 'package:flutter/material.dart';
import 'package:myapp/utilities/utils.dart';

class TransactionHistoryCard extends StatelessWidget {
  final String title;
  final String txnID;
  final String date;
  final String time;
  final String amount;
  
  const TransactionHistoryCard({Key? key, required this.title, required this.txnID, required this.date, required this.time, required this.amount}) : super(key: key);

 @override
  Widget build(BuildContext context) {

    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Container of the Row of items in the card
                  Container(
                    padding: EdgeInsets.fromLTRB(29*fem, 15*fem, 20*fem, 10*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      color: Color(0xfffff1de),
                      borderRadius: BorderRadius.circular(6*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // airtime/Title text 
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 38*fem, 1*fem),
                          child: Text(
                            title, // 'Airtime', TITLE
                            style: SafeGoogleFont (
                              'Poppins',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.5*ffem/fem,
                              color: Color(0xfff26b02),
                            ),
                          ),
                        ),
                        Container(
                          // Txn ID
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 47*fem, 0*fem),
                          width: 68*fem,                         
                          child: Text(
                            txnID, // '3485001',
                            overflow: TextOverflow.ellipsis,
                            style: SafeGoogleFont (
                              'Poppins',
                              fontSize: 10*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.5*ffem/fem,
                              color: Color(0xfff26b02),
                            ),
                          ),
                        ),
                        // Container of column with date and time
                        Container(
                          margin: EdgeInsets.fromLTRB(0*fem, 5*fem, 30*fem, 0*fem),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // date
                                margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
                                child: Text(
                                  date, // '11/11/2022',
                                  style: SafeGoogleFont (
                                    'Poppins',
                                    fontSize: 10*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.5*ffem/fem,
                                    color: Color(0xfff26b02),
                                  ),
                                ),
                              ),
                              Text(
                                // time
                                time, // '11:30:21 am',
                                style: SafeGoogleFont (
                                  'Poppins',
                                  fontSize: 10*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5*ffem/fem,
                                  color: Color(0xfff26b02),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // AMOUNT
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                          width: 52*fem, 
                          child: Text(
                            amount, // '4,500',
                            overflow: TextOverflow.ellipsis,
                            style: SafeGoogleFont (
                              'Poppins',
                              fontSize: 20*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.5*ffem/fem,
                              color: Color(0xfff26b02),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),   
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}