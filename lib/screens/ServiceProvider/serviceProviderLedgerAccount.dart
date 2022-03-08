import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomLedgerAccount.dart';
import 'package:flutter_test_app/modals/LedgerAccount.dart';

class ServiceProviderLedgerAccount extends StatefulWidget {
  const ServiceProviderLedgerAccount({Key? key}) : super(key: key);

  @override
  _ServiceProviderLedgerAccountState createState() =>
      _ServiceProviderLedgerAccountState();
}

class _ServiceProviderLedgerAccountState
    extends State<ServiceProviderLedgerAccount> {
  List<LedgerAccount> _ledgerAccountList = [
    LedgerAccount(
        date: "Feburary 2022",
        bookingLists: [
          BookingList(bookingID: "CRB20021101", price: 0),
          BookingList(bookingID: "CRB20021101", price: 0),
          BookingList(bookingID: "CRB20021101", price: 0),
          BookingList(bookingID: "CRB20021101", price: 0),
          BookingList(bookingID: "CRB20021101", price: 0),
          BookingList(bookingID: "CRB20021101", price: 0),
        ],
        totalBookingAmount: 0,
        totalGST: 0,
        clorevShare: 0,
        gstOnClorevShare: 0,
        netPayableAmount: 0),
    LedgerAccount(
        date: "January 2022",
        bookingLists: [
          BookingList(bookingID: "CRB20021101", price: 0),
          BookingList(bookingID: "CRB20021101", price: 0),
          BookingList(bookingID: "CRB20021101", price: 0),
          BookingList(bookingID: "CRB20021101", price: 0),
          BookingList(bookingID: "CRB20021101", price: 0),
          BookingList(bookingID: "CRB20021101", price: 0),
        ],
        totalBookingAmount: 0,
        totalGST: 0,
        clorevShare: 0,
        gstOnClorevShare: 0,
        netPayableAmount: 0)
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Ledger Account",
            style:
                TextStyle(fontWeight: FontWeight.bold, fontFamily: 'helvetica'),
          ),
          leading: IconButton(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 40,
                color: Colors.white,
              )),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [bluegradientstartColor, bluegradientendColor],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft),
            ),
          ),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/bodybg.png")),
            ),
            child: Container(
                child: ListView.separated(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    separatorBuilder: ((context, index) {
                      return SizedBox(
                        height: 15,
                      );
                    }),
                    shrinkWrap: true,
                    itemCount: _ledgerAccountList.length,
                    itemBuilder: (context, index) {
                      return CustomLedgerAccount(
                        date: _ledgerAccountList[index].date,
                        bookingLists: _ledgerAccountList[index].bookingLists,
                        totalBookingAmount:
                            _ledgerAccountList[index].totalBookingAmount,
                        gstOnClorevShare:
                            _ledgerAccountList[index].gstOnClorevShare,
                        clorevShare: _ledgerAccountList[index].clorevShare,
                        totalGST: _ledgerAccountList[index].totalGST,
                        netPayableAmount:
                            _ledgerAccountList[index].netPayableAmount,
                      );
                    }))));
  }
}
