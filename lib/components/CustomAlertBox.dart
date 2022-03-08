import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';
import 'package:flutter_test_app/screens/paymentPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class CustomAlertBox extends StatelessWidget {
  String description;
  String removeTitle;
  String keepTitle;
  final VoidCallback onPressRemove;
  final VoidCallback onPressKeep;

  CustomAlertBox({
    Key? key,
    required this.description,
    required this.keepTitle,
    required this.removeTitle,
    required this.onPressRemove,
    required this.onPressKeep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      // height: MediaQuery.of(context).size.height / 9,
      margin: EdgeInsets.only(left: 0, right: 0),
      width: screenSize.width,
      child: AlertDialog(
        //shape: CircularRecte,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        titlePadding: EdgeInsets.only(top: 15, bottom: 20),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientIcon(
                child: FaIcon(FontAwesomeIcons.exclamationTriangle, size: 50)),
          ],
        ),

        contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
        content: Container(
          child: Text(description,
              textAlign: TextAlign.center,
              maxLines: 5,
              style: TextStyle(fontFamily: 'helvetica', fontSize: 16)),
        ),
        actionsPadding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: <Widget>[
          Container(
            width: screenSize.width,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: onPressRemove,
                    child: Container(
                        alignment: Alignment.center,
                        height: 35,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(
                              color: bluegradientstartColor, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: GradientText(
                          title: removeTitle,
                          textSize: 17,
                          isbold: true,
                        )),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: onPressKeep,
                    child: Container(
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient: containerGradient,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          keepTitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'helvetica',
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
