import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/BorderIcon.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/CustomCalender.dart';
import 'package:flutter_test_app/components/CustomPopUp.dart';
import 'package:flutter_test_app/components/DotWidget.dart';
import 'package:flutter_test_app/components/GradientButton.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/components/customTextField.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';
import 'package:flutter_test_app/main.dart';
import 'package:flutter_test_app/screens/DeliveryPage.dart';
import 'package:flutter_test_app/screens/paymentPage.dart';
import 'package:flutter_test_app/screens/pickupPage.dart';
import 'package:flutter_test_app/screens/serviceProviderPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:intl/intl.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

enum AddressCatrogry { home, office, other }

class _AddressPageState extends State<AddressPage> {
  TextEditingController _locationController = TextEditingController();
  TextEditingController _floorController = TextEditingController();
  TextEditingController _landmarkController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _recipientNameController = TextEditingController();

  FocusNode _focusNodeLocation = FocusNode();
  FocusNode _focusNodefloor = FocusNode();
  FocusNode _focusNodeLandmark = FocusNode();
  FocusNode _focusNodeEmail = FocusNode();
  FocusNode _focusNodeRecipientName = FocusNode();
  bool is_checked = false;
  bool location = false;
  bool floor = false;
  bool landmark = false;
  bool email = false;
  bool recipientName = false;
  AddressCatrogry _addressCatrogry = AddressCatrogry.home;
  var formatterTime = DateFormat('dd MMM');
  String actualPickupDate = DateFormat("dd MMM").format(pickUpDate);
  String actualDeliveryDate = DateFormat("dd MMM").format(DeliveryDate);
  List<String> listOfMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      //margin: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 15, bottom: 100),
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          padding: EdgeInsets.all(10),
          height: 176,
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
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Container(
            child: Column(
              children: [
                Text("Add Washing Instruction (optional)",
                    style: TextStyle(
                        color: darkGreyColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'helvetica')),
                SizedBox(
                  height: 7,
                ),
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextFormField(
                      maxLines: 6,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          //contentPadding: EdgeInsets.all(5),
                          hintText: "Drop your Comment here..."),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 84,
          margin: EdgeInsets.only(left: 15, right: 15),
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
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
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.schedule_rounded),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Regular Pickup Schedule",
                      style: TextStyle(
                          color: darkGreyColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'helvetica')),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text("$actualPickupDate ($weekendPickup)",
                            style: TextStyle(fontFamily: 'helvetica')),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text("$pickUpTime",
                            style: TextStyle(fontFamily: 'helvetica')),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          height: 84,
          padding: EdgeInsets.all(10),
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
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.schedule_rounded),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Regular Delivery Schedule",
                      style: TextStyle(
                          color: darkGreyColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'helvetica')),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        alignment: Alignment.center,
                        child: Text("$actualDeliveryDate ($weekendDelivery)",
                            style: TextStyle(fontFamily: 'helvetica')),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text("$deliveryTime",
                            style: TextStyle(fontFamily: 'helvetica')),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 120,
          margin: EdgeInsets.only(left: 15, right: 15),
          padding: EdgeInsets.all(10),
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
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.map_rounded),
                  Text("Update Delivery Address",
                      style: TextStyle(
                          color: darkGreyColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'helvetica')),
                  InkWell(
                    child: Icon(Icons.edit),
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                                builder: (BuildContext context, setState) {
                              return Container(
                                  height: screenSize.height / 1.4,
                                  padding: EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                  ),
                                  child: Stack(children: [
                                    Container(
                                        child: SingleChildScrollView(
                                            child: Column(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 15, right: 15),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 40,
                                                    //width: screenSize.width / 1.5,
                                                    // margin: EdgeInsets.only(left: 15, right: 15),
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            bluegradientstartColor,
                                                            bluegradientendColor
                                                          ],
                                                          begin: Alignment
                                                              .topRight,
                                                          end: Alignment
                                                              .bottomLeft),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10)),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Update your Pickup Address",
                                                          style: TextStyle(
                                                              color:
                                                                  darkGreyColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'helvetica'),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 15),
                                                  CustomTextField(
                                                      maxLines: 3,
                                                      focusNode:
                                                          _focusNodeLocation,
                                                      onTap: () {
                                                        setState(() {
                                                          location = false;
                                                        });
                                                      },
                                                      onEditingCompleted: () {
                                                        setState(() {
                                                          location = true;
                                                        });
                                                      },
                                                      controller:
                                                          _locationController,
                                                      onsubmitted: (val) {
                                                        print("hello");
                                                        location = true;
                                                        _focusNodeLocation
                                                            .unfocus();
                                                      },
                                                      labelText:
                                                          "Your Chosen Location *",
                                                      completeEditing: location,
                                                      onChanged: (val) {}),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  CustomTextField(
                                                      focusNode:
                                                          _focusNodefloor,
                                                      onTap: () {
                                                        setState(() {
                                                          floor = false;
                                                        });
                                                      },
                                                      onEditingCompleted: () {
                                                        setState(() {
                                                          floor = true;
                                                          _focusNodefloor
                                                              .unfocus();
                                                        });
                                                      },
                                                      controller:
                                                          _floorController,
                                                      onsubmitted: (val) {},
                                                      completeEditing: floor,
                                                      labelText:
                                                          "Flat/Floor No., House/Block No. *",
                                                      onChanged: (val) {}),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  CustomTextField(
                                                      focusNode:
                                                          _focusNodeLandmark,
                                                      onTap: () {
                                                        setState(() {
                                                          landmark = false;
                                                        });
                                                      },
                                                      onEditingCompleted: () {
                                                        setState(() {
                                                          landmark = true;
                                                          _focusNodeLandmark
                                                              .unfocus();
                                                        });
                                                      },
                                                      controller:
                                                          _landmarkController,
                                                      onsubmitted: (val) {},
                                                      completeEditing: landmark,
                                                      labelText:
                                                          "Landmark (optional)",
                                                      onChanged: (val) {}),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  CustomTextField(
                                                      type: TextInputType.name,
                                                      focusNode:
                                                          _focusNodeRecipientName,
                                                      onTap: () {
                                                        setState(() {
                                                          floor = false;
                                                        });
                                                      },
                                                      onEditingCompleted: () {
                                                        setState(() {
                                                          floor = true;
                                                          _focusNodeRecipientName
                                                              .unfocus();
                                                        });
                                                      },
                                                      controller:
                                                          _recipientNameController,
                                                      onsubmitted: (val) {},
                                                      completeEditing:
                                                          recipientName,
                                                      labelText:
                                                          "Recipient Name *",
                                                      onChanged: (val) {}),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  CustomTextField(
                                                      type: TextInputType
                                                          .emailAddress,
                                                      focusNode:
                                                          _focusNodeEmail,
                                                      onTap: () {
                                                        setState(() {
                                                          email = false;
                                                        });
                                                      },
                                                      onEditingCompleted: () {
                                                        setState(() {
                                                          email = true;
                                                          _focusNodeEmail
                                                              .unfocus();
                                                        });
                                                      },
                                                      controller:
                                                          _emailController,
                                                      onsubmitted: (val) {},
                                                      completeEditing: email,
                                                      labelText: "Email ID *",
                                                      onChanged: (val) {}),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  GradientText(
                                                    isbold: false,
                                                    title: "Tag this Address *",
                                                    isDisable: true,
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        GradientButton(
                                                            isSelected:
                                                                _addressCatrogry ==
                                                                    AddressCatrogry
                                                                        .home,
                                                            onPress: () {
                                                              setState(() {
                                                                _addressCatrogry =
                                                                    AddressCatrogry
                                                                        .home;
                                                              });
                                                            },
                                                            title: "Home",
                                                            width: screenSize
                                                                    .width /
                                                                4.5),
                                                        GradientButton(
                                                            isSelected:
                                                                _addressCatrogry ==
                                                                    AddressCatrogry
                                                                        .office,
                                                            onPress: () {
                                                              setState(() {
                                                                _addressCatrogry =
                                                                    AddressCatrogry
                                                                        .office;
                                                              });
                                                            },
                                                            title: "Office",
                                                            width: screenSize
                                                                    .width /
                                                                4.5),
                                                        GradientButton(
                                                            isSelected:
                                                                _addressCatrogry ==
                                                                    AddressCatrogry
                                                                        .other,
                                                            onPress: () {
                                                              setState(() {
                                                                _addressCatrogry =
                                                                    AddressCatrogry
                                                                        .other;
                                                              });
                                                            },
                                                            title: "Other",
                                                            width: screenSize
                                                                    .width /
                                                                4.5),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Container(
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                        Container(
                                                          child: InkWell(
                                                              child: is_checked
                                                                  ? GradientIcon(
                                                                      child:
                                                                          FaIcon(
                                                                      FontAwesomeIcons
                                                                          .solidCheckSquare,
                                                                      size: 20,
                                                                    ))
                                                                  : GradientIcon(
                                                                      child:
                                                                          FaIcon(
                                                                      FontAwesomeIcons
                                                                          .square,
                                                                      size: 20,
                                                                    )),
                                                              onTap: () {
                                                                setState(() {
                                                                  is_checked =
                                                                      !is_checked;
                                                                });
                                                              }),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "Make this as my default address.",
                                                          textAlign:
                                                              TextAlign.justify,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  "Helvetica"),
                                                        ),
                                                      ])),
                                                ])),
                                      ],
                                    ))),
                                    Positioned(
                                      bottom: 20,
                                      right: 0,
                                      left: 0,
                                      child: CustomBottomBarButton(
                                        isDisable: false,
                                        height: 50,
                                        onpress: () {
                                          // Navigator.push(
                                          //   context,
                                          //   PageTransition(
                                          //       type:
                                          //           PageTransitionType
                                          //               .rightToLeft,
                                          //       child:
                                          //           ServiceProviderList()),
                                          // );
                                        },
                                        title: "SAVE ADDRESS",
                                        width: screenSize.width,
                                      ),
                                    )
                                  ]));
                            });
                          });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 70,
                width: screenSize.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${addressList.flat_House_No}",
                        style: TextStyle(fontFamily: 'helvetica')),
                    Text("${addressList.location}",
                        maxLines: 2, style: TextStyle(fontFamily: 'helvetica')),
                    Text("Landmark: ${addressList.landmark}",
                        style: TextStyle(fontFamily: 'helvetica')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
