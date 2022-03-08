import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';

class CustomListTitle extends StatelessWidget {
  final String title;
  final String? deliveryType;
  final String? time;
  final int? price;
  bool isrounded;
  bool isServiceProvider;
  bool isdeliveryPartner;
  double height;
  CustomListTitle({
    Key? key,
    required this.title,
    this.price,
    this.isrounded = false,
    this.time,
    this.height = 30,
    this.deliveryType,
    this.isdeliveryPartner = false,
    this.isServiceProvider = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      //width: screenSize.width / 1.5,
      padding: EdgeInsets.only(left: 10, right: 10),

      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [bluegradientstartColor, bluegradientendColor],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft),
        borderRadius: isrounded
            ? BorderRadius.all(Radius.circular(8))
            : BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: !isServiceProvider,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$title",
                  style: TextStyle(
                      color: darkGreyColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'helvetica'),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\₹",
                      style: TextStyle(
                          color: darkGreyColor, fontFamily: 'helvetica'),
                    ),
                    Text(
                      "${price}",
                      style: TextStyle(
                          color: darkGreyColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'helvetica'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
            visible: isServiceProvider,
            child: Container(
              margin: EdgeInsets.only(bottom: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$title",
                    style: TextStyle(
                        color: darkGreyColor,
                        decoration: TextDecoration.underline,
                        fontFamily: 'helvetica'),
                  ),
                  Text(
                    "${deliveryType}",
                    style: TextStyle(
                        color: darkGreyColor,
                        decoration: TextDecoration.underline,
                        fontFamily: 'helvetica'),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: isServiceProvider && time != null,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\₹",
                        style: TextStyle(
                            color: darkGreyColor, fontFamily: 'helvetica'),
                      ),
                      Text(
                        "${price}",
                        style: TextStyle(
                            color: darkGreyColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'helvetica'),
                      ),
                    ],
                  ),
                  Text(
                    "$time",
                    style: TextStyle(
                        color: darkGreyColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'helvetica'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
