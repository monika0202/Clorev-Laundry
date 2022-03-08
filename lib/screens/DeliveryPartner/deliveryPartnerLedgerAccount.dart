import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomDeliveryPartnerLedgerAccount.dart';
import 'package:flutter_test_app/components/CustomLedgerAccount.dart';
import 'package:flutter_test_app/modals/deliveryPartnerLedegrAccountModel.dart';

class DeliveryPartnerLedgerAccount extends StatefulWidget {
  const DeliveryPartnerLedgerAccount({Key? key}) : super(key: key);

  @override
  _DeliveryPartnerLedgerAccountState createState() =>
      _DeliveryPartnerLedgerAccountState();
}

class _DeliveryPartnerLedgerAccountState
    extends State<DeliveryPartnerLedgerAccount> {
  List<LedgerAccountDP> _ledgerAccountList = [
    LedgerAccountDP(
        date: "21 -27 Feb 2022",
        bookingLists: [
          BookingsDp(BookingID: "CRB200921101", type: "Pick-up"),
          BookingsDp(BookingID: "CRB200921101", type: "Pick-up"),
          BookingsDp(BookingID: "CRB200921101", type: "Delivery"),
          BookingsDp(BookingID: "CRB200921101", type: "Pick-up"),
          BookingsDp(BookingID: "CRB200921101", type: "Delivery"),
          BookingsDp(BookingID: "CRB200921101", type: "Pick-up"),
        ],
        totalBookingServed: 107,
        incentive: 350)
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
                      return CustomDeliveryPartnerLedgerAccount(
                          date: _ledgerAccountList[index].date,
                          bookingLists: _ledgerAccountList[index].bookingLists,
                          incentive: _ledgerAccountList[index].incentive,
                          totalBookingServed:
                              _ledgerAccountList[index].totalBookingServed);
                    }))));
  }
}
