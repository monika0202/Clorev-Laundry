import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    required this.screenSize,
    required this.onpress,
    this.isDisable = false,
    this.price = "0000",
    this.quantity = "0",
  }) : super(key: key);

  final Size screenSize;
  bool isDisable;
  final VoidCallback onpress;
  final String price, quantity;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 15,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [bluegradientstartColor, bluegradientendColor],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, -3),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          height: 50,
          decoration: BoxDecoration(
            color: isDisable ? Colors.white.withOpacity(0.4) : null,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$quantity \(Items\) | \u{20B9}$price",
                style: TextStyle(
                  color: isDisable ? Colors.white.withOpacity(0.8) : whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  //fontFamily: 'helvetica'
                ),
              ),
              // SizedBox(
              //   width: screenSize.width / 4,
              // ),
              GestureDetector(
                onTap: onpress,
                child: Text(
                  "ADD TO CART",
                  style: TextStyle(
                      color: isDisable
                          ? Colors.white.withOpacity(0.8)
                          : whiteColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'helvetica',
                      fontSize: 17),
                ),
              ),
              // SizedBox(width: 5)
            ],
          ),
        ),
      ),
    );
  }
}
