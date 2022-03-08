import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';

class CustomBottomBarButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final bool isShadow;
  final bool isIcon;
  bool isDisable;
  final IconData? icon;
  final VoidCallback onpress;
  CustomBottomBarButton({
    Key? key,
    this.title = "test",
    this.width = 150,
    this.height = 45,
    required this.isDisable,
    this.isIcon = false,
    this.isShadow = true,
    this.icon,
    required this.onpress,
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
        margin: EdgeInsets.only(left: 15, right: 15),
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
          borderRadius: BorderRadius.circular(10),
        ),
        child: GestureDetector(
          onTap: onpress,
          child: Container(
            decoration: BoxDecoration(
              color: isDisable ? Colors.white.withOpacity(0.4) : null,
              borderRadius: BorderRadius.circular(10),
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
                      fontSize: 17),
                ),
                Visibility(
                  visible: isIcon,
                  child: Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          icon,
                          size: 30,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
