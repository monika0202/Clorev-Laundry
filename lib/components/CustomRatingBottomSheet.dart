import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';

class CustomRatingBottomSheet extends StatelessWidget {
  final String CRLNo;
  final Function(double) onRatingUpdate;
  final VoidCallback onPressSubmit;
  const CustomRatingBottomSheet(
      {Key? key,
      required this.CRLNo,
      required this.onRatingUpdate,
      required this.onPressSubmit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
        height: 320,
        child: Stack(
          children: [
            Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                height: 40,
                //width: screenSize.width / 1.5,
                margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [bluegradientstartColor, bluegradientendColor],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$CRLNo",
                      style: TextStyle(
                          color: darkGreyColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'helvetica'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 300,
                child: Column(children: [
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    itemBuilder: (context, _) =>
                        GradientIcon(child: Icon(Icons.star)),
                    onRatingUpdate: onRatingUpdate,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 10, right: 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Horrible",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'helvetica',
                                    color: Colors.grey[500])),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                "Bad",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'helvetica',
                                    color: Colors.grey[500]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text("Average",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'helvetica',
                                      color: Colors.grey[500])),
                            ),
                            Text("Good",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'helvetica',
                                    color: Colors.grey[500])),
                            Text("Excellent",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'helvetica',
                                    color: Colors.grey[500])),
                          ]))
                ]),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                padding: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: bluegradientstartColor, width: 1)),
                child: Container(
                  child: TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: Colors.grey[500], fontFamily: 'helvetica'),
                        contentPadding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        hintText:
                            "Your feedback is valuable to us, write your review here.... "),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ]),
            Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: CustomBottomBarButton(
                  width: screenSize.width,
                  isDisable: false,
                  onpress: onPressSubmit,
                  title: "SUBMIT YOUR FEEDBACK",
                  isShadow: false,
                ))
          ],
        ));
  }
}
