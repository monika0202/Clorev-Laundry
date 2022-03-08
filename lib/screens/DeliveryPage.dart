import 'dart:convert';
import 'dart:developer';
import 'package:flutter_test_app/components/BorderIcon.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/CustomCalender.dart';
import 'package:flutter_test_app/components/CustomPickUpDelivery.dart';
import 'package:flutter_test_app/components/customtimebutton.dart';
import 'package:flutter_test_app/main.dart';
import 'package:flutter_test_app/modals/AddOnCategory.dart';
import 'package:flutter_test_app/components/CustomPopUp.dart';
import 'package:flutter_test_app/screens/addressPage.dart';
import 'package:flutter_test_app/screens/bookingSummaryPage.dart';
import 'package:flutter_test_app/screens/homePage.dart';
import 'package:flutter_test_app/screens/serviceProviderPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomBottomBar.dart';
import 'package:flutter_test_app/components/CustomDropDownTile.dart';
import 'package:flutter_test_app/components/DotWidget.dart';
import 'package:flutter_test_app/components/GradientButton.dart';
import 'package:flutter_test_app/components/GradientCardBox.dart';
import 'package:flutter_test_app/components/customDropDownItem.dart';
import 'package:flutter_test_app/components/customSearchBox.dart';
import 'package:page_transition/page_transition.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({Key? key}) : super(key: key);

  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

//enum PickOrDelivery { pickup, delivery }

String deliveryTime = "";
enum DeliveryTime {
  NineToEleven,
  ElevenToOne,
  FourToFive,
  FiveToSeven,
  SevenToEight,
  EightToTen,
  nothingSelected,
}
bool isSelectedDeliveryDate = false;

class _DeliveryPageState extends State<DeliveryPage> {
  DeliveryTime _deliveryTime = DeliveryTime.nothingSelected;

