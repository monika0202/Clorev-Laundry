import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomAddressTimeContainer.dart';
import 'package:flutter_test_app/components/CustomBookingList.dart';
import 'package:flutter_test_app/components/CustomPriceDetails.dart';
import 'package:flutter_test_app/components/customListTitle.dart';
import 'package:flutter_test_app/main.dart';
import 'package:flutter_test_app/modals/bookedList.dart';
import 'package:page_transition/page_transition.dart';

class ShowBookingDetails extends StatefulWidget {
  final bookingID;
  const ShowBookingDetails({Key? key, required this.bookingID})
      : super(key: key);

  @override
  _ShowBookingDetailsState createState() => _ShowBookingDetailsState();
}

class _ShowBookingDetailsState extends State<ShowBookingDetails> {
  List<BookedList> bookitems = [
    BookedList(
        category: "laundry",
        price: 0,
        title: "Shirt-T",
        description: "Women",
        quantity: 2,
        isPhotoClicked: true),
    BookedList(
        category: "dryCleaning",
        price: 0,
        title: "Shirt-T",
        description: "Women",
        quantity: 1,
        isPhotoClicked: true),
    BookedList(
        category: "dryCleaning",
        price: 0,
        title: "Shirt-T",
        quantity: 1,
        description: "Women",
        isPhotoClicked: true),
  ];

  int _totalLaundryItem = 0;
  int _totalDryCleaningItem = 0;
  int _totalAddOnItem = 0;
  List<BookedList> _bookedDryCleaningItems = [];
  List<BookedList> _bookedLaundryItems = [];

  @override
  void initState() {
    for (var i = 0; i < bookitems.length; i++) {
      if (bookitems[i].category == "laundry") {
        _totalLaundryItem++;
        _bookedLaundryItems.add(bookitems[i]);
      } else if (bookitems[i].category == "dryCleaning") {
        _totalDryCleaningItem++;
        _bookedDryCleaningItems.add(bookitems[i]);
      }
    }

    print(_totalLaundryItem);
    print(_totalDryCleaningItem);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Container(
            width: MediaQuery.of(context).size.width / 1.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Booking #${widget.bookingID} ",
                  style: TextStyle(
                      fontFamily: 'helvetica', fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          leading: IconButton(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 40,
                color: Colors.white,
              )),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [bluegradientstartColor, bluegradientendColor],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft),
            ),
          ),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 5),
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
                      children: [
                        Container(
                          width: screenSize.width,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                bluegradientstartColor,
                                bluegradientendColor
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        text: "${widget.bookingID}",
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
                                        text: "7 Feb 2022",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: darkGreyColor,
                                            fontFamily: 'helvetica')),
                                  ]))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        _totalLaundryItem > 0
                            ? Column(children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 15,
                                    right: 15,
                                  ),
                                  child: CustomListTitle(
                                    isrounded: true,
                                    title: "Laundary",
                                    price: 000,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    //height: 200,
                                    margin:
                                        EdgeInsets.only(left: 15, right: 15),
                                    width: screenSize.width,
                                    child: ListView.separated(
                                        shrinkWrap: true,
                                        itemCount: _bookedLaundryItems.length,
                                        separatorBuilder: (BuildContext context,
                                                int index) =>
                                            Container(
                                              margin: EdgeInsets.all(10),
                                              child: Divider(
                                                height: 1,
                                                color: bluegradientstartColor,
                                              ),
                                            ),
                                        itemBuilder: (context, index) {
                                          return CustomBookingList(
                                              description:
                                                  _bookedLaundryItems[index]
                                                      .description,
                                              price: _bookedLaundryItems[index]
                                                  .price
                                                  .toString(),
                                              title: _bookedLaundryItems[index]
                                                  .title,
                                              isPhotoClicked:
                                                  _bookedLaundryItems[index]
                                                      .isPhotoClicked,
                                              quantity:
                                                  _bookedLaundryItems[index]
                                                      .quantity
                                                      .toString());
                                        }))
                              ])
                            : Container(),
                        _totalDryCleaningItem > 0
                            ? Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 15, right: 15, top: 10),
                                    child: CustomListTitle(
                                      isrounded: true,
                                      title: "DryCleaning",
                                      price: 000,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      //height: 200,
                                      margin:
                                          EdgeInsets.only(left: 15, right: 15),
                                      width: screenSize.width,
                                      child: ListView.separated(
                                          shrinkWrap: true,
                                          itemCount:
                                              _bookedDryCleaningItems.length,
                                          separatorBuilder:
                                              (BuildContext context,
                                                      int index) =>
                                                  Container(
                                                    margin: EdgeInsets.all(10),
                                                    child: Divider(
                                                      height: 1,
                                                      color:
                                                          bluegradientstartColor,
                                                    ),
                                                  ),
                                          itemBuilder: (context, index) {
                                            return CustomBookingList(
                                                description:
                                                    _bookedDryCleaningItems[
                                                            index]
                                                        .description,
                                                price: _bookedDryCleaningItems[
                                                        index]
                                                    .price
                                                    .toString(),
                                                title: _bookedDryCleaningItems[
                                                        index]
                                                    .title,
                                                isPhotoClicked:
                                                    _bookedDryCleaningItems[
                                                            index]
                                                        .isPhotoClicked,
                                                quantity:
                                                    _bookedDryCleaningItems[
                                                            index]
                                                        .quantity
                                                        .toString());
                                          }))
                                ],
                              )
                            : Container(),
                        Container(
                            height: 65,
                            padding: EdgeInsets.all(10),
                            width: screenSize.width,
                            margin: EdgeInsets.only(top: 10),
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
                              gradient: LinearGradient(
                                  colors: [
                                    bluegradientstartColor,
                                    bluegradientendColor
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          "0",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: darkGreyColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'helvetica'),
                                        ),
                                        Text(
                                          "(items)",
                                          style: TextStyle(
                                              color: darkGreyColor,
                                              fontFamily: 'helvetica'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 40,
                                  width: 1,
                                  color: darkGreyColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          serviceList.title,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: darkGreyColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'helvetica'),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Icon(
                                                    Icons.star_rate_rounded,
                                                    size: 17,
                                                    color: darkGreyColor,
                                                  ),
                                                  Text(
                                                    "${serviceList.star}",
                                                    style: TextStyle(
                                                        color: darkGreyColor,
                                                        fontFamily:
                                                            'helvetica'),
                                                  ),
                                                ],
                                              )),
                                              Text(
                                                "(${serviceList.ratings} Ratings)",
                                                style: TextStyle(
                                                    color: darkGreyColor,
                                                    fontFamily: 'helvetica'),
                                              ),
                                              Text(
                                                "\₹${serviceList.price}",
                                                style: TextStyle(
                                                    color: darkGreyColor,
                                                    //fontWeight: FontWeight.bold,
                                                    fontFamily: 'helvetica'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomPriceDetail(
                      DeliveryCharges: "Free",
                      cartValue: "0000",
                      gstValue: "000",
                      halfpayment: "50% paid via credit card",
                      halfamount: "0000",
                      otherhalfamount: "0000",
                      otherhalfpayemnt: "Balance 50% paid via UPI"),
                  SizedBox(
                    height: 15,
                  ),
                  CustomAddressTimeContainer(
                    isbookingdetail: true,
                    locality: "Gole Market,New Delhi -110 001",
                    flatno: "1C,21,Sector-2,",
                    pickupTime: "Today, 11:00AM-01:00PM",
                    deliveryTime: "25 Sep, 11:00AM-01:00PM",
                    onDownloadPress: () {},
                    onNeedHelpPress: () {},
                  ),
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
