import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/modals/ClosedBookingsServiceProviderModel.dart';

class CustomServiceProviderClosedBookings extends StatelessWidget {
  final String bookingID;
  final String time;
  final int totalItems;
  final double totalPrice;
  final List<ListItem> listItems;
  const CustomServiceProviderClosedBookings(
      {Key? key,
      required this.bookingID,
      required this.time,
      required this.listItems,
      required this.totalItems,
      required this.totalPrice})
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
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                              text: "$time",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: darkGreyColor,
                                  fontFamily: 'helvetica')),
                        ]))
                  ])),
          Container(
            padding: EdgeInsets.all(10),
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Container(
                      width: screenSize.width,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${listItems[index].type}",
                              style: TextStyle(
                                fontFamily: 'helvetica',
                              ),
                            ),
                            RichText(
                                text: TextSpan(
                                    text: "Delivered on ",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontFamily: 'helvetica',
                                    ),
                                    children: [
                                  TextSpan(
                                      text: "${listItems[index].date}",
                                      style: TextStyle(
                                          color: blackColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'helvetica'))
                                ]))
                          ]));
                }),
                separatorBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    height: 1,
                    width: screenSize.width,
                    color: bluegradientstartColor,
                  );
                },
                itemCount: listItems.length),
          ),
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
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(
                        text: "Items: ",
                        style: TextStyle(
                          color: darkGreyColor,
                          fontFamily: 'helvetica',
                        ),
                        children: [
                      TextSpan(
                          text: "$totalItems",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: darkGreyColor,
                              fontFamily: 'helvetica')),
                    ])),
                RichText(
                    text: TextSpan(
                        text: "Booking Value: \₹",
                        style: TextStyle(
                          color: darkGreyColor,
                          fontFamily: 'helvetica',
                        ),
                        children: [
                      TextSpan(
                          text: "$totalPrice",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: darkGreyColor,
                              fontFamily: 'helvetica')),
                    ]))
              ],
            ),
          )
        ]));
  }
}
