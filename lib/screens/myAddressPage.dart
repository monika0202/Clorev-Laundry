import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomAlertBox.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/CustomMyAddress.dart';
import 'package:flutter_test_app/components/GradientButton.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/components/customTextField.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';
import 'package:flutter_test_app/modals/address.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAddressPage extends StatefulWidget {
  const MyAddressPage({Key? key}) : super(key: key);

  @override
  _MyAddressPageState createState() => _MyAddressPageState();
}

enum AddressCatrogry { home, office, other }

class _MyAddressPageState extends State<MyAddressPage> {
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
  int selectedAddress = -1;
  List<Address> address = [
    Address(
      flat_House_No: "1C,21",
      location: "Sector-2,Gole Market,New Delhi-110 001",
      landmark: "Peshwa Road",
      tag_address: "Home",
      isAdded: false,
    ),
    Address(
      flat_House_No: "31,2 Floor",
      location: "Sant Nagar,East of Kailash,New Delhi-110 065",
      landmark: "Kailash Colony Metro Station",
      tag_address: "Office",
      isAdded: false,
    ),
    Address(
      flat_House_No: "31,2 Floor",
      location: "Sant Nagar,East of Kailash,New Delhi-110 065",
      landmark: "Kailash Colony Metro Station",
      tag_address: "Home",
      isAdded: false,
    ),
    Address(
      flat_House_No: "31,2 Floor",
      location: "Sant Nagar,East of Kailash,New Delhi-110 065",
      landmark: "Kailash Colony Metro Station",
      tag_address: "Home",
      isAdded: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "My Addresses",
            style:
                TextStyle(fontFamily: 'helvetica', fontWeight: FontWeight.bold),
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
                child: Column(children: [
              InkWell(
                child: Container(
                  width: screenSize.width,
                  height: 45,
                  margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      border:
                          Border.all(color: bluegradientstartColor, width: 2),
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GradientIcon(
                        child: Icon(
                          Icons.add,
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Add New Address",
                        style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: address.length,
                      itemBuilder: (context, index) {
                        return CustomMyAddress(
                            flat_no: address[index].flat_House_No,
                            location: address[index].location,
                            landmark: address[index].landmark,
                            tag_address: address[index].tag_address,
                            isdefault: selectedAddress == index,
                            onPressEdit: () {
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
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            height: 40,
                                                            //width: screenSize.width / 1.5,
                                                            // margin: EdgeInsets.only(left: 15, right: 15),
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  colors: [
                                                                    bluegradientstartColor,
                                                                    bluegradientendColor
                                                                  ],
                                                                  begin: Alignment
                                                                      .topRight,
                                                                  end: Alignment
                                                                      .bottomLeft),
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10),
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
                                                                      fontSize:
                                                                          16,
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
                                                                  location =
                                                                      false;
                                                                });
                                                              },
                                                              onEditingCompleted:
                                                                  () {
                                                                setState(() {
                                                                  location =
                                                                      true;
                                                                });
                                                              },
                                                              controller:
                                                                  _locationController,
                                                              onsubmitted:
                                                                  (val) {
                                                                print("hello");
                                                                location = true;
                                                                _focusNodeLocation
                                                                    .unfocus();
                                                              },
                                                              labelText:
                                                                  "Your Chosen Location *",
                                                              completeEditing:
                                                                  location,
                                                              onChanged:
                                                                  (val) {}),
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
                                                              onEditingCompleted:
                                                                  () {
                                                                setState(() {
                                                                  floor = true;
                                                                  _focusNodefloor
                                                                      .unfocus();
                                                                });
                                                              },
                                                              controller:
                                                                  _floorController,
                                                              onsubmitted:
                                                                  (val) {},
                                                              completeEditing:
                                                                  floor,
                                                              labelText:
                                                                  "Flat/Floor No., House/Block No. *",
                                                              onChanged:
                                                                  (val) {}),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          CustomTextField(
                                                              focusNode:
                                                                  _focusNodeLandmark,
                                                              onTap: () {
                                                                setState(() {
                                                                  landmark =
                                                                      false;
                                                                });
                                                              },
                                                              onEditingCompleted:
                                                                  () {
                                                                setState(() {
                                                                  landmark =
                                                                      true;
                                                                  _focusNodeLandmark
                                                                      .unfocus();
                                                                });
                                                              },
                                                              controller:
                                                                  _landmarkController,
                                                              onsubmitted:
                                                                  (val) {},
                                                              completeEditing:
                                                                  landmark,
                                                              labelText:
                                                                  "Landmark (optional)",
                                                              onChanged:
                                                                  (val) {}),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          CustomTextField(
                                                              type:
                                                                  TextInputType
                                                                      .name,
                                                              focusNode:
                                                                  _focusNodeRecipientName,
                                                              onTap: () {
                                                                setState(() {
                                                                  floor = false;
                                                                });
                                                              },
                                                              onEditingCompleted:
                                                                  () {
                                                                setState(() {
                                                                  floor = true;
                                                                  _focusNodeRecipientName
                                                                      .unfocus();
                                                                });
                                                              },
                                                              controller:
                                                                  _recipientNameController,
                                                              onsubmitted:
                                                                  (val) {},
                                                              completeEditing:
                                                                  recipientName,
                                                              labelText:
                                                                  "Recipient Name *",
                                                              onChanged:
                                                                  (val) {}),
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
                                                              onEditingCompleted:
                                                                  () {
                                                                setState(() {
                                                                  email = true;
                                                                  _focusNodeEmail
                                                                      .unfocus();
                                                                });
                                                              },
                                                              controller:
                                                                  _emailController,
                                                              onsubmitted:
                                                                  (val) {},
                                                              completeEditing:
                                                                  email,
                                                              labelText:
                                                                  "Email ID *",
                                                              onChanged:
                                                                  (val) {}),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          GradientText(
                                                            isbold: false,
                                                            title:
                                                                "Tag this Address *",
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
                                                                    isSelected: _addressCatrogry ==
                                                                        AddressCatrogry
                                                                            .home,
                                                                    onPress:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        _addressCatrogry =
                                                                            AddressCatrogry.home;
                                                                      });
                                                                    },
                                                                    title:
                                                                        "Home",
                                                                    width: screenSize
                                                                            .width /
                                                                        4.5),
                                                                GradientButton(
                                                                    isSelected: _addressCatrogry ==
                                                                        AddressCatrogry
                                                                            .office,
                                                                    onPress:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        _addressCatrogry =
                                                                            AddressCatrogry.office;
                                                                      });
                                                                    },
                                                                    title:
                                                                        "Office",
                                                                    width: screenSize
                                                                            .width /
                                                                        4.5),
                                                                GradientButton(
                                                                    isSelected: _addressCatrogry ==
                                                                        AddressCatrogry
                                                                            .other,
                                                                    onPress:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        _addressCatrogry =
                                                                            AddressCatrogry.other;
                                                                      });
                                                                    },
                                                                    title:
                                                                        "Other",
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
                                                                        setState(
                                                                            () {
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
                                                                      TextAlign
                                                                          .justify,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
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
                            onPressRemove: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomAlertBox(
                                      removeTitle: "REMOVE",
                                      keepTitle: "KEEP",
                                      description:
                                          "Are you sure want to remove  ${address[index].flat_House_No} ${address[index].location} ${address[index].location} ?",
                                      onPressRemove: () {
                                        address.removeAt(index);

                                        this.setState(() {});
                                        Navigator.of(context).pop();
                                      },
                                      onPressKeep: () {
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  });
                            },
                            onPressDefault: () {
                              setState(() {
                                selectedAddress = index;
                              });
                            });
                      }))
            ]))));
  }
}
