import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomAlertBox.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CustomMyAddress extends StatelessWidget {
  final String flat_no, location, landmark, tag_address;
  final bool isdefault;
  final VoidCallback onPressDefault;
  final VoidCallback onPressEdit;
  final VoidCallback onPressRemove;
  const CustomMyAddress({
    Key? key,
    this.flat_no = "",
    this.location = "",
    this.landmark = "",
    this.tag_address = "",
    this.isdefault = false,
    required this.onPressRemove,
    required this.onPressEdit,
    required this.onPressDefault,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ], color: whiteColor, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Container(
                // margin: EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // height: 70,
                      width: screenSize.width - 110,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            flat_no,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Helvetica',
                              fontSize: 14,
                            ),
                          ),
                          Text(location,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Helvetica',
                                fontSize: 14,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      height: 15,
                      width: 45,
                      // padding: EdgeInsets.only(left: 15, right: 15),
                      // margin: EdgeInsets.only(left: 15, right: 15),
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
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        width: screenSize.width / 4,
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Text(
                            tag_address,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: blackColor,
                                fontFamily: 'helvetica',
                                fontSize: 14),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Landmark: $landmark",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Helvetica',
                        fontSize: 14,
                      )),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                // padding: EdgeInsets.only(left: 5, right: 5),
                width: screenSize.width,
                height: 1,
                color: bluegradientstartColor,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Text(
                        "Edit",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontFamily: 'helvetica',
                            fontSize: 14),
                      ),
                      onTap: onPressEdit,
                    ),
                    Container(
                      height: 30,
                      width: 1,
                      //padding: EdgeInsets.only(left: 15, right: 15),
                      color: bluegradientstartColor,
                    ),
                    isdefault
                        ? GradientText(title: "Default")
                        : InkWell(
                            child: Text(
                              "Set as Default",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontFamily: 'helvetica',
                                  fontSize: 14),
                            ),
                            onTap: onPressDefault,
                          ),
                    Container(
                      height: 30,
                      width: 1,
                      //padding: EdgeInsets.only(left: 15, right: 15),
                      color: bluegradientstartColor,
                    ),
                    InkWell(
                        child: Text(
                          "Remove",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontFamily: 'helvetica',
                              fontSize: 14),
                        ),
                        onTap: onPressRemove),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
