import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'CustomAlertBox.dart';

class CustomSavedCard extends StatelessWidget {
  final String name;
  final String bankName;
  final String cardNo;
  final String expDate;
  final IconData? icon;
  final List<bool> isSelected;
  final VoidCallback onPressRemove;
  final VoidCallback onPressEdit;

  const CustomSavedCard(
      {Key? key,
      required this.name,
      required this.bankName,
      required this.cardNo,
      required this.expDate,
      required this.isSelected,
      required this.onPressEdit,
      required this.onPressRemove,
      this.icon})
      : super(key: key);

  _onAlertButtonsPressed(
    context,
    VoidCallback onPressRemove,
  ) {
    Alert(
      context: context,
      //type: AlertType.warning,
      image: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: GradientIcon(
            child: FaIcon(FontAwesomeIcons.exclamationTriangle, size: 50)),
      ),
      //  title: "RFLUTTER ALERT",
      desc: "Are you sure want to remove this card ?",
      style: AlertStyle(
          animationType: AnimationType.grow,
          isCloseButton: false,
          descStyle: TextStyle(fontFamily: 'helvetica', fontSize: 17)),
      buttons: [
        DialogButton(
          child: Text(
            "REMOVE",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'helvetica',
            ),
          ),
          onPressed: onPressRemove,
          color: Colors.grey[400],
        ),
        DialogButton(
          child: Text(
            "KEEP",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'helvetica',
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          gradient: containerGradient,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
        child: Column(children: [
      Container(
        height: 180,
        width: screenSize.width,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          color: Colors.white,
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
              bluegradientstartColor,
              whiteColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Icon(Icons.access_alarm),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$bankName",
                          style: TextStyle(
                              fontSize: 16,
                              color: darkGreyColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'helvetica'),
                        ),
                        Icon(Icons.wifi),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Text(
              "$cardNo",
              style: TextStyle(
                  fontSize: 16,
                  color: darkGreyColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'helvetica'),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "VALID THRU",
                  style: TextStyle(fontFamily: 'helvetica'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "$expDate",
                  style: TextStyle(
                      fontSize: 16,
                      color: darkGreyColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'helvetica'),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "$name",
                  style: TextStyle(
                      fontSize: 16,
                      color: darkGreyColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'helvetica'),
                ),
                Icon(Icons.alarm_add_outlined)
              ],
            )
          ],
        ),
      ),
      Container(
        height: 40,
        width: screenSize.width,
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: InkWell(
                  child: Text(
                "Edit",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontFamily: 'helvetica'),
              )),
              onTap: onPressEdit,
            ),
            InkWell(
                child: Text(
                  "Remove",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: 'helvetica'),
                ),
                onTap: onPressRemove)
          ],
        ),
      )
    ]));
  }
}
