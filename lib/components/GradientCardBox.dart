import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';

class GradientCardBox extends StatelessWidget {
  const GradientCardBox({
    Key? key,
    this.isSelected = false,
    this.ishomeScreen = false,
    this.title = "test",
    required this.onPress,
  }) : super(key: key);
  final bool isSelected;
  final bool ishomeScreen;
  final String title;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ishomeScreen
            ? Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        left: 1.5,
                        top: 1.5,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 3.0,
                            sigmaY: 3.0,
                          ),
                          child: Icon(
                            Icons.local_laundry_service_rounded,
                            size: 50,
                            color: Colors.black38.withOpacity(0.7),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.local_laundry_service_rounded,
                        size: 50,
                        color: whiteColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GradientText(
                    title: title,
                    iswhiteColor: ishomeScreen,
                  ),
                ],
              )
            : Container(
                width: 85,
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: onPress,
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              gradient: isSelected
                                  ? LinearGradient(
                                      colors: [
                                        bluegradientstartColor,
                                        bluegradientendColor
                                      ],
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                    )
                                  : null,
                              border: isSelected
                                  ? null
                                  : Border.all(
                                      color: bluegradientstartColor, width: 2),
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: isSelected
                              ? Icon(
                                  Icons.local_laundry_service_rounded,
                                  size: 50,
                                  color: whiteColor,
                                )
                              : GradientIcon(
                                  child: Icon(
                                    Icons.local_laundry_service_rounded,
                                    size: 50,
                                  ),
                                ),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    GradientText(
                      title: title,
                      textSize: 13,
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
