import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/GradientText.dart';

class CustomAddressTimeContainer extends StatelessWidget {
  final String locality;
  final String flatno;
  final String pickupTime;

  final String deliveryTime;
  final VoidCallback? onCancelBookingPress;
  final VoidCallback? onDownloadPress;
  final VoidCallback onNeedHelpPress;
  bool isbookingdetail;
  CustomAddressTimeContainer(
      {Key? key,
      required this.locality,
      required this.flatno,
      required this.pickupTime,
      this.onCancelBookingPress,
      this.isbookingdetail = false,
      required this.onNeedHelpPress,
      this.onDownloadPress,
      required this.deliveryTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
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
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            flatno,
            style: TextStyle(
              fontFamily: 'helvetica',
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            locality,
            style: TextStyle(
              fontFamily: 'helvetica',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isbookingdetail ? "Picked-up on" : "Pickup Slot",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'helvetica',
                ),
              ),
              Text(
                pickupTime,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'helvetica',
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isbookingdetail ? "Delivered on" : "Delivery Slot",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'helvetica',
                ),
              ),
              Text(
                deliveryTime,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'helvetica',
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // padding: EdgeInsets.only(left: 5, right: 5),
            width: screenSize.width,
            height: 1,
            color: bluegradientstartColor,
          ),
          Container(
            width: screenSize.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                isbookingdetail
                    ? InkWell(
                        child: GradientText(
                          title: "Download Invoice",
                          isUnderline: true,
                        ),
                        onTap: onDownloadPress,
                      )
                    : InkWell(
                        child: Text(
                          "Cancel Booking",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: 'helvetica',
                          ),
                        ),
                        onTap: onCancelBookingPress,
                      ),
                Container(
                  height: 30,
                  width: 1,
                  //padding: EdgeInsets.only(left: 15, right: 15),
                  color: bluegradientstartColor,
                ),
                InkWell(
                  child: Row(
                    children: [
                      GradientText(
                        title: "Need Help",
                        isUnderline: true,
                      ),
                      GradientText(
                        title: " ?",
                      ),
                    ],
                  ),
                  onTap: onNeedHelpPress,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
