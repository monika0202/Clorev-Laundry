import 'dart:developer';
import 'package:flutter_test_app/components/BorderIcon.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/CustomCalender.dart';
import 'package:flutter_test_app/components/CustomPickUpDelivery.dart';
import 'package:flutter_test_app/components/customtimebutton.dart';
import 'package:flutter_test_app/modals/AddOnCategory.dart';
import 'package:flutter_test_app/components/CustomPopUp.dart';
import 'package:flutter_test_app/screens/DeliveryPage.dart';
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

class PickUpPage extends StatefulWidget {
  const PickUpPage({Key? key}) : super(key: key);

  @override
  _PickUpPageState createState() => _PickUpPageState();
}

String pickUpTime = "";
enum PickUpTime {
  NineToEleven,
  ElevenToOne,
  FourToFive,
  FiveToSeven,
  SevenToEight,
  EightToTen,
  nothingSelected,
}
bool isSelectedPickUpDate = false;

class _PickUpPageState extends State<PickUpPage> {
  PickUpTime _pickUpTimeEnum = PickUpTime.nothingSelected;
  void toastMessageShort({String message = "default message"}) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.grey.shade600,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void initState() {
    pickUpTime = "";

    isSelectedPickUpDate = false;
  }

  DateTime selectedDate = DateTime.now();
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
          // alignment: Alignment.topCenter,
          children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
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
                          isSelected: true,
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
                          isSelected: false,
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
                      child: Row(
                        children: [
                          CustomCalender(
                            Date: serviceCatrogry == ServiceCatrogry.express
                                ? selectedDate
                                : selectedDate.add(Duration(days: 1)),
                            ispickuppage: true,
                          ),
                        ],
                      ),
                    ),
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
                                  isSelected: _pickUpTimeEnum ==
                                      PickUpTime.NineToEleven,
                                  onPress: () {
                                    setState(() {
                                      _pickUpTimeEnum = PickUpTime.NineToEleven;
                                      pickUpTime = "9:00 AM - 11:00 AM";
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
                                      _pickUpTimeEnum == PickUpTime.ElevenToOne,
                                  onPress: () {
                                    setState(() {
                                      _pickUpTimeEnum = PickUpTime.ElevenToOne;
                                      pickUpTime = "11:00 AM - 1:00 PM";
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
                                      _pickUpTimeEnum == PickUpTime.FourToFive,
                                  onPress: () {
                                    setState(() {
                                      _pickUpTimeEnum = PickUpTime.FourToFive;
                                      pickUpTime = "04:00 PM - 05:30 PM";
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
                              InkWell(
                                child: Icon(
                                  Icons.brightness_2_rounded,
                                  size: 45,
                                ),
                                onTap: () {
                                  print(pickUpTime);
                                  print(isSelectedPickUpDate);
                                  print(isSelectedPickUpDate == false ||
                                      pickUpTime == "");
                                },
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              DateTimeButton(
                                  isbold: false,
                                  isSelected:
                                      _pickUpTimeEnum == PickUpTime.FiveToSeven,
                                  onPress: () {
                                    setState(() {
                                      _pickUpTimeEnum = PickUpTime.FiveToSeven;
                                      pickUpTime = "05:30 PM - 07:00 PM";
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
                                  isSelected: _pickUpTimeEnum ==
                                      PickUpTime.SevenToEight,
                                  onPress: () {
                                    setState(() {
                                      _pickUpTimeEnum = PickUpTime.SevenToEight;
                                      pickUpTime = "07:00 PM - 8:30 PM";
                                      print(pickUpTime);
                                      print(isSelectedPickUpDate);
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
                                      _pickUpTimeEnum == PickUpTime.EightToTen,
                                  onPress: () {
                                    setState(() {
                                      _pickUpTimeEnum = PickUpTime.EightToTen;
                                      pickUpTime = "08:30 PM - 10:00 PM";
                                      print(pickUpTime);
                                      print(isSelectedPickUpDate);
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
                        isSelectedPickUpDate == false || pickUpTime == "",
                    onpress: () {
                      if (isSelectedPickUpDate && pickUpTime != "") {
                        print(pickUpDate);
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: DeliveryPage()));
                      }
                    },
                    title: "SCHEDULE PICK-UP",
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
