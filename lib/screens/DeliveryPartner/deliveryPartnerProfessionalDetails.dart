import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/authentication/deliveryPartnerLoginPage.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/components/customTextField.dart';

class DeliveryPartnerProfessionalDetails extends StatefulWidget {
  const DeliveryPartnerProfessionalDetails({Key? key}) : super(key: key);

  @override
  _DeliveryPartnerProfessionalDetailsState createState() =>
      _DeliveryPartnerProfessionalDetailsState();
}

class _DeliveryPartnerProfessionalDetailsState
    extends State<DeliveryPartnerProfessionalDetails> {
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

  void showPicker() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
              height: 200,
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
                magnification: 1.1,
                looping: true,
                selectionOverlay: Column(
                  children: [
                    Container(
                      color: Colors.grey[500]!.withOpacity(0.3),
                    ),
                  ],
                ),
              ));
        });
  }

  FocusNode _focusNodeAadhaarNo = FocusNode();
  FocusNode _focusNodeDrivingLicenceNo = FocusNode();
  FocusNode _focusNodePan = FocusNode();
  FocusNode _focusNodePfAccountNo = FocusNode();
  FocusNode _focusNodePreferredServiceTime = FocusNode();

  bool _isEditingCompleteAadhaarNo = true;
  bool _isEditingCompleteDrivingLicenceNo = true;
  bool _isEditingCompletePan = true;
  bool _isEditingCompletePfAccountNo = true;
  bool _isEditingCompletePreferredServiceTime = true;

  TextEditingController _controllerAadhaarNo = TextEditingController()
    ..text = user.professionalDetails.aadhaarNo.toString();
  TextEditingController _controllerDrivingLicenceNo = TextEditingController()
    ..text = user.professionalDetails.drivingLicenceNo;
  TextEditingController _controllerPan = TextEditingController()
    ..text = user.professionalDetails.panNo;
  TextEditingController _controllerPfAccountNo = TextEditingController()
    ..text = user.professionalDetails.pfAccountNo!;
  TextEditingController _controllerPreferredServiceTime =
      TextEditingController()..text = user.preferredServiceTime.toString();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Professionl Details",
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
                                                  labelText: "Aadhaar No *",
                                                  completeEditing:
                                                      _isEditingCompleteAadhaarNo,
                                                  focusNode:
                                                      _focusNodeAadhaarNo,
                                                  controller:
                                                      _controllerAadhaarNo,
                                                  onChanged: (val) {},
                                                  onEditingCompleted: () {},
                                                  onsubmitted: (val) {
                                                    setState(() {
                                                      _isEditingCompleteAadhaarNo =
                                                          true;
                                                      _focusNodeAadhaarNo
                                                          .unfocus();
                                                    });
                                                  },
                                                  onTap: () {
                                                    setState(() {
                                                      _focusNodeAadhaarNo
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
                                                  labelText:
                                                      "Driving Licence No *",
                                                  completeEditing:
                                                      _isEditingCompleteDrivingLicenceNo,
                                                  focusNode:
                                                      _focusNodeDrivingLicenceNo,
                                                  controller:
                                                      _controllerDrivingLicenceNo,
                                                  onChanged: (val) {},
                                                  onEditingCompleted: () {},
                                                  onsubmitted: (val) {
                                                    setState(() {
                                                      _isEditingCompleteDrivingLicenceNo =
                                                          true;
                                                      _focusNodeDrivingLicenceNo
                                                          .unfocus();
                                                    });
                                                  },
                                                  onTap: () {
                                                    setState(() {
                                                      _focusNodeDrivingLicenceNo
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
                                              labelText: "PF Account No *",
                                              completeEditing:
                                                  _isEditingCompletePfAccountNo,
                                              focusNode: _focusNodePfAccountNo,
                                              controller:
                                                  _controllerPfAccountNo,
                                              onChanged: (val) {},
                                              onEditingCompleted: () {},
                                              onsubmitted: (val) {
                                                setState(() {
                                                  _isEditingCompletePfAccountNo =
                                                      true;
                                                  _focusNodePfAccountNo
                                                      .unfocus();
                                                });
                                              },
                                              onTap: () {
                                                setState(() {
                                                  _focusNodePfAccountNo
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
                                                      "Preferred Service Time *",
                                                  completeEditing:
                                                      _isEditingCompletePreferredServiceTime,
                                                  focusNode:
                                                      _focusNodePreferredServiceTime,
                                                  controller:
                                                      _controllerPreferredServiceTime,
                                                  onChanged: (val) {},
                                                  onEditingCompleted: () {},
                                                  onsubmitted: (val) {
                                                    setState(() {
                                                      _isEditingCompletePreferredServiceTime =
                                                          true;
                                                      _focusNodePreferredServiceTime
                                                          .unfocus();
                                                    });
                                                  },
                                                  onTap: () {
                                                    setState(() {
                                                      _focusNodePreferredServiceTime
                                                          .requestFocus();
                                                    });
                                                  }))
                                        ])),
                                SizedBox(height: 15),
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
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: bluegradientstartColor,
                                              width: 1)),
                                      child: InkWell(
                                        onTap: () {
                                          showPicker();
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("$week",
                                                style: TextStyle(
                                                  fontFamily: 'helvetica',
                                                )),
                                            Transform.translate(
                                                offset: Offset(5, -5),
                                                child: Icon(Icons
                                                    .arrow_drop_down_rounded)),
                                          ],
                                        ),
                                      ))
                                ]))
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
