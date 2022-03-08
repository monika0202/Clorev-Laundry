import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/authentication/serviceProviderLoginPage.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/components/customTextField.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test_app/api/ApiUrl.dart';

class ServiceProviderBuisnessInformation extends StatefulWidget {
  const ServiceProviderBuisnessInformation({Key? key}) : super(key: key);

  @override
  _ServiceProviderBuisnessInformationState createState() =>
      _ServiceProviderBuisnessInformationState();
}

class _ServiceProviderBuisnessInformationState
    extends State<ServiceProviderBuisnessInformation> {
  String week = user.weeklyOff!;

  List<Text> weekDays = [
    Text("MON",
        style: TextStyle(
          fontFamily: 'helvetica',
        )),
    Text("TUE",
        style: TextStyle(
          fontFamily: 'helvetica',
        )),
    Text("WED",
        style: TextStyle(
          fontFamily: 'helvetica',
        )),
    Text("THU",
        style: TextStyle(
          fontFamily: 'helvetica',
        )),
    Text("FRI",
        style: TextStyle(
          fontFamily: 'helvetica',
        )),
    Text("SAT",
        style: TextStyle(
          fontFamily: 'helvetica',
        )),
    Text("SUN",
        style: TextStyle(
          fontFamily: 'helvetica',
        )),
  ];
  FocusNode _focusNodeShopName = FocusNode();
  FocusNode _focusNodeGstin = FocusNode();
  FocusNode _focusNodePan = FocusNode();
  FocusNode _focusNodeUamNo = FocusNode();
  FocusNode _focusNodeServicesOffered = FocusNode();

  bool _isEditingCompleteShopName = true;
  bool _isEditingCompleteGstin = true;
  bool _isEditingCompletePan = true;
  bool _isEditingCompleteUamNo = true;
  bool _isEditingCompleteServiceOffered = true;

  TextEditingController _controllerShopName = TextEditingController()
    ..text = user.businessInformation.shopName;
  TextEditingController _controllerGstin = TextEditingController()
    ..text = user.businessInformation.GSTIN;
  TextEditingController _controllerPan = TextEditingController()
    ..text = user.businessInformation.panNo;
  TextEditingController _controllerUamNo = TextEditingController()
    ..text = "XXXXXXXXXXX";
  TextEditingController _controllerServicesOffered = TextEditingController()
    ..text = user.serviceoffered.toString();

  TextEditingController _controller = TextEditingController()
    ..text = "Laundry | Dry-cleaning | Steam Pess";

  void showPicker() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
              height: MediaQuery.of(context).copyWith().size.height * 0.25,
              color: Colors.white,
              child: CupertinoPicker(
                children: weekDays,
                onSelectedItemChanged: (value) {
                  Text text = weekDays[value];
                  week = text.data.toString();
                  setState(() {});
                },
                itemExtent: 25,
                diameterRatio: 1,
                useMagnifier: true,
                magnification: 1.3,
                looping: true,
              ));
        });
  }

  Future serviceProviderGetImage() async {
    print("hello");
    var response = await http.get(Uri.parse(ApiUrl.baseurl + "shopFiles/6"));

    print(response.statusCode);
    print(response.body);
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Business Information",
            style:
                TextStyle(fontWeight: FontWeight.bold, fontFamily: 'helvetica'),
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
            child: Stack(fit: StackFit.expand, children: [
              SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Container(
                      height: 600,
                      padding: EdgeInsets.all(10),
                      width: screenSize.width,
                      margin: EdgeInsets.all(15),
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
                      child: Form(
                          key: formkey,
                          autovalidateMode: AutovalidateMode.always,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 50,
                                    width: screenSize.width,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("CRL-009(DEL)",
                                              style: TextStyle(
                                                  color: darkGreyColor,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'helvetica'))
                                        ])),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                    width: screenSize.width,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GradientText(
                                              title: "Change Passcode",
                                              isbold: false,
                                              isUnderline: true)
                                        ])),
                                SizedBox(height: 20),
                                Container(
                                    width: screenSize.width,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              width: screenSize.width - 110,
                                              child: CustomTextField(
                                                  labelText: "Shop Name *",
                                                  completeEditing:
                                                      _isEditingCompleteShopName,
                                                  focusNode: _focusNodeShopName,
                                                  controller:
                                                      _controllerShopName,
                                                  readOnly: true,
                                                  onChanged: (val) {},
                                                  onEditingCompleted: () {},
                                                  onsubmitted: (val) {
                                                    setState(() {
                                                      _isEditingCompleteShopName =
                                                          true;
                                                      _focusNodeShopName
                                                          .unfocus();
                                                    });
                                                  },
                                                  onTap: () {
                                                    setState(() {
                                                      _focusNodeShopName
                                                          .requestFocus();
                                                    });
                                                  })),
                                          Container(
                                              margin: EdgeInsets.only(left: 15),
                                              child: Icon(
                                                Icons.picture_as_pdf,
                                                size: 45,
                                              ))
                                        ])),
                                SizedBox(height: 15),
                                Container(
                                    width: screenSize.width,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              width: screenSize.width - 110,
                                              child: CustomTextField(
                                                  labelText: "GSTIN *",
                                                  readOnly: true,
                                                  completeEditing:
                                                      _isEditingCompleteGstin,
                                                  focusNode: _focusNodeGstin,
                                                  controller: _controllerGstin,
                                                  onChanged: (val) {},
                                                  onEditingCompleted: () {},
                                                  onsubmitted: (val) {
                                                    setState(() {
                                                      _isEditingCompleteGstin =
                                                          true;
                                                      _focusNodeGstin.unfocus();
                                                    });
                                                  },
                                                  onTap: () {
                                                    setState(() {
                                                      _focusNodeGstin
                                                          .requestFocus();
                                                    });
                                                  })),
                                          InkWell(
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 15),
                                                child: Icon(
                                                  Icons.picture_as_pdf,
                                                  size: 45,
                                                )),
                                            onTap: () {
                                              serviceProviderGetImage();
                                            },
                                          )
                                        ])),
                                SizedBox(height: 15),
                                Container(
                                    width: screenSize.width,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              width: screenSize.width - 110,
                                              child: CustomTextField(
                                                  labelText: "PAN *",
                                                  completeEditing:
                                                      _isEditingCompletePan,
                                                  focusNode: _focusNodePan,
                                                  controller: _controllerPan,
                                                  onChanged: (val) {},
                                                  onEditingCompleted: () {},
                                                  onsubmitted: (val) {
                                                    setState(() {
                                                      _isEditingCompletePan =
                                                          true;
                                                      _focusNodePan.unfocus();
                                                    });
                                                  },
                                                  onTap: () {
                                                    setState(() {
                                                      _focusNodePan
                                                          .requestFocus();
                                                    });
                                                  })),
                                          Container(
                                              margin: EdgeInsets.only(left: 15),
                                              child: Icon(
                                                Icons.picture_as_pdf,
                                                size: 45,
                                              ))
                                        ])),
                                SizedBox(height: 15),
                                Container(
                                  width: screenSize.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          width: screenSize.width - 110,
                                          child: CustomTextField(
                                              labelText: "UAM No *",
                                              readOnly: true,
                                              completeEditing:
                                                  _isEditingCompleteUamNo,
                                              focusNode: _focusNodeUamNo,
                                              controller: _controllerUamNo,
                                              onChanged: (val) {},
                                              onEditingCompleted: () {},
                                              onsubmitted: (val) {
                                                setState(() {
                                                  _isEditingCompleteUamNo =
                                                      true;
                                                  _focusNodeUamNo.unfocus();
                                                });
                                              },
                                              onTap: () {
                                                setState(() {
                                                  _focusNodeUamNo
                                                      .requestFocus();
                                                });
                                              })),
                                      Container(
                                          margin: EdgeInsets.only(left: 15),
                                          child: Icon(
                                            Icons.picture_as_pdf,
                                            size: 45,
                                          ))
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),
                                Container(
                                    width: screenSize.width,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                              width: screenSize.width - 50,
                                              child: CustomTextField(
                                                  labelText:
                                                      "Services Offered *",
                                                  readOnly: true,
                                                  completeEditing:
                                                      _isEditingCompleteServiceOffered,
                                                  focusNode:
                                                      _focusNodeServicesOffered,
                                                  controller:
                                                      _controllerServicesOffered,
                                                  onChanged: (val) {},
                                                  onEditingCompleted: () {},
                                                  onsubmitted: (val) {
                                                    setState(() {
                                                      _isEditingCompleteServiceOffered =
                                                          true;
                                                      _focusNodeServicesOffered
                                                          .unfocus();
                                                    });
                                                  },
                                                  onTap: () {
                                                    setState(() {
                                                      _focusNodeShopName
                                                          .requestFocus();
                                                    });
                                                  }))
                                        ])),
                                SizedBox(height: 15),
                                Container(
                                    width: screenSize.width,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              child: Column(children: [
                                            Text("Express Delivery",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'helvetica',
                                                    color: Colors.grey[500])),
                                            SizedBox(height: 5),
                                            Transform.translate(
                                                offset: Offset(-5, 0),
                                                child: Container(
                                                  child: ToggleSwitch(
                                                    minHeight: 30,
                                                    minWidth: 45,
                                                    initialLabelIndex: 0,
                                                    borderColor: [
                                                      bluegradientstartColor
                                                    ],
                                                    borderWidth: 1,
                                                    inactiveBgColor: whiteColor,
                                                    activeBgColor: [
                                                      bluegradientstartColor,
                                                      bluegradientendColor
                                                    ],
                                                    totalSwitches: 2,
                                                    labels: ["No", "Yes"],
                                                    onToggle: (val) {
                                                      setState(() {
                                                        val == 0
                                                            ? user.expressDelivery =
                                                                false
                                                            : user.expressDelivery =
                                                                true;
                                                      });
                                                    },
                                                  ),
                                                )),
                                          ])),
                                          Container(
                                              child: Column(children: [
                                            Text("Weekly off",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'helvetica',
                                                    color: Colors.grey[500])),
                                            SizedBox(height: 5),
                                            Container(
                                                height: 35,
                                                width: 90,
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    color: whiteColor,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          spreadRadius: 2,
                                                          blurRadius: 7,
                                                          offset: Offset(0, 3))
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color:
                                                            bluegradientstartColor,
                                                        width: 1)),
                                                child: InkWell(
                                                  onTap: () {
                                                    showPicker();
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("$week",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'helvetica',
                                                          )),
                                                      Transform.translate(
                                                          offset: Offset(5, -5),
                                                          child: Icon(Icons
                                                              .arrow_drop_down)),
                                                    ],
                                                  ),
                                                ))
                                          ]))
                                        ])),
                              ])))),
              Visibility(
                  visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                  child: Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: CustomBottomBarButton(
                        isDisable: false,
                        onpress: () {},
                        title: "SAVE DETAILS",
                      )))
            ])));
  }
}