  void toastMessageShort({String message = "default message"}) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.grey.shade600,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  List<AddOnCatgory> addOnItems = [
    AddOnCatgory(
        productId: 1,
        name: "Laundary Bag",
        description: "small",
        price: 00.00,
        isAdded: false,
        quantity: 1),
    AddOnCatgory(
        productId: 2,
        name: "Laundary Bag",
        description: "large",
        price: 00.00,
        isAdded: false,
        quantity: 1),
    AddOnCatgory(
        productId: 3,
        name: "Hanger",
        description: "for your wardrobe",
        price: 00.00,
        isAdded: false,
        quantity: 1),
    AddOnCatgory(
      productId: 4,
      name: "Suit Cover",
      description: "Regular",
      price: 00.00,
      isAdded: false,
      quantity: 1,
    ),
    AddOnCatgory(
        productId: 5,
        name: "Suit Cover",
        description: "Premium",
        price: 00.00,
        isAdded: false,
        quantity: 1),
    AddOnCatgory(
        productId: 6,
        name: "Wardrobe",
        description: "Collapsible",
        price: 00.00,
        isAdded: false,
        quantity: 1),
  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
            padding: EdgeInsets.only(left: 5),
            alignment: Alignment.centerLeft,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 40,
              color: bluegradientstartColor,
            )),
        centerTitle: true,
        title: FittedBox(
          child: Container(
            padding: EdgeInsets.only(right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BorderIcon(
                    isCompleted: true,
                    onPress: () {},
                    iconData: Icons.shopping_cart_outlined),
                Container(
                  width: MediaQuery.of(context).size.width / 5.5,
                  child: Divider(
                    thickness: 2,
                    color: bluegradientstartColor,
                  ),
                ),
                //LineW
                // DotWidget(
                //   dashColor: blueColormedium,
                //   dashWidth: 5,
                //   totalWidth: MediaQuery.of(context).size.width / 5.5,
                // ),
                BorderIcon(
                    isCompleted: true,
                    onPress: () {},
                    iconData: Icons.storefront_outlined),
                Container(
                  width: MediaQuery.of(context).size.width / 5.5,
                  child: Divider(
                    thickness: 2,
                    color: bluegradientstartColor,
                  ),
                ),
                BorderIcon(
                    isCompleted: false,
                    onPress: () {},
                    iconData: Icons.calendar_today_rounded),
                DotWidget(
                  dashColor: bluegradientstartColor,
                  dashWidth: 5,
                  totalWidth: MediaQuery.of(context).size.width / 5.5,
                ),
                BorderIcon(
                    isCompleted: false,
                    onPress: () {},
                    iconData: Icons.send_to_mobile_rounded),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage("assets/images/bodybg.png")),
        ),
        child: Stack(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PickUpDelivery(
                          icon: AssetImage("assets/images/Pickup.png"),
                          size: 40,
                          onPress: () {},
                          isSelected: false,
                          title: "Pickup",
                          subtitle: "(Time Slot)",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        PickUpDelivery(
                          size: 50,
                          icon: AssetImage("assets/images/Pickup2.png"),
                          onPress: () {
                            setState(() {});
                          },
                          isSelected: true,
                          title: "Delivery",
                          subtitle: "(Time Slot)",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: screenSize.width,
                        child: CustomCalender(
                          Date: serviceCatrogry != ServiceCatrogry.express
                              ? pickUpDate.add(Duration(days: 2))
                              : pickUpDate.add(Duration(days: 1)),
                          ispickuppage: false,
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.wb_twilight_rounded,
                                size: 45,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              DateTimeButton(
                                  isbold: false,
                                  isDisable: false,
                                  isSelected: _deliveryTime ==
                                      DeliveryTime.NineToEleven,
                                  onPress: () {
                                    setState(() {
                                      _deliveryTime = DeliveryTime.NineToEleven;
                                      deliveryTime = "9:00 AM - 11:00 AM";
                                    });
                                  },
                                  title: "9:00 AM - 11:00 AM",
                                  width:
                                      MediaQuery.of(context).size.width / 2.5)
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 120,
                              ),
                              DateTimeButton(
                                  isbold: false,
                                  isSelected:
                                      _deliveryTime == DeliveryTime.ElevenToOne,
                                  onPress: () {
                                    setState(() {
                                      _deliveryTime = DeliveryTime.ElevenToOne;
                                      deliveryTime = "11:00 AM - 1:00 PM";
                                    });
                                  },
                                  title: "11:00 AM - 1:00 PM",
                                  width:
                                      MediaQuery.of(context).size.width / 2.5)
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              DateTimeButton(
                                  isbold: false,
                                  isSelected:
                                      _deliveryTime == DeliveryTime.FourToFive,
                                  onPress: () {
                                    setState(() {
                                      _deliveryTime = DeliveryTime.FourToFive;
                                      deliveryTime = "04:00 PM - 05:30 PM";
                                    });
                                  },
                                  title: "04:00 PM - 05:30 PM",
                                  width:
                                      MediaQuery.of(context).size.width / 2.5),
                              SizedBox(
                                width: 15,
                              ),
                              Icon(
                                Icons.wb_sunny_rounded,
                                size: 45,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.brightness_2_rounded,
                                size: 45,
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              DateTimeButton(
                                  isbold: false,
                                  isSelected:
                                      _deliveryTime == DeliveryTime.FiveToSeven,
                                  onPress: () {
                                    setState(() {
                                      _deliveryTime = DeliveryTime.FiveToSeven;
                                      deliveryTime = "05:30 PM - 07:00 PM";
                                    });
                                  },
                                  title: "05:30 PM - 07:00 PM",
                                  width:
                                      MediaQuery.of(context).size.width / 2.5)
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 80,
                              ),
                              DateTimeButton(
                                  isbold: false,
                                  isSelected: _deliveryTime ==
                                      DeliveryTime.SevenToEight,
                                  onPress: () {
                                    setState(() {
                                      _deliveryTime = DeliveryTime.SevenToEight;
                                      deliveryTime = "07:00 PM - 8:30 PM";
                                    });
                                  },
                                  title: "07:00 PM - 8:30 PM",
                                  width:
                                      MediaQuery.of(context).size.width / 2.5)
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              DateTimeButton(
                                  isbold: false,
                                  isSelected:
                                      _deliveryTime == DeliveryTime.EightToTen,
                                  onPress: () {
                                    setState(() {
                                      _deliveryTime = DeliveryTime.EightToTen;
                                      deliveryTime = "08:30 PM - 10:00 PM";
                                    });
                                  },
                                  title: "08:30 PM - 10:00 PM",
                                  width:
                                      MediaQuery.of(context).size.width / 2.5)
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
              child: Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: CustomBottomBarButton(
                    isDisable:
                        isSelectedDeliveryDate == false || deliveryTime == "",
                    onpress: () {
                      if (isSelectedDeliveryDate && deliveryTime != "") {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return CustomPopUpMenu(
                                addOnItems: addOnItems,
                                category: "AddOn",
                                onPress: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: BookingSummaryPage()),
                                  );
                                },
                              );
                            });
                      }
                    },
                    title: "SCHEDULE DELIVERY",
                    width: screenSize.width,
                    height: 50,
                  )),
            ),
            //  SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
