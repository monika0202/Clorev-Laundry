import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';

class PickUpDelivery extends StatelessWidget {
  final bool isSelected;
  final String title;
  final double size;
  final String subtitle;
  final AssetImage icon;
  final VoidCallback onPress;

  const PickUpDelivery({
    Key? key,
    this.isSelected = false,
    this.title = "test",
    this.subtitle = "subtest",
    required this.icon,
    required this.onPress,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
        height: 60,
        width: 150,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            gradient: isSelected
                ? LinearGradient(
                    colors: [bluegradientstartColor, bluegradientendColor],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  )
                : null,
            border: isSelected
                ? null
                : Border.all(color: bluegradientstartColor, width: 2),
            color: whiteColor,
            borderRadius: BorderRadius.circular(10)),
        child: GestureDetector(
            onTap: onPress,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isSelected
                    ? ImageIcon(
                        icon,
                        color: whiteColor,
                        size: size,
                      )
                    : GradientIcon(
                        child: ImageIcon(
                        icon,
                        size: size,
                      )),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientText(
                      textSize: 16,
                      title: title,
                      iswhiteColor: isSelected,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GradientText(
                      title: subtitle,
                      isbold: false,
                      iswhiteColor: isSelected,
                    ),
                  ],
                )
              ],
            )));
  }
}
