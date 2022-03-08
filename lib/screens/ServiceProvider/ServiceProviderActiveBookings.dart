import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomBookingList.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/CustomLoginButton.dart';
import 'package:flutter_test_app/components/customListTitle.dart';
import 'package:flutter_test_app/components/customTextField.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';
import 'package:flutter_test_app/main.dart';
import 'package:flutter_test_app/modals/bookedList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ServiceProviderActiveBookings extends StatefulWidget {
  const ServiceProviderActiveBookings({Key? key}) : super(key: key);

  @override
  _ServiceProviderActiveBookingsState createState() =>
      _ServiceProviderActiveBookingsState();
}

class _ServiceProviderActiveBookingsState
    extends State<ServiceProviderActiveBookings> {
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
  final ImagePicker _picker = ImagePicker();
//pick image from camera
  late XFile _image;
  _imgFromCamera() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image!;
    });
  }

  FocusNode _focusNodeOtp = FocusNode();
  TextEditingController _controllerOTP = TextEditingController();
  bool _isCompleteEditingOTP = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
        height: screenSize.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                        height: 56,
                        isrounded: true,
                        title: "Laundary",
                        price: 000,
                        deliveryType: "Regular Delivery by",
                        time: "25 Sep,05:00 pm",
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
                            separatorBuilder: (BuildContext context,
                                    int index) =>
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
                                      _bookedLaundryItems[index].description,
                                  price: _bookedLaundryItems[index]
                                      .price
                                      .toString(),
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
                        height: 56,
                        isrounded: true,
                        title: "DryCleaning",
                        price: 000,
                        deliveryType: "Express Delivery by",
                        time: "25 Sep,05:00 pm",
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
                                description:
                                    _bookedDryCleaningItems[index].description,
                                price: _bookedDryCleaningItems[index]
                                    .price
                                    .toString(),
                                title: _bookedDryCleaningItems[index].title,
                                isPhotoClicked: _bookedDryCleaningItems[index]
                                    .isPhotoClicked,
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
                              text: "items : ",
                              style: TextStyle(
                                color: darkGreyColor,
                                fontFamily: 'helvetica',
                              ),
                              children: [
                            TextSpan(
                                text: "00",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: darkGreyColor,
                                    fontFamily: 'helvetica')),
                          ])),
                      RichText(
                          text: TextSpan(
                              text: "Booking Value : \₹",
                              style: TextStyle(
                                color: darkGreyColor,
                                fontFamily: 'helvetica',
                              ),
                              children: [
                            TextSpan(
                                text: "0,0000",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: darkGreyColor,
                                    fontFamily: 'helvetica')),
                          ])),
                    ]),
              ),
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
                                      "to Delivery Partner, to authenticate yourself.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: blackColor,
                                      fontFamily: 'helvetica')),
                            ])),
                    Divider(
                      color: bluegradientstartColor,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: screenSize.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: screenSize.width / 1.3,
                            child: Text(
                              "Click the Picture of Laundry bag showing Bag Number.",
                              maxLines: 2,
                              style: TextStyle(fontFamily: 'helvetica'),
                            ),
                          ),
                          InkWell(
                            child: Icon(
                              Icons.camera_alt_rounded,
                              size: 40,
                            ),
                            onTap: () {
                              _imgFromCamera();
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: bluegradientstartColor,
                    ),
                    SizedBox(height: 10),
                    Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Container(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Container(
                                  child: InkWell(
                                      child: isCheckbox
                                          ? GradientIcon(
                                              child: FaIcon(
                                              FontAwesomeIcons.solidCheckSquare,
                                              size: 20,
                                            ))
                                          : GradientIcon(
                                              child: FaIcon(
                                              FontAwesomeIcons.square,
                                              size: 20,
                                            )),
                                      onTap: () {
                                        setState(() {
                                          isCheckbox = !isCheckbox;
                                        });
                                      }),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                    width: screenSize.width / 2.1,
                                    child: Text(
                                        "Items have been cleaned and under packaging.",
                                        maxLines: 3,
                                        style:
                                            TextStyle(fontFamily: "Helvetica")))
                              ])),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                LoginButtons(
                                    width: 130,
                                    height: 45,
                                    isDisable: false,
                                    onpress: () {},
                                    isLoginButton: false,
                                    title: "Intimate")
                              ])
                        ])),
                    SizedBox(height: 10),
                    Divider(
                      color: bluegradientstartColor,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Ask OTP of Delivery Partner to ensure the handover of finished items in safe hands.",
                      style:
                          TextStyle(color: blackColor, fontFamily: 'helvetica'),
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
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
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
              SizedBox(
                height: 30,
              )
            ],
          ),
        ));
  }
}
