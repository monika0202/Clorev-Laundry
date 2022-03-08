import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';

class ReviewDetail extends StatelessWidget {
  final String reviewDetail;
  final String name;
  final String CRBno;
  final int rating;
  final double height;
  final String reply;
  final bool viewReply;
  final VoidCallback onPress;
  final bool isReviewPage;
  ReviewDetail({
    Key? key,
    required this.reviewDetail,
    required this.name,
    required this.CRBno,
    required this.rating,
    required this.height,
    this.viewReply = false,
    required this.onPress,
    this.isReviewPage = false,
    this.reply = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      padding: EdgeInsets.all(10),
      width: screenSize.width,
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
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            width: screenSize.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      isReviewPage
                          ? Icon(
                              Icons.local_laundry_service_rounded,
                              size: 45,
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 25,
                            ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,
                              style: TextStyle(
                                  fontFamily: 'helvetica',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          SizedBox(
                            height: 5,
                          ),
                          Text("($CRBno)",
                              style: TextStyle(
                                fontFamily: 'helvetica',
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 35,
                  //width: 35,
                  padding: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [bluegradientstartColor, bluegradientendColor],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("$rating",
                          style: TextStyle(
                            fontFamily: 'helvetica',
                          )),
                      Padding(
                        padding: EdgeInsets.only(bottom: 3),
                        child: Icon(
                          Icons.star_rate_rounded,
                          size: 17,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: screenSize.width,
            child: Column(
              children: [
                Text(reviewDetail,
                    maxLines: 4,
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'helvetica',
                    )),
                Row(
                  children: [
                    GradientIcon(
                        child: Icon(
                      viewReply
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down_rounded,
                      size: 15,
                    )),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      child: GradientText(
                        title: viewReply ? "Read less" : "Read more",
                        isbold: false,
                      ),
                      onTap: onPress,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
            visible: viewReply,
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      bluegradientstartColor.withOpacity(0.6),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Text("Service Provider Reply: $reply",
                  maxLines: 4,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'helvetica',
                  )),
            ),
          )
        ],
      ),
    );
  }
}
