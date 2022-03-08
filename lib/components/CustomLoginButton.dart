import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';

class LoginButtons extends StatelessWidget {
  final String title;
  final bool isDisable;
  final bool isrounded;
  final double height;
  final double fontSize;
  final VoidCallback onpress;
  final IconData? icon;
  final bool isLoginButton;
  final double width;
  bool isShadow;
  LoginButtons({
    Key? key,
    this.title = "test",
    this.height = 45,
    this.isrounded = false,
    required this.isDisable,
    this.fontSize = 17,
    required this.onpress,
    this.isShadow = false,
    this.width = 40,
    this.icon,
    required this.isLoginButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: isShadow ? 15 : 0,
      child: Container(
        height: height,
        width: width,
        // padding: EdgeInsets.only(left: 15, right: 15),
        // margin: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [bluegradientstartColor, bluegradientendColor],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
          boxShadow: isShadow
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, -3),
                  )
                ]
              : [],
          borderRadius: isrounded
              ? BorderRadius.circular(24.5)
              : BorderRadius.circular(10),
        ),
        child: GestureDetector(
          onTap: onpress,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: isDisable ? Colors.white.withOpacity(0.4) : null,
              borderRadius: isrounded
                  ? BorderRadius.circular(24.5)
                  : BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: isDisable
                          ? Colors.white.withOpacity(0.8)
                          : whiteColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'helvetica',
                      fontSize: fontSize),
                ),
                Visibility(
                    visible: isLoginButton,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          icon,
                          color: isDisable
                              ? Colors.white.withOpacity(0.8)
                              : whiteColor,
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
