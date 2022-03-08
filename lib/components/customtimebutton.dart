import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/GradientText.dart';

class DateTimeButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final String subtitle;

  final double width;
  final double height;
  final bool isSelected;
  final bool isSubtitled;
  final bool isbold;
  final bool isBorderCircular;
  final bool isShadow;
  final bool isDisable;
  final double textsize;
  const DateTimeButton({
    Key? key,
    required this.onPress,
    required this.title,
    this.subtitle = "test",
    this.isSelected = false,
    this.isbold = true,
    this.isShadow = true,
    this.isBorderCircular = true,
    required this.width,
    this.isDisable = false,
    this.isSubtitled = false,
    this.height = 40,
    this.textsize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          isShadow
              ? BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                )
              : BoxShadow(color: Colors.transparent),
        ],
        gradient: LinearGradient(
          colors: [bluegradientstartColor, bluegradientendColor],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: isBorderCircular
            ? BorderRadius.circular(20)
            : BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: onPress,
        child: Material(
          //elevation: 5,

          color: Colors.transparent,
          borderRadius: isBorderCircular
              ? BorderRadius.circular(20)
              : BorderRadius.circular(10),
          child: Container(
            height: 10,
            width: 90,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: whiteColor,
                gradient: isSelected ? containerGradient : null,
                border: isSelected
                    ? null
                    : Border.all(color: bluegradientstartColor, width: 2),
                borderRadius: isBorderCircular
                    ? BorderRadius.circular(20)
                    : BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GradientText(
                  textSize: textsize,
                  title: title,
                  iswhiteColor: isSelected,
                  isbold: isbold,
                  isDisable: isDisable,
                ),
                Visibility(
                  visible: isSubtitled,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      GradientText(
                        isbold: false,
                        title: subtitle,
                        iswhiteColor: isSelected,
                        isDisable: isDisable,
                      ),
                    ],
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
