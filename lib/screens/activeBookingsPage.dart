import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomAddressTimeContainer.dart';
import 'package:flutter_test_app/components/CustomBookingList.dart';
import 'package:flutter_test_app/components/CustomLoginButton.dart';
import 'package:flutter_test_app/components/CustomPickUpDeliverboyVerification.dart';
import 'package:flutter_test_app/components/CustomPriceDetails.dart';
import 'package:flutter_test_app/components/CustomProgressBar.dart';
import 'package:flutter_test_app/components/customListTitle.dart';
import 'package:flutter_test_app/main.dart';
import 'package:flutter_test_app/modals/bookedList.dart';
import 'package:flutter_test_app/screens/cancelBookingPage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:image_picker/image_picker.dart';

class ActiveBookings extends StatefulWidget {
  const ActiveBookings({Key? key}) : super(key: key);

  @override
  _ActiveBookingsState createState() => _ActiveBookingsState();
}

class _ActiveBookingsState extends State<ActiveBookings> {
  FocusNode _focusNode = FocusNode();
  bool otpsubmit = false;
  List<BookedList> bookitems = [
    BookedList(
        category: "laundry",
        price: 0,
        title: "Shirt-T ",
        description: "Women",
        quantity: 2,
        isPhotoClicked: false),
    BookedList(
        category: "dryCleaning",
        price: 0,
        title: "Shirt-T",
        description: "Women",
        quantity: 1,
        isPhotoClicked: false),
    BookedList(
        category: "dryCleaning",
        price: 0,
        title: "Shirt-T",
        quantity: 1,
        description: "Women",
        isPhotoClicked: false),
  ];

  List<BookedList> _bookedDryCleaningItems = [];
  List<BookedList> _bookedLaundryItems = [];
  @override
  void initState() {
    for (var i = 0; i < bookitems.length; i++) {
      if (bookitems[i].category == "laundry") {
        _bookedLaundryItems.add(bookitems[i]);
      } else if (bookitems[i].category == "dryCleaning") {
        _bookedDryCleaningItems.add(bookitems[i]);
      }
    }
  }

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 15),
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
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Column(
              children: [
                Container(
                  width: screenSize.width,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [bluegradientstartColor, bluegradientendColor],
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
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: CustomListTitle(
                    isrounded: true,
                    title: "Laundary",
                    price: 000,
                  ),
                ),
                Container(
                  //height: 200,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  width: screenSize.width,

                  child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: _bookedLaundryItems.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Divider(
                              height: 1,
                              color: bluegradientstartColor,
                            ),
                          ),
                      itemBuilder: (context, index) {
                        return CustomBookingList(
                            description: _bookedLaundryItems[index].description,
                            price: _bookedLaundryItems[index].price.toString(),
                            title: _bookedLaundryItems[index].title,
                            isPhotoClicked:
                                _bookedLaundryItems[index].isPhotoClicked,
                            quantity:
                                _bookedLaundryItems[index].quantity.toString());
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: CustomListTitle(
                    isrounded: true,
                    title: "DryCleaning",
                    price: 000,
                  ),
                ),
                Container(
                  //height: 200,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  width: screenSize.width,

                  child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: _bookedDryCleaningItems.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Divider(
                              height: 1,
                              color: bluegradientstartColor,
                            ),
                          ),
                      itemBuilder: (context, index) {
                        return CustomBookingList(
                            description:
                                _bookedDryCleaningItems[index].description,
                            price:
                                _bookedDryCleaningItems[index].price.toString(),
                            title: _bookedDryCleaningItems[index].title,
                            isPhotoClicked:
                                _bookedDryCleaningItems[index].isPhotoClicked,
                            quantity: _bookedDryCleaningItems[index]
                                .quantity
                                .toString());
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
              height: 65,
              padding: EdgeInsets.all(10),
              width: screenSize.width,
              margin: EdgeInsets.only(left: 15, right: 15),
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
                    colors: [bluegradientstartColor, bluegradientendColor],
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
                                color: darkGreyColor, fontFamily: 'helvetica'),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                          fontFamily: 'helvetica'),
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
              )),
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
              otherhalfpayemnt: "Payable 50% Balance"),
          SizedBox(
            height: 15,
          ),
          CustomAddressTimeContainer(
            locality: "Gole Market,New Delhi -110 001",
            flatno: "1C,21,Sector-2,",
            pickupTime: "Today, 11:00AM-01:00PM",
            deliveryTime: "25 Sep, 11:00AM-01:00PM",
            onCancelBookingPress: () {
              print("hello");
              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: CancelBooking()),
              );
            },
            onNeedHelpPress: () {},
          ),
          SizedBox(
            height: 15,
          ),
          CustomProgressBar(
              pickupDate: "21 Sep",
              underProcessDate: "22-23 Sep",
              beingPackagedDate: "24 Sep",
              deliveredDate: "25 Sep"),
          SizedBox(
            height: 15,
          ),
          CustomVerification(
              focusNode: _focusNode,
              name: "Sameer Raj",
              status: "is comming to pick your laundry",
              detail: Text(
                "Ask OTP of Pickup Guy to ensure the handover of laundry items in safe hands.",
                style: TextStyle(
                  fontFamily: 'helvetica',
                ),
              ),
              controller: _controller,
              onCallPress: () {},
              onTap: () {},
              onVerifyPress: () {},
              onchanged: (val) {},
              competed: otpsubmit,
              onSubmitting: (val) {
                setState(() {
                  _focusNode.unfocus();
                  otpsubmit = true;
                });
              },
              onCompleteEditing: () {}),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: LoginButtons(
              width: screenSize.width / 1.2,
              isDisable: true,
              onpress: () {},
              isShadow: true,
              isLoginButton: false,
              title:
                  "Pay Balance 50% Amount \₹${serviceList.price - halfPrice}",
              isrounded: true,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CustomVerification(
              name: "Aryan Singh",
              status: "is going to deliver your laundry",
              detail: Container(
                width: screenSize.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenSize.width / 1.23,
                      child: RichText(
                        textAlign: TextAlign.justify,
                        maxLines: 3,
                        text: TextSpan(
                            text: "Tell this OTP ",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'helvetica',
                            ),
                            children: [
                              TextSpan(
                                text: "[XXXX]",
                                style: TextStyle(
                                  color: bluegradientstartColor,
                                  fontFamily: 'helvetica',
                                ),
                              ),
                              TextSpan(
                                text:
                                    " to Delivery Guy, to authenticate yourself.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'helvetica',
                                ),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              isDisableCall: true,
              isPickUpBoy: false,
              controller: _controller,
              onCallPress: () {},
              onTap: () {},
              onVerifyPress: () {},
              onchanged: (val) {},
              onSubmitting: (val) {},
              onCompleteEditing: () {}),
          SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}
