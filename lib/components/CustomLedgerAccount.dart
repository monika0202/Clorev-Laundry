import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/modals/LedgerAccount.dart';

class CustomLedgerAccount extends StatelessWidget {
  final String date;
  final List<BookingList> bookingLists;
  final double totalBookingAmount;
  final double totalGST;
  final double clorevShare;
  final double gstOnClorevShare;
  final double netPayableAmount;
  const CustomLedgerAccount({
    Key? key,
    required this.date,
    required this.bookingLists,
    required this.totalBookingAmount,
    required this.totalGST,
    required this.clorevShare,
    required this.gstOnClorevShare,
    required this.netPayableAmount,
  }) : super(key: key);

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
      child: Column(
        children: [
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                        "Amounts",
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
                                  "${bookingLists[index].bookingID}",
                                  style: TextStyle(fontFamily: 'helvetica'),
                                ),
                                Text("\₹${bookingLists[index].price}",
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
                              Text("Total Booking Amount",
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
                              Text("$totalBookingAmount",
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
                              Text("Total GST (include)",
                                  style: TextStyle(
                                    fontFamily: 'helvetica',
                                  )),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.info_outline_rounded,
                                color: bluegradientstartColor,
                                size: 18,
                              )
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("$totalGST",
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
                              Text("CLOREV Share",
                                  style: TextStyle(
                                    fontFamily: 'helvetica',
                                  )),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.info_outline_rounded,
                                color: bluegradientstartColor,
                                size: 18,
                              )
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("$clorevShare",
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
                              Text("GST on CLOREV Share",
                                  style: TextStyle(
                                    fontFamily: 'helvetica',
                                  )),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.info_outline_rounded,
                                color: bluegradientstartColor,
                                size: 18,
                              )
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("$gstOnClorevShare",
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
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  width: screenSize.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Net Payable Amount",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'helvetica',
                                  )),
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("$netPayableAmount",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'helvetica',
                                  )),
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
