import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';

class CustomPriceDetail extends StatelessWidget {
  final String cartValue;
  final String gstValue;
  final String DeliveryCharges;
  final String halfpayment;
  final String halfamount;
  final String otherhalfamount;
  final String otherhalfpayemnt;

  const CustomPriceDetail(
      {Key? key,
      required this.DeliveryCharges,
      required this.cartValue,
      required this.gstValue,
      required this.halfpayment,
      required this.halfamount,
      required this.otherhalfamount,
      required this.otherhalfpayemnt})
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "PRICE DETAILS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: darkGreyColor,
                      fontFamily: 'helvetica',
                    ),
                  )
                ],
              ),
            ),
            Container(
              //height: 110,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Row(
                          children: [
                            Text(
                              "Cart Value",
                              style: TextStyle(fontFamily: 'helvetica'),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                                child: Icon(
                                  Icons.info_outline_rounded,
                                  color: bluegradientstartColor,
                                  size: 17,
                                ),
                                onTap: () {})
                          ],
                        )),
                        Text("\₹$cartValue",
                            style: TextStyle(fontFamily: 'helvetica')),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Row(
                          children: [
                            Text(
                              "GST (Included)",
                              style: TextStyle(fontFamily: 'helvetica'),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.info_outline_rounded,
                              color: bluegradientstartColor,
                              size: 17,
                            ),
                          ],
                        )),
                        Text("\₹$gstValue",
                            style: TextStyle(fontFamily: 'helvetica')),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Row(
                          children: [
                            Text(
                              "Delivery Charges",
                              style: TextStyle(fontFamily: 'helvetica'),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.info_outline_rounded,
                              color: bluegradientstartColor,
                              size: 17,
                            ),
                          ],
                        )),
                        Text("$DeliveryCharges",
                            style: TextStyle(fontFamily: 'helvetica')),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    //padding: EdgeInsets.only(left: 10, right: 10),
                    child: Divider(
                      height: 1,
                      color: bluegradientstartColor,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Row(
                          children: [
                            Text(
                              "$halfpayment",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'helvetica'),
                            ),
                          ],
                        )),
                        Text("\₹$halfamount",
                            style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontFamily: 'helvetica')),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    //padding: EdgeInsets.only(left: 10, right: 10),
                    child: Divider(
                      height: 2,
                      color: bluegradientstartColor,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Row(
                          children: [
                            Text(
                              "$otherhalfpayemnt",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'helvetica'),
                            ),
                          ],
                        )),
                        Text("\₹$otherhalfamount",
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontFamily: 'helvetica')),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
