import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomClosedBookingList.dart';
import 'package:flutter_test_app/components/CustomProgressBar.dart';
import 'package:flutter_test_app/components/CustomRatingBottomSheet.dart';
import 'package:flutter_test_app/components/GradientCardBox.dart';
import 'package:flutter_test_app/main.dart';
import 'package:flutter_test_app/screens/closedBooking.dart';
import 'package:flutter_test_app/screens/google.dart';
import 'package:flutter_test_app/screens/homePage.dart';
import 'package:flutter_test_app/screens/showBookingDetail.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flappy_search_bar_ns/flappy_search_bar_ns.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _controller = ScrollController();
  // InfiniteScrollController _horizontalController = InfiniteScrollController();
  double newRating = 0;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 220,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [bluegradientstartColor, bluegradientendColor],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft),
            ),
          ),
          title: Container(
              child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: screenSize.width,
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    color: bluegradientstartColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: screenSize.width - 87,
                        child: Text(
                          "${addressList.flat_House_No},${addressList.location},${addressList.landmark}",
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'helvetica',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_rounded,
                        color: whiteColor,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GradientCardBox(
                      onPress: () {},
                      ishomeScreen: true,
                      title: "Laundry\nWash & Iron",
                    ),
                    GradientCardBox(
                      onPress: () {},
                      ishomeScreen: true,
                      title: "Dry-\nCleaning",
                    ),
                    GradientCardBox(
                      onPress: () {},
                      ishomeScreen: true,
                      title: "Steam\nPress",
                    ),
                    GradientCardBox(
                      onPress: () {},
                      ishomeScreen: true,
                      title: "Show &\nLeather Care",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: HomePage()),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        bluegradientstartColor,
                        bluegradientendColor
                      ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, -3),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: whiteColor, width: 2)),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Book Now",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'helvetica',
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/bodybg.png")),
          ),
          child: Container(
            height: screenSize.height,
            width: screenSize.width,
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Container(
                            height: 40,
                            margin: EdgeInsets.only(left: 15, right: 15),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: Offset(0, 3))
                                ],
                                gradient: LinearGradient(
                                    colors: [
                                      bluegradientstartColor,
                                      bluegradientendColor
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          text: "Booking ID : ",
                                          style: TextStyle(
                                            color: darkGreyColor,
                                            fontFamily: 'helvetica',
                                          ),
                                          children: [
                                        TextSpan(
                                            text: "CRB1009785",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: darkGreyColor,
                                                fontFamily: 'helvetica')),
                                      ])),
                                  RichText(
                                      text: TextSpan(
                                          text: "dtd ",
                                          style: TextStyle(
                                            color: darkGreyColor,
                                            fontFamily: 'helvetica',
                                          ),
                                          children: [
                                        TextSpan(
                                            text: "2 Feb 2022",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: darkGreyColor,
                                                fontFamily: 'helvetica')),
                                      ]))
                                ])),
                        CustomProgressBar(
                            isHomeScreen: true,
                            pickupDate: "21 Sep",
                            underProcessDate: "22-23 Sep",
                            beingPackagedDate: "24 Sep",
                            deliveredDate: "25 Sep"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: ListView.separated(
                      controller: _controller,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 30),
                      itemCount: completeBookedList.length,
                      itemBuilder: (context, index) {
                        if (completeBookedList[index].rating == 0) {
                          return CustomClosedBookingList(
                            bookingID: completeBookedList[index].bookingID,
                            date: completeBookedList[index].Date,
                            status: completeBookedList[index].status,
                            deliveredDate:
                                completeBookedList[index].deliveredDate,
                            items: completeBookedList[index].Item,
                            rate: completeBookedList[index].rating!,
                            isRate: completeBookedList[index].rating == 0,
                            serviceProviderID:
                                completeBookedList[index].serviceProviderId,
                            onpressRateService: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(builder:
                                        (BuildContext context, setState) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: CustomRatingBottomSheet(
                                            onPressSubmit: () {
                                              setState(() {
                                                completeBookedList[index]
                                                    .rating = newRating;
                                                print(completeBookedList[index]
                                                    .rating);
                                              });

                                              Navigator.of(context).pop();
                                              this.setState(() {});
                                            },
                                            onRatingUpdate: (rating) {
                                              setState(() {
                                                newRating = rating;

                                                print(rating);
                                              });
                                              this.setState(() {});
                                            },
                                            CRLNo: "CRL-017 (DEL)"),
                                      );
                                    });
                                  });
                            },
                            onpressShowDetails: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: ShowBookingDetails(
                                      bookingID:
                                          completeBookedList[index].bookingID,
                                    )),
                              );
                            },
                          );
                        } else {
                          return Container();
                        }
                      },
                      separatorBuilder: (context, index) {
                        return completeBookedList[index].rating == 0
                            ? SizedBox(
                                height: 10,
                              )
                            : Container();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Text(
                          "Covid-19 Safety Measures",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'helvetica',
                              color: darkGreyColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CarouselSlider.builder(
                    itemCount: 4,
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.5,
                        viewportFraction: 0.5,
                        //aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        pageSnapping: false),
                    itemBuilder: (context, index, realIdx) {
                      return Container(
                        height: 200,
                        width: 200,
                        margin: EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                bluegradientstartColor,
                                bluegradientendColor
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Text("$index"),
                      );
                    },
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  // Container(
                  //   height: 200,
                  //   child: ListView(
                  //     shrinkWrap: true,
                  //     padding: EdgeInsets.only(
                  //         top: 10, right: 15, left: 15, bottom: 15),
                  //     scrollDirection: Axis.horizontal,
                  //     children: [
                  //       Container(
                  //         height: 200,
                  //         width: 200,
                  //         decoration: BoxDecoration(
                  //             gradient: LinearGradient(
                  //               colors: [
                  //                 bluegradientstartColor,
                  //                 bluegradientendColor
                  //               ],
                  //               begin: Alignment.topRight,
                  //               end: Alignment.bottomLeft,
                  //             ),
                  //             boxShadow: [
                  //               BoxShadow(
                  //                 color: Colors.grey.withOpacity(0.5),
                  //                 spreadRadius: 2,
                  //                 blurRadius: 7,
                  //                 offset: Offset(
                  //                     0, 3), // changes position of shadow
                  //               ),
                  //             ],
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(10))),
                  //       ),
                  //       SizedBox(width: 10),
                  //       Container(
                  //           height: 200,
                  //           width: 200,
                  //           decoration: BoxDecoration(
                  //               gradient: LinearGradient(
                  //                   colors: [
                  //                     bluegradientstartColor,
                  //                     bluegradientendColor
                  //                   ],
                  //                   begin: Alignment.topRight,
                  //                   end: Alignment.bottomLeft),
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                     color: Colors.grey.withOpacity(0.5),
                  //                     spreadRadius: 2,
                  //                     blurRadius: 7,
                  //                     offset: Offset(
                  //                         0, 3) // changes position of shadow
                  //                     )
                  //               ],
                  //               borderRadius:
                  //                   BorderRadius.all(Radius.circular(10)))),
                  //       SizedBox(width: 10),
                  //       Container(
                  //           height: 200,
                  //           width: 200,
                  //           decoration: BoxDecoration(
                  //               gradient: LinearGradient(
                  //                   colors: [
                  //                     bluegradientstartColor,
                  //                     bluegradientendColor
                  //                   ],
                  //                   begin: Alignment.topRight,
                  //                   end: Alignment.bottomLeft),
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                     color: Colors.grey.withOpacity(0.5),
                  //                     spreadRadius: 2,
                  //                     blurRadius: 7,
                  //                     offset: Offset(
                  //                         0, 3) // changes position of shadow
                  //                     )
                  //               ],
                  //               borderRadius:
                  //                   BorderRadius.all(Radius.circular(10)))),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
