import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/GradientText.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    required this.onPress,
    required this.title,
    this.isSelected = false,
    this.isbold = true,
    this.isBorderCircular = true,
    this.icon,
    required this.width,
  }) : super(key: key);
  final VoidCallback onPress;
  final String title;
  final double width;
  final bool isSelected;
  final bool isbold;
  final IconData? icon;
  final bool isBorderCircular;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        gradient: LinearGradient(
          colors: [bluegradientstartColor, bluegradientendColor],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(17.5),
      ),
      child: GestureDetector(
        onTap: onPress,
        child: Material(
          //elevation: 5,

          color: Colors.transparent,
          borderRadius: isBorderCircular
              ? BorderRadius.circular(17.5)
              : BorderRadius.circular(8),
          child: Container(
            height: 10,
            width: 90,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: whiteColor,
                gradient: isSelected ? containerGradient : null,
                border: isSelected
                    ? null
                    : Border.all(color: bluegradientstartColor, width: 1),
                borderRadius: isBorderCircular
                    ? BorderRadius.circular(17.5)
                    : BorderRadius.circular(8)),
            child: GradientText(
              title: title,
              iswhiteColor: isSelected,
              isbold: isbold,
            ),
          ),
        ),
      ),
    );
  }
}
