import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/modals/deliveryPartnerLedegrAccountModel.dart';

class CustomDeliveryPartnerLedgerAccount extends StatelessWidget {
  final String date;
  final List<BookingsDp> bookingLists;
  final int totalBookingServed;
  final double incentive;

  const CustomDeliveryPartnerLedgerAccount(
      {Key? key,
      required this.date,
      required this.bookingLists,
      required this.incentive,
      required this.totalBookingServed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(10),
            width: screenSize.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$date",
                    style: TextStyle(
                      color: darkGreyColor,
                      fontFamily: 'helvetica',
                    )),
                GradientText(
                  title: "Print",
                  isbold: false,
                  isUnderline: true,
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: bluegradientstartColor, width: 2),
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  height: 45,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [bluegradientstartColor, bluegradientendColor],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  width: screenSize.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bookings",
                        style: TextStyle(
                            color: darkGreyColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'helvetica'),
                      ),
                      Text(
                        "Pickup /Delivery",
                        style: TextStyle(
                            color: darkGreyColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'helvetica'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          width: screenSize.width,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${bookingLists[index].BookingID}",
                                  style: TextStyle(fontFamily: 'helvetica'),
                                ),
                                Text("\₹${bookingLists[index].type}",
                                    style: TextStyle(fontFamily: 'helvetica'))
                              ]));
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        height: 1,
                        width: screenSize.width,
                        color: bluegradientstartColor,
                      );
                    },
                    itemCount: bookingLists.length),
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        height: 1,
                        width: screenSize.width,
                        color: bluegradientstartColor,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        width: screenSize.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                                flex: 3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("Total Booking Served",
                                        style: TextStyle(
                                            fontFamily: 'helvetica',
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("$totalBookingServed",
                                        style: TextStyle(
                                          fontFamily: 'helvetica',
                                        )),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        height: 1,
                        width: screenSize.width,
                        color: bluegradientstartColor,
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        width: screenSize.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                                flex: 3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("Incentive>100 Booking",
                                        style: TextStyle(
                                          fontFamily: 'helvetica',
                                        )),
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("$incentive",
                                        style: TextStyle(
                                          fontFamily: 'helvetica',
                                        )),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ]))
        ]));
  }
}
