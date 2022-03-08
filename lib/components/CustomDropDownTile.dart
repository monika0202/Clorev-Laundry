import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';

class CustomDropdownwithTitle extends StatelessWidget {
  const CustomDropdownwithTitle({
    Key? key,
    required this.screenSize,
    required this.title,
    required this.onPress,
    this.icon = Icons.arrow_right_rounded,
  }) : super(key: key);
  final VoidCallback onPress;
  final Size screenSize;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 30,
        margin: EdgeInsets.only(left: 20, right: 20),
        // width: screenSize.width / 1.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: containerGradient),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "   $title",
              style: TextStyle(
                  color: darkGreyColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'helvetica'),
            ),
            Icon(
              icon,
              color: darkGreyColor,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
