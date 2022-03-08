import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CustomRatingBox extends StatelessWidget {
  final double fivestar;
  final double fourstar;
  final double threestar;
  final double twostar;
  final double onestar;
  final double height;
  final String name;

  final double totalRating;
  final int totalRatingNo;
  final int totalReviewsNo;

  const CustomRatingBox({
    Key? key,
    required this.name,
    required this.fivestar,
    required this.fourstar,
    required this.threestar,
    required this.twostar,
    required this.onestar,
    required this.totalRating,
    required this.totalRatingNo,
    required this.totalReviewsNo,
    this.height = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: height,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 130,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$name",
                    style: TextStyle(
                      fontFamily: 'helvetica',
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$totalRating",
                        style: TextStyle(
                            fontFamily: 'helvetica',
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                    Icon(
                      Icons.star_rate_rounded,
                      size: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text("($totalRatingNo Ratings)",
                    style: TextStyle(
                      fontFamily: 'helvetica',
                    )),
                SizedBox(
                  height: 3,
                ),
                Text("($totalReviewsNo Reviews)",
                    style: TextStyle(
                      fontFamily: 'helvetica',
                    ))
              ],
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 0),
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
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("5", style: TextStyle(fontFamily: 'helvetica')),
                          Icon(
                            Icons.star_rate_rounded,
                            size: 17,
                          )
                        ],
                      ),
                      Container(
                        child: LinearPercentIndicator(
                          width: screenSize.width - 265,
                          lineHeight: 10,
                          percent: fivestar / 100,
                          linearGradient: containerGradient,
                          backgroundColor: Colors.grey[400],
                          barRadius: Radius.circular(5),
                        ),
                      ),
                      Text(fivestar < 10 ? "  $fivestar%" : "$fivestar%",
                          style: TextStyle(fontFamily: 'helvetica')),
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("4",
                                style: TextStyle(fontFamily: 'helvetica')),
                            Icon(
                              Icons.star_rate_rounded,
                              size: 17,
                            )
                          ]),
                      Container(
                        child: LinearPercentIndicator(
                          width: screenSize.width - 265,
                          lineHeight: 10,
                          percent: fourstar / 100,
                          linearGradient: containerGradient,
                          backgroundColor: Colors.grey[400],
                          barRadius: Radius.circular(5),
                        ),
                      ),
                      Text(fourstar < 10 ? "  $fourstar%" : "$fourstar%",
                          style: TextStyle(fontFamily: 'helvetica')),
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "3",
                              style: TextStyle(fontFamily: 'helvetica'),
                            ),
                            Icon(
                              Icons.star_rate_rounded,
                              size: 17,
                            )
                          ]),
                      Container(
                        child: LinearPercentIndicator(
                          width: screenSize.width - 265,
                          lineHeight: 10,
                          percent: threestar / 100,
                          linearGradient: containerGradient,
                          backgroundColor: Colors.grey[400],
                          barRadius: Radius.circular(5),
                        ),
                      ),
                      Text(threestar < 10 ? "  $threestar%" : "$threestar%",
                          style: TextStyle(fontFamily: 'helvetica')),
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "2",
                              style: TextStyle(fontFamily: 'helvetica'),
                            ),
                            Icon(
                              Icons.star_rate_rounded,
                              size: 17,
                            )
                          ]),
                      Container(
                        child: LinearPercentIndicator(
                          width: screenSize.width - 265,
                          lineHeight: 10,
                          percent: twostar / 100,
                          linearGradient: containerGradient,
                          backgroundColor: Colors.grey[400],
                          barRadius: Radius.circular(5),
                        ),
                      ),
                      Text(twostar < 10 ? "  $twostar%" : "$twostar%",
                          style: TextStyle(fontFamily: 'helvetica')),
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "1",
                              style: TextStyle(fontFamily: 'helvetica'),
                            ),
                            Icon(
                              Icons.star_rate_rounded,
                              size: 17,
                            )
                          ]),
                      Container(
                        child: LinearPercentIndicator(
                          width: screenSize.width - 265,
                          lineHeight: 10,
                          percent: onestar / 100,
                          linearGradient: containerGradient,
                          backgroundColor: Colors.grey[400],
                          barRadius: Radius.circular(5),
                        ),
                      ),
                      Text(onestar < 10 ? "  $onestar%" : "$onestar%",
                          style: TextStyle(fontFamily: 'helvetica')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
