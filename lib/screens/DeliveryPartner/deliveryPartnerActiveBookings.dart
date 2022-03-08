import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomBookingList.dart';
import 'package:flutter_test_app/components/CustomLoginButton.dart';
import 'package:flutter_test_app/components/customListTitle.dart';
import 'package:flutter_test_app/components/customTextField.dart';
import 'package:flutter_test_app/modals/bookedList.dart';
import 'package:image_picker/image_picker.dart';

class DeliverPartnerActiveBookings extends StatefulWidget {
  const DeliverPartnerActiveBookings({Key? key}) : super(key: key);

  @override
  _DeliverPartnerActiveBookingsState createState() =>
      _DeliverPartnerActiveBookingsState();
}

class _DeliverPartnerActiveBookingsState
    extends State<DeliverPartnerActiveBookings> {
  List<BookedList> bookitems = [
    BookedList(
        category: "laundry",
        price: 0,
        title: "Shirt-T ",
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

  bool isCheckbox = false;

  FocusNode _focusNodeOtp = FocusNode();
  TextEditingController _controllerOTP = TextEditingController();
  bool _isCompleteEditingOTP = false;

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
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Column(children: [
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
                  margin: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 15,
                  ),
                  child: CustomListTitle(
                    isdeliveryPartner: true,
                    isrounded: true,
                    title: "Laundary",
                    price: 000,
                    deliveryType: "Regular Delivery",
                    isServiceProvider: true,
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
                              isDeliveryBooking: true,
                              description:
                                  _bookedLaundryItems[index].description,
                              price:
                                  _bookedLaundryItems[index].price.toString(),
                              title: _bookedLaundryItems[index].title,
                              isPhotoClicked:
                                  _bookedLaundryItems[index].isPhotoClicked,
                              quantity: _bookedLaundryItems[index]
                                  .quantity
                                  .toString());
                        })),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: CustomListTitle(
                    isdeliveryPartner: true,
                    isrounded: true,
                    title: "DryCleaning",
                    price: 000,
                    deliveryType: "Express Delivery",
                    isServiceProvider: true,
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
                            isDeliveryBooking: true,
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
                SizedBox(height: 10)
              ])),
          Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(
                      text: "Pickup Slot ",
                      style: TextStyle(
                        color: darkGreyColor,
                        fontFamily: 'helvetica',
                      ),
                    )),
                    RichText(
                        text: TextSpan(
                            text: "Tommorow, ",
                            style: TextStyle(
                              color: darkGreyColor,
                              fontFamily: 'helvetica',
                            ),
                            children: [
                          TextSpan(
                              text: "05:00 -06:30PM",
                              style: TextStyle(
                                  color: darkGreyColor,
                                  fontFamily: 'helvetica')),
                        ])),
                  ])),
          SizedBox(height: 15),
          Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              width: screenSize.width,
              padding: EdgeInsets.all(10),
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
              child: Column(children: [
                Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                      Icon(Icons.person, size: 40),
                      SizedBox(width: 10),
                      Container(
                        width: screenSize.width - 100,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Mr. Sudhir Mishra",
                                style: TextStyle(
                                    fontFamily: 'Helvetica',
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Shop No.428, city Center,Dwarka Sec-15,New Delhi -110059",
                                maxLines: 2,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                              Text(
                                "Landmark: Dwarka Sec-15 Metro Station ",
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                    LoginButtons(
                                        isDisable: false,
                                        onpress: () {},
                                        isrounded: true,
                                        height: 35,
                                        isLoginButton: true,
                                        title: "Get Direction",
                                        width: screenSize.width / 2.1,
                                        icon: Icons.directions),
                                    LoginButtons(
                                        isDisable: false,
                                        onpress: () {},
                                        height: 35,
                                        width: 80,
                                        isLoginButton: true,
                                        isrounded: true,
                                        title: "Call",
                                        icon: Icons.call)
                                  ])),
                              SizedBox(height: 10),
                            ]),
                      )
                    ])),
                Divider(
                  color: bluegradientstartColor,
                ),
                SizedBox(height: 10),
                RichText(
                    maxLines: 3,
                    text: TextSpan(
                        text: "Tell this OTP ",
                        style: TextStyle(
                          fontSize: 14,
                          color: blackColor,
                          fontFamily: 'helvetica',
                        ),
                        children: [
                          TextSpan(
                              text: "[XXXX] ",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: bluegradientstartColor,
                                  fontFamily: 'helvetica')),
                          TextSpan(
                              text: "to Consumer, to authenticate yourself.",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: blackColor,
                                  fontFamily: 'helvetica'))
                        ])),
                SizedBox(height: 10),
                Divider(
                  color: bluegradientstartColor,
                ),
                SizedBox(height: 10),
                Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Icon(Icons.local_laundry_service_rounded, size: 40),
                      SizedBox(width: 10),
                      Container(
                          width: screenSize.width - 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CRL-017(DEL)",
                                style: TextStyle(
                                    fontFamily: 'Helvetica',
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Shop No.428, city Center,Dwarka Sec-15,New Delhi -110059",
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                              Text(
                                "Landmark: Dwarka Sec-15 Metro Station ",
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                    LoginButtons(
                                        isDisable: false,
                                        onpress: () {},
                                        height: 35,
                                        isLoginButton: true,
                                        isrounded: true,
                                        title: "Get Direction",
                                        width: screenSize.width / 2.1,
                                        icon: Icons.directions),
                                    LoginButtons(
                                        isDisable: false,
                                        onpress: () {},
                                        isLoginButton: true,
                                        height: 35,
                                        title: "Call",
                                        isrounded: true,
                                        width: 80,
                                        icon: Icons.call)
                                  ])),
                            ],
                          ))
                    ])),
                SizedBox(height: 10),
                Divider(
                  color: bluegradientstartColor,
                ),
                SizedBox(height: 10),
                Text(
                  "Ask OTP of Service Provider to ensure the handover of laundry items in safe hands.",
                  style: TextStyle(color: blackColor, fontFamily: 'helvetica'),
                ),
                SizedBox(height: 10),
                Container(
                  width: screenSize.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenSize.width - 200,
                        child: CustomTextField(
                            focusNode: _focusNodeOtp,
                            controller: _controllerOTP,
                            labelText: "Enter OTP",
                            type: TextInputType.number,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            inputFormat: [
                              LengthLimitingTextInputFormatter(4),
                            ],
                            onChanged: (val) {},
                            onsubmitted: (val) {
                              setState(() {
                                _focusNodeOtp.unfocus();
                                _isCompleteEditingOTP = true;
                              });
                            },
                            completeEditing: _isCompleteEditingOTP,
                            onEditingCompleted: () {},
                            onTap: () {
                              _focusNodeOtp.requestFocus();
                            }),
                      ),
                      LoginButtons(
                        width: 130,
                        height: 45,
                        isDisable: false,
                        onpress: () {},
                        isLoginButton: false,
                        title: "Verify",
                      )
                    ],
                  ),
                ),
              ])),
          SizedBox(height: 15),
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
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Column(children: [
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
                  margin:
                      EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
                  child: CustomListTitle(
                    isdeliveryPartner: true,
                    isrounded: true,
                    title: "Laundary",
                    price: 000,
                    deliveryType: "Regular Delivery",
                    isServiceProvider: true,
                  ),
                ),
                Container(
                  //height: 200,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  width: screenSize.width,

                  child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: bookitems.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                            height: 10,
                          ),
                      itemBuilder: (context, index) {
                        // notice color is added to style divider
                        if (bookitems[index].category == "Laundry") {
                          return CustomBookingList(
                              isDeliveryBooking: true,
                              description: bookitems[index].description,
                              price: bookitems[index].price.toString(),
                              title: bookitems[index].title,
                              isPhotoClicked: bookitems[index].isPhotoClicked,
                              quantity: bookitems[index].quantity.toString());
                        } else {
                          return Container();
                        }
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: CustomListTitle(
                    isdeliveryPartner: true,
                    isrounded: true,
                    title: "DryCleaning",
                    price: 000,
                    deliveryType: "Express Delivery",
                    isServiceProvider: true,
                  ),
                ),
                Container(
                  //height: 200,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  width: screenSize.width,

                  child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: bookitems.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                            height: 10,
                          ),
                      itemBuilder: (context, index) {
                        // notice color is added to style divider
                        if (bookitems[index].category == "DryCleaning") {
                          return CustomBookingList(
                              isDeliveryBooking: true,
                              description: bookitems[index].description,
                              price: bookitems[index].price.toString(),
                              title: bookitems[index].title,
                              isPhotoClicked: bookitems[index].isPhotoClicked,
                              quantity: bookitems[index].quantity.toString());
                        } else {
                          return Container();
                        }
                      }),
                ),
                SizedBox(height: 10)
              ])),
          Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(
                      text: "Delivery Slot ",
                      style: TextStyle(
                        color: darkGreyColor,
                        fontFamily: 'helvetica',
                      ),
                    )),
                    RichText(
                        text: TextSpan(
                            text: "22 Feb, ",
                            style: TextStyle(
                              color: darkGreyColor,
                              fontFamily: 'helvetica',
                            ),
                            children: [
                          TextSpan(
                              text: "05:00 -06:30PM",
                              style: TextStyle(
                                  color: darkGreyColor,
                                  fontFamily: 'helvetica')),
                        ])),
                  ])),
          SizedBox(height: 15),
          Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              width: screenSize.width,
              padding: EdgeInsets.all(10),
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
              child: Column(children: [
                Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                      Icon(Icons.local_laundry_service_rounded, size: 40),
                      SizedBox(width: 10),
                      Container(
                        width: screenSize.width - 100,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CRL-017(DEL)",
                                style: TextStyle(
                                    fontFamily: 'Helvetica',
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Shop No.428, city Center,Dwarka Sec-15,New Delhi -110059",
                                maxLines: 2,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                              Text(
                                "Landmark: Dwarka Sec-15 Metro Station ",
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                    LoginButtons(
                                        isDisable: false,
                                        onpress: () {},
                                        isrounded: true,
                                        height: 35,
                                        isLoginButton: true,
                                        title: "Get Direction",
                                        width: screenSize.width / 2.1,
                                        icon: Icons.directions),
                                    LoginButtons(
                                        isDisable: false,
                                        onpress: () {},
                                        height: 35,
                                        width: 80,
                                        isLoginButton: true,
                                        isrounded: true,
                                        title: "Call",
                                        icon: Icons.call)
                                  ])),
                              SizedBox(height: 10),
                            ]),
                      )
                    ])),
                Divider(
                  color: bluegradientstartColor,
                ),
                SizedBox(height: 10),
                RichText(
                    maxLines: 3,
                    text: TextSpan(
                        text: "Tell this OTP ",
                        style: TextStyle(
                          fontSize: 14,
                          color: blackColor,
                          fontFamily: 'helvetica',
                        ),
                        children: [
                          TextSpan(
                              text: "[XXXX] ",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: bluegradientstartColor,
                                  fontFamily: 'helvetica')),
                          TextSpan(
                              text:
                                  "to Service Provider, to authenticate yourself.",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: blackColor,
                                  fontFamily: 'helvetica'))
                        ])),
                SizedBox(height: 10),
                Divider(
                  color: bluegradientstartColor,
                ),
                SizedBox(height: 10),
                Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Icon(Icons.person, size: 40),
                      SizedBox(width: 10),
                      Container(
                          width: screenSize.width - 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Mr. Sudhir Mishra",
                                style: TextStyle(
                                    fontFamily: 'Helvetica',
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Shop No.428, city Center,Dwarka Sec-15,New Delhi -110059",
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                              Text(
                                "Landmark: Dwarka Sec-15 Metro Station ",
                                style: TextStyle(
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                    LoginButtons(
                                        isDisable: false,
                                        onpress: () {},
                                        height: 35,
                                        isLoginButton: true,
                                        isrounded: true,
                                        title: "Get Direction",
                                        width: screenSize.width / 2.1,
                                        icon: Icons.directions),
                                    LoginButtons(
                                        isDisable: false,
                                        onpress: () {},
                                        isLoginButton: true,
                                        height: 35,
                                        title: "Call",
                                        isrounded: true,
                                        width: 80,
                                        icon: Icons.call)
                                  ])),
                            ],
                          ))
                    ])),
                SizedBox(height: 10),
                Divider(
                  color: bluegradientstartColor,
                ),
                SizedBox(height: 10),
                Text(
                  "Ask OTP of Consumer to ensure the handover of finished items in safe hands.",
                  style: TextStyle(color: blackColor, fontFamily: 'helvetica'),
                ),
                SizedBox(height: 10),
                Container(
                  width: screenSize.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenSize.width - 200,
                        child: CustomTextField(
                            focusNode: _focusNodeOtp,
                            controller: _controllerOTP,
                            type: TextInputType.number,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            inputFormat: [
                              LengthLimitingTextInputFormatter(4),
                            ],
                            labelText: "Enter OTP",
                            onChanged: (val) {},
                            onsubmitted: (val) {
                              setState(() {
                                _focusNodeOtp.unfocus();
                                _isCompleteEditingOTP = true;
                              });
                            },
                            completeEditing: _isCompleteEditingOTP,
                            onEditingCompleted: () {},
                            onTap: () {
                              _focusNodeOtp.requestFocus();
                            }),
                      ),
                      LoginButtons(
                        width: 130,
                        height: 45,
                        isDisable: false,
                        onpress: () {},
                        isLoginButton: false,
                        title: "Verify",
                      )
                    ],
                  ),
                ),
              ])),
          SizedBox(height: 30),
        ])));
  }
}
