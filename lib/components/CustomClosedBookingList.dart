import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomLoginButton.dart';
import 'package:flutter_test_app/components/GradientButton.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';

class CustomClosedBookingList extends StatelessWidget {
  final String bookingID;
  final String date;
  final String status;

  final String serviceProviderID;
  final String items;
  final String deliveredDate;
  final double rate;
  bool isRate;

  final VoidCallback onpressShowDetails;
  final void Function()? onpressRateService;

  CustomClosedBookingList(
      {Key? key,
      required this.bookingID,
      required this.date,
      required this.status,
      required this.deliveredDate,
      required this.items,
      required this.rate,
      required this.isRate,
      required this.serviceProviderID,
      required this.onpressShowDetails,
      this.onpressRateService})
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: screenSize.width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [bluegradientstartColor, bluegradientendColor],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Booking ID : ",
                          style: TextStyle(
                            color: darkGreyColor,
                            fontFamily: 'helvetica',
                          ),
                          children: [
                        TextSpan(
                            text: "$bookingID",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: darkGreyColor,
                                fontFamily: 'helvetica')),
                      ])),
                  RichText(
                      text: TextSpan(
                          text: "dtd ",
                          style: TextStyle(
                            color: darkGreyColor,
                            fontFamily: 'helvetica',
                          ),
                          children: [
                        TextSpan(
                            text: "$date",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: darkGreyColor,
                                fontFamily: 'helvetica')),
                      ]))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screenSize.width / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Laundry - 2 items",
                            style: TextStyle(fontFamily: 'helvetica')),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Dry-Cleaning - 1 items",
                            style: TextStyle(fontFamily: 'helvetica')),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1,
                          color: bluegradientstartColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Delivered on $deliveredDate",
                            style: TextStyle(fontFamily: 'helvetica')),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("$serviceProviderID",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'helvetica')),
                        SizedBox(
                          height: 10,
                        ),
                        Text("$status",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: 'helvetica')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                    child: InkWell(
                      child: GradientText(
                        title: "Show Detail",
                        isUnderline: true,
                      ),
                      onTap: onpressShowDetails,
                    ),
                  ),
                  isRate
                      ? Padding(
                          padding: EdgeInsets.only(right: 10, bottom: 10),
                          child: LoginButtons(
                              height: 30,
                              isLoginButton: false,
                              isDisable: false,
                              fontSize: 14,
                              onpress: onpressRateService!,
                              title: "Rate Service",
                              width: 105),
                        )
                      : Padding(
                          padding:
                              EdgeInsets.only(top: 10, right: 10, bottom: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("You rated",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'helvetica')),
                                SizedBox(
                                  width: 5,
                                ),
                                GradientText(title: "${rate.toInt()}"),
                                GradientIcon(
                                  child: Icon(
                                    Icons.star,
                                    size: 17,
                                  ),
                                ),
                              ]),
                        )
                ],
              ),
            )
          ],
        ));
  }
}
