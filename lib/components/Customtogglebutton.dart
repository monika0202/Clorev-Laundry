import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/GradientButton.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CusttomToggleButton extends StatelessWidget {
  final VoidCallback onPress;
  final bool lowtoHigh;

  const CusttomToggleButton({
    Key? key,
    required this.onPress,
    required this.lowtoHigh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 240,
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3))
        ],
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: bluegradientstartColor, width: 1),
      ),
      child: InkWell(
          onTap: onPress,
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              lowtoHigh == false
                  ? Container(
                      margin: EdgeInsets.only(
                        bottom: 5,
                        left: 5,
                        top: 5,
                      ),
                      height: 45,
                      width: 110,
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
                          colors: [
                            bluegradientstartColor,
                            bluegradientendColor
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                        borderRadius: BorderRadius.circular(22.5),
                      ),
                      child: Material(
                          //elevation: 5,

                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(22.5),
                          child: Container(
                            height: 10,
                            width: 90,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    bluegradientstartColor,
                                    bluegradientendColor
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                ),
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(22.5)),
                            child: GradientText(
                              title: "Sort by Price",
                              iswhiteColor: true,
                            ),
                          )))
                  : Container(
                      margin: EdgeInsets.only(
                        bottom: 5,
                        left: 5,
                        top: 5,
                      ),
                      height: 45,
                      width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.5),
                      ),
                      child: Material(
                          //elevation: 5,

                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(22.5),
                          child: Container(
                            height: 10,
                            width: 90,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(22.5)),
                            child: GradientText(
                              title: "Low to High",
                              iswhiteColor: false,
                              isbold: true,
                            ),
                          ))),
              lowtoHigh == true
                  ? Container(
                      margin: EdgeInsets.only(
                        bottom: 5,
                        right: 5,
                        top: 5,
                      ),
                      height: 45,
                      width: 110,
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
                          colors: [
                            bluegradientstartColor,
                            bluegradientendColor
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                        borderRadius: BorderRadius.circular(22.5),
                      ),
                      child: Material(
                          //elevation: 5,

                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(22.5),
                          child: Container(
                            height: 10,
                            width: 90,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    bluegradientstartColor,
                                    bluegradientendColor
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                ),
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(22.5)),
                            child: GradientText(
                              title: "Sort by Price",
                              iswhiteColor: true,
                            ),
                          )))
                  : Container(
                      margin: EdgeInsets.only(
                        bottom: 5,
                        right: 5,
                        top: 5,
                      ),
                      height: 45,
                      width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.5),
                      ),
                      child: Material(
                          //elevation: 5,

                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(22.5),
                          child: Container(
                            height: 10,
                            width: 90,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(22.5)),
                            child: GradientText(
                              title: "High to Low",
                              iswhiteColor: false,
                              isbold: true,
                            ),
                          ))),
            ],
          ))),
    );
  }
}
