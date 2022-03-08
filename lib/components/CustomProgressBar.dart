import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/BorderIcon.dart';
import 'package:flutter_test_app/components/DotWidget.dart';

class CustomProgressBar extends StatelessWidget {
  final String pickupDate;
  final String underProcessDate;
  final String beingPackagedDate;
  final String deliveredDate;
  bool pickupCompelete;
  bool underProcessComplete;
  bool beingPackageComplete;
  bool deliveredComplete;
  bool isHomeScreen;
  CustomProgressBar({
    Key? key,
    required this.pickupDate,
    required this.underProcessDate,
    required this.beingPackagedDate,
    required this.deliveredDate,
    this.pickupCompelete = false,
    this.underProcessComplete = false,
    this.beingPackageComplete = false,
    this.deliveredComplete = false,
    this.isHomeScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
        // height: 122,
        margin: EdgeInsets.only(left: 15, right: 15),
        width: screenSize.width,
        padding: EdgeInsets.all(10),
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
            borderRadius: isHomeScreen
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))
                : BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Container(
              width: screenSize.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$pickupDate",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'helvetica',
                    ),
                  ),
                  //SizedBox(width: MediaQuery.of(context).size.width / 9),
                  Text(
                    "$underProcessDate",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'helvetica',
                    ),
                  ),
                  // SizedBox(width: MediaQuery.of(context).size.width / 9),
                  Text(
                    "$beingPackagedDate",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'helvetica',
                    ),
                  ),
                  // SizedBox(width: MediaQuery.of(context).size.width / 8),
                  Text(
                    "$deliveredDate",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'helvetica',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: screenSize.width,
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BorderIcon(
                        isCompleted: pickupCompelete,
                        onPress: () {},
                        iconData: Icons.shopping_cart_outlined),
                    pickupCompelete
                        ? Container(
                            width: MediaQuery.of(context).size.width / 6,
                            child: Divider(
                              thickness: 2,
                              color: bluegradientstartColor,
                            ),
                          )
                        : DotWidget(
                            dashColor: bluegradientstartColor,
                            dashWidth: 6,
                            totalWidth: MediaQuery.of(context).size.width / 6,
                          ),
                    BorderIcon(
                        isCompleted: underProcessComplete,
                        onPress: () {},
                        iconData: Icons.shopping_cart_outlined),
                    underProcessComplete
                        ? Container(
                            width: MediaQuery.of(context).size.width / 6,
                            child: Divider(
                              thickness: 2,
                              color: bluegradientstartColor,
                            ),
                          )
                        : DotWidget(
                            dashColor: bluegradientstartColor,
                            dashWidth: 6,
                            totalWidth: MediaQuery.of(context).size.width / 6,
                          ),
                    BorderIcon(
                        isCompleted: beingPackageComplete,
                        onPress: () {},
                        iconData: Icons.shopping_cart_outlined),
                    beingPackageComplete
                        ? Container(
                            width: MediaQuery.of(context).size.width / 6,
                            child: Divider(
                              thickness: 6,
                              color: bluegradientstartColor,
                            ),
                          )
                        : DotWidget(
                            dashColor: bluegradientstartColor,
                            dashWidth: 6,
                            totalWidth: MediaQuery.of(context).size.width / 6,
                          ),
                    BorderIcon(
                        isCompleted: deliveredComplete,
                        onPress: () {},
                        iconData: Icons.shopping_cart_outlined),
                  ],
                ),
              ),
            ),
            Container(
              width: screenSize.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Picked-Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'helvetica',
                    ),
                  ),
                  //SizedBox(width: MediaQuery.of(context).size.width / 12),
                  Text(
                    "Under\nProcess",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'helvetica',
                    ),
                  ),
                  //SizedBox(width: MediaQuery.of(context).size.width / 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Being\nPackaged",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'helvetica',
                      ),
                    ),
                  ),
                  // SizedBox(width: MediaQuery.of(context).size.width / 12),
                  Text(
                    "Delivered",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'helvetica',
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
