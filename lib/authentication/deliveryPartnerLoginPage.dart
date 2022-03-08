import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/api/ApiUrl.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/CustomLoginButton.dart';
import 'package:flutter_test_app/components/GradientButton.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/components/customTextField.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';
import 'package:flutter_test_app/modals/bankDetails.dart';
import 'package:flutter_test_app/modals/deliveryPartnerUser.dart';
import 'package:flutter_test_app/screens/DeliveryPartner/deliveryPartnerMainPage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:uuid/uuid.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;

import 'package:path/path.dart' as path;

class DeliveryPartnerLogingPage extends StatefulWidget {
  const DeliveryPartnerLogingPage({Key? key}) : super(key: key);

  @override
  _DeliveryPartnerLogingPageState createState() =>
      _DeliveryPartnerLogingPageState();
}

late DeliveryPartnerUser user = DeliveryPartnerUser(
    name: "",
    mobileNumber: 0,
    emailID: "",
    alternateMobileNo: "",
    weeklyOff: "",
    preferredServiceTime: [],
    designation: "",
    professionalDetails: ProfessionalDetails(
        aadhaarNo: 0, drivingLicenceNo: "", panNo: "", pfAccountNo: ""),
    bankDetails: BankDetails(accountHolderName: "", accountNo: 0, IFScode: ""));

class _DeliveryPartnerLogingPageState extends State<DeliveryPartnerLogingPage> {
  String dropdownvalue = "DEL";
  String week = "MON";
  bool istermPrivacy = false;
  bool isremember = true;
  bool isvisible = false;
  bool isObsecure = true;
  bool isweekdays = false;
  bool isweekend = false;

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
  XFile? _aadhaarFile;
  XFile? _drivingLicenceFile;
  XFile? _panFile;
  XFile? _pfAccountFile;
  XFile? _accountFile;

  TextEditingController providerID = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailIDController = TextEditingController();
  TextEditingController alternateMobileController = TextEditingController();
  TextEditingController aadhaarNoController = TextEditingController();
  TextEditingController licenceNoController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController pfAccountNoController = TextEditingController();
  TextEditingController password = TextEditingController();

  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController accountNoController = TextEditingController();
  TextEditingController ifsCodeController = TextEditingController();
  FocusNode _focusNodeProviderID = FocusNode();
  FocusNode _focusNodeMobileNumber = FocusNode();
  FocusNode _focusNodeEmailID = FocusNode();
  FocusNode _focusNodeAlternateMobile = FocusNode();
  FocusNode _focusNodeAadhaarNo = FocusNode();
  FocusNode _focusNodeLicenceNo = FocusNode();
  FocusNode _focusNodePan = FocusNode();
  FocusNode _focusNodePFAccountNo = FocusNode();
  FocusNode _focusNodeName = FocusNode();
  FocusNode _focusNodeAccountHolderName = FocusNode();
  FocusNode _focusNodeAccountNo = FocusNode();
  FocusNode _focusNodeIfsCode = FocusNode();

  bool _isMobileNumberEditingComplete = false;
  bool _isNameEditingComplete = false;
  bool _isEmailIDEditingComplete = false;
  bool _isAlternateMobileEditingComplete = false;
  bool _isAadhaarNoEditingComplete = false;
  bool _isLicenceNoEditingComplete = false;
  bool _isPanEditingComplete = false;
  bool _ispfAccountNoEditingComplete = false;

  bool _isAccountHolderNameEditingComplete = false;
  bool _isAccountNoEditingComplete = false;
  bool _isIfsCodeEditingComplete = false;

  FocusNode _focusNodePassword = FocusNode();

  final ImagePicker _picker = ImagePicker();
//pick image from camera

  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  int _markerIdCounter = 0;
  Completer<GoogleMapController> _mapController = Completer();
  bool popMessage = true;
  bool isRegister = false;
  bool isSelectedAddress = false;
  var uuid = new Uuid();
  String _sessionToken = "";
  List<dynamic> _placeList = [];

  TextEditingController _controller = TextEditingController();

  bool isSelected = false;
  Future deliveryPartnerUploadFiles(
      {XFile? img,
      required file,
      required String vendorId,
      required String url}) async {
    if (img != null) {
      String fileName = path.basename(img.path);
      print(img.path);

      dio.FormData formData = dio.FormData.fromMap({
        file: await dio.MultipartFile.fromFile(
          img.path,
          filename: fileName,
          headers: {
            'Content-Type': ['application/json']
          },
        ),
        "vendorId": vendorId
      });

      var response = await dio.Dio().post(ApiUrl.baseurl + url,
          data: formData,
          options: dio.Options(
            headers: {'Content-Type': 'application/json'},
          ));

      print("File upload response: ${response.statusCode}");
    }
  }

  Future deliveryPartnerRegistration(DeliveryPartnerUser user) async {
    print("hello");
    print(user.preferredServiceTime);
    print(jsonEncode(user));
    var response = await http.post(Uri.parse(ApiUrl.baseurl + "registerVendor"),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode({
          "accountHolderName": user.bankDetails.accountHolderName,
          "accountNumber": user.bankDetails.accountNo,
          "altMobileNumber": user.mobileNumber,
          "branchIfscCode": user.bankDetails.IFScode,
          "designation": user.designation,
          "emailId": user.emailID,
          "aadharNo": user.professionalDetails.aadhaarNo,
          "mobileNumber": user.alternateMobileNo,
          "name": user.name,
          "panNumber": user.professionalDetails.panNo,
          "serviceOffered": user.preferredServiceTime,
          "drivingLicenceNo": user.professionalDetails.drivingLicenceNo,
          "pfAccountNo": user.professionalDetails.pfAccountNo,
          "weeklyOff": user.weeklyOff
        }));

    print("hello");

    // if (response.body.isNotEmpty) {
    //   print(json.decode(response.body));
    // }

    print("Response status: ${response.statusCode}");

    if (response.statusCode == 200) {
      print("successful");
      print(response.body);
      deliveryPartnerUploadFiles(
          img: _aadhaarFile,
          file: "aadhaarFile",
          vendorId: response.body,
          url: "uploadShopFile");
      deliveryPartnerUploadFiles(
          img: _drivingLicenceFile,
          file: "drivingLicenceFile",
          vendorId: response.body,
          url: "uploadDrivingLicenceFile");

      deliveryPartnerUploadFiles(
          img: _panFile,
          file: "panFile",
          vendorId: response.body,
          url: "uploadPanFile");

      deliveryPartnerUploadFiles(
          img: _pfAccountFile,
          file: "pfAccountFile",
          vendorId: response.body,
          url: "uploadPfAccountFile");

      deliveryPartnerUploadFiles(
          img: _accountFile,
          file: "accountFile",
          vendorId: response.body,
          url: "uploadAccountFile");
    }
  }

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

                  user.weeklyOff = week;
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

  @override
  void initState() {
    // TODO: implement initState
    user.weeklyOff = "Mon";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              onPressed: () {
                Navigator.of(context).pop(); //   log("back button");
                //   toastMessageShort(message: "Back Button Pressed");
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 40,
                color: Colors.white,
              )),
          centerTitle: true,
          title: Text(
            "Welcome to Delivery Partner Login Page",
            style: TextStyle(
                fontFamily: 'helvetica',
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [bluegradientstartColor, bluegradientendColor],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft))),
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
                height: screenSize.height,
                width: screenSize.width,
                child: SingleChildScrollView(
                    child: Form(
                        child: Column(children: [
                  Container(
                      height: 45,
                      margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                      padding: EdgeInsets.all(10),
                      width: screenSize.width,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0, 3))
                          ],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: bluegradientstartColor, width: 1)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 40,
                              child: Text(
                                "CRP-",
                                style: TextStyle(fontFamily: 'helvetica'),
                              ),
                            ),
                            Container(
                              height: 45,
                              width: 1,
                              color: Colors.grey[500],
                            ),
                            Container(
                              width: 130,
                              margin: EdgeInsets.only(left: 15, right: 15),
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                focusNode: _focusNodeProviderID,
                                controller: providerID,
                                onTap: () {
                                  setState(() {
                                    _focusNodeProviderID.requestFocus();
                                  });
                                },
                                onFieldSubmitted: (val) {
                                  setState(() {
                                    _focusNodeProviderID.unfocus();
                                  });
                                },
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 5, bottom: 8),
                                  border: InputBorder.none,
                                  hintText: "Enter Partner ID * ",
                                ),
                              ),
                            ),
                            Container(
                              height: 45,
                              width: 1,
                              color: Colors.grey[500],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 0),
                              width: 55,
                              child: DropdownButton<String>(
                                  focusColor: bluegradientstartColor,
                                  value: dropdownvalue,
                                  underline: Container(),
                                  icon:
                                      const Icon(Icons.arrow_drop_down_rounded),
                                  items: ["DEL"].map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      dropdownvalue = value!;
                                    });
                                  }),
                            )
                          ])),
                  Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "By Continuing, you agree to the ",
                              style: TextStyle(
                                  fontSize: 14, fontFamily: "Helvetica"),
                            ),
                            GradientText(
                              title: "Terms of Use",
                              isUnderline: true,
                              isbold: false,
                              textSize: 14,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                " and ",
                                style: TextStyle(
                                    fontSize: 14, fontFamily: "Helvetica"),
                              ),
                              GradientText(
                                title: "Privacy Policy",
                                isUnderline: true,
                                isbold: false,
                                textSize: 14,
                              ),
                              Text(" of CLOREV Laundry",
                                  style: TextStyle(
                                      fontSize: 14, fontFamily: "Helvetica"))
                            ])
                      ])),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 45,
                    margin: EdgeInsets.only(left: 15, right: 15),
                    width: screenSize.width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(0, 3))
                        ],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: bluegradientstartColor, width: 1)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 0, top: 5),
                          width: screenSize.width - 150,
                          child: PinPut(
                              // obscureText: "",
                              obscureText: isObsecure ? "*" : null,
                              controller: password,
                              fieldsCount: 6,
                              textStyle: const TextStyle(
                                  fontSize: 17.0, fontFamily: 'helvetica'),
                              eachFieldWidth: 5,
                              // eachFieldHeight: 45.0,
                              eachFieldConstraints:
                                  BoxConstraints(minWidth: 25),
                              focusNode: _focusNodePassword,
                              selectedFieldDecoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey[500]!, width: 1)),
                              ),
                              followingFieldDecoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey[500]!, width: 1)),
                              ),
                              onChanged: (value) {}),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: InkWell(
                            child: Icon(
                              isObsecure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onTap: () {
                              setState(() {
                                isObsecure = !isObsecure;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: screenSize.width,
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: Row(children: [
                              InkWell(
                                  child: isremember
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
                                      isremember = !isremember;
                                    });
                                  }),
                              SizedBox(width: 5),
                              Text(
                                "Remember Me",
                                style: TextStyle(
                                    fontSize: 15, fontFamily: "Helvetica"),
                              )
                            ])),
                            Row(
                              children: [
                                GradientText(
                                  title: "Forgot Password ",
                                  isbold: false,
                                  isUnderline: true,
                                  textSize: 15,
                                ),
                                GradientText(
                                  title: "?",
                                  isbold: false,
                                  textSize: 15,
                                ),
                              ],
                            )
                          ])),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: screenSize.width,
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        LoginButtons(
                          isDisable: true,
                          title: "Login",
                          isLoginButton: true,
                          isShadow: true,
                          width: MediaQuery.of(context).size.width * .4,
                          icon: Icons.login_rounded,
                          onpress: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: screenSize.width,
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: FittedBox(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Divider(
                                thickness: 1,
                                color: bluegradientstartColor,
                              ),
                            ),
                            InkWell(
                              child: GradientText(
                                title: "or Register here  ",
                                isbold: false,
                                isUnderline: false,
                                textSize: 17,
                                isItalic: true,
                              ),
                              onTap: () {
                                setState(() {
                                  isRegister = !isRegister;
                                });
                              },
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Divider(
                                thickness: 1,
                                color: bluegradientstartColor,
                              ),
                            )
                          ]))),
                  SizedBox(
                    height: 20,
                  ),
                  Visibility(
                      visible: isRegister,
                      child: Column(children: [
                        Container(
                          width: screenSize.width,
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            children: [
                              FaIcon(FontAwesomeIcons.userTie, size: 20),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                "Personal Information",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'helvetica',
                                    color: darkGreyColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          width: screenSize.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: ToggleSwitch(
                                  minHeight: 30,
                                  minWidth: 45,
                                  initialLabelIndex: 0,
                                  borderColor: [bluegradientstartColor],
                                  borderWidth: 1,
                                  inactiveBgColor: whiteColor,
                                  activeBgColor: [
                                    bluegradientstartColor,
                                    bluegradientendColor
                                  ],
                                  totalSwitches: 2,
                                  labels: ["Mr.", "Ms."],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: CustomTextField(
                                      controller: nameController,
                                      labelText: "Your Name *",
                                      type: TextInputType.name,
                                      onChanged: (val) {
                                        setState(() {
                                          user.name = nameController.text;
                                        });
                                      },
                                      onsubmitted: (val) {
                                        setState(() {
                                          _focusNodeName.unfocus();
                                          _isNameEditingComplete = true;

                                          user.name = nameController.text;
                                        });
                                      },
                                      completeEditing: _isNameEditingComplete,
                                      onEditingCompleted: () {},
                                      onTap: () {
                                        setState(() {
                                          _focusNodeName.requestFocus();
                                        });
                                      },
                                      focusNode: _focusNodeName)),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                            width: screenSize.width,
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: CustomTextField(
                                controller: mobileNumberController,
                                labelText: "Mobile Number *",
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                inputFormat: [
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                type: TextInputType.phone,
                                onChanged: (val) {
                                  setState(() {
                                    user.mobileNumber =
                                        int.parse(mobileNumberController.text);
                                  });
                                },
                                onsubmitted: (val) {
                                  setState(() {
                                    _focusNodeMobileNumber.unfocus();
                                    _isMobileNumberEditingComplete = true;
                                    user.mobileNumber =
                                        int.parse(mobileNumberController.text);
                                  });
                                },
                                completeEditing: _isMobileNumberEditingComplete,
                                onEditingCompleted: () {},
                                onTap: () {
                                  setState(() {
                                    _focusNodeMobileNumber.requestFocus();
                                  });
                                },
                                focusNode: _focusNodeMobileNumber)),
                        SizedBox(height: 15),
                        Container(
                            width: screenSize.width,
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: CustomTextField(
                                controller: emailIDController,
                                labelText: "Email ID *",
                                type: TextInputType.emailAddress,
                                onChanged: (val) {
                                  setState(() {
                                    user.emailID = emailIDController.text;
                                  });
                                },
                                onsubmitted: (val) {
                                  setState(() {
                                    _focusNodeEmailID.unfocus();
                                    _isEmailIDEditingComplete = true;
                                    user.emailID = emailIDController.text;
                                  });
                                },
                                completeEditing: _isEmailIDEditingComplete,
                                onEditingCompleted: () {},
                                onTap: () {
                                  setState(() {
                                    _focusNodeEmailID.requestFocus();
                                  });
                                },
                                focusNode: _focusNodeEmailID)),
                        SizedBox(height: 15),
                        Container(
                            width: screenSize.width,
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: CustomTextField(
                                controller: alternateMobileController,
                                labelText: "Alternate Mob Number (Optional)",
                                onChanged: (val) {
                                  setState(() {
                                    user.alternateMobileNo =
                                        alternateMobileController.text;
                                  });
                                },
                                type: TextInputType.phone,
                                onsubmitted: (val) {
                                  setState(() {
                                    _focusNodeAlternateMobile.unfocus();
                                    _isAlternateMobileEditingComplete = true;
                                    user.alternateMobileNo =
                                        alternateMobileController.text;
                                  });
                                },
                                completeEditing:
                                    _isAlternateMobileEditingComplete,
                                onEditingCompleted: () {},
                                onTap: () {
                                  setState(() {
                                    _focusNodeAlternateMobile.requestFocus();
                                  });
                                },
                                focusNode: _focusNodeAlternateMobile)),
                        SizedBox(height: 20),
                        Container(
                            width: screenSize.width,
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.briefcase,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Text("Professional Details",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'helvetica',
                                              color: darkGreyColor)),
                                    ],
                                  ),
                                  Container(
                                      width: 120,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Upload",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'helvetica',
                                                  color:
                                                      bluegradientstartColor),
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Docs",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'helvetica',
                                                        color:
                                                            bluegradientstartColor),
                                                  ),
                                                  Icon(
                                                    Icons.info_outline_rounded,
                                                    color:
                                                        bluegradientstartColor,
                                                    size: 15,
                                                  )
                                                ])
                                          ]))
                                ])),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: screenSize.width,
                            margin: EdgeInsets.only(left: 15, right: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: screenSize.width - 130,
                                      child: CustomTextField(
                                          labelText: "Aadhaar No *",
                                          completeEditing:
                                              _isAadhaarNoEditingComplete,
                                          focusNode: _focusNodeAadhaarNo,
                                          controller: aadhaarNoController,
                                          onChanged: (val) {
                                            setState(() {
                                              user.professionalDetails
                                                      .aadhaarNo =
                                                  int.parse(
                                                      aadhaarNoController.text);
                                            });
                                          },
                                          type: TextInputType.number,
                                          onEditingCompleted: () {},
                                          onsubmitted: (val) {
                                            setState(() {
                                              _isAadhaarNoEditingComplete =
                                                  true;
                                              _focusNodeAadhaarNo.unfocus();
                                              user.professionalDetails
                                                      .aadhaarNo =
                                                  int.parse(
                                                      aadhaarNoController.text);
                                            });
                                          },
                                          onTap: () {
                                            setState(() {
                                              _focusNodeAadhaarNo
                                                  .requestFocus();
                                            });
                                          })),
                                  _aadhaarFile == null
                                      ? Container(
                                          margin: EdgeInsets.only(left: 15),
                                          child: Row(children: [
                                            InkWell(
                                              child: Icon(
                                                Icons.camera_alt_rounded,
                                                size: 40,
                                              ),
                                              onTap: () async {
                                                XFile? image =
                                                    await _picker.pickImage(
                                                        source:
                                                            ImageSource.camera);
                                                setState(() {
                                                  _aadhaarFile = image;
                                                });
                                              },
                                            ),
                                            SizedBox(width: 5),
                                            InkWell(
                                              child: Icon(
                                                Icons.upload_file_rounded,
                                                size: 40,
                                              ),
                                              onTap: () async {
                                                XFile? image =
                                                    await _picker.pickImage(
                                                        source: ImageSource
                                                            .gallery);
                                                setState(() {
                                                  _aadhaarFile = image;
                                                });
                                              },
                                            )
                                          ]))
                                      : Container(
                                          height: 45,
                                          width: 85,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                bottom: 0,
                                                left: 0,
                                                child: Image.file(
                                                  File(_aadhaarFile!.path),
                                                  fit: BoxFit.fill,
                                                  height: 45,
                                                  width: 85,
                                                ),
                                              ),
                                              Positioned(
                                                  top: 2,
                                                  right: 2,
                                                  child: InkWell(
                                                    child: CircleAvatar(
                                                      radius: 10,
                                                      backgroundColor:
                                                          blackColor,
                                                      child: Icon(
                                                        Icons.close_outlined,
                                                        color: whiteColor,
                                                        size: 14,
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        _aadhaarFile = null;
                                                      });
                                                    },
                                                  )),
                                            ],
                                          ))
                                ])),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            width: screenSize.width,
                            margin: EdgeInsets.only(left: 15, right: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: screenSize.width - 130,
                                      child: CustomTextField(
                                          labelText: "Driving Licence No *",
                                          completeEditing:
                                              _isLicenceNoEditingComplete,
                                          focusNode: _focusNodeLicenceNo,
                                          controller: licenceNoController,
                                          onChanged: (val) {
                                            setState(() {
                                              user.professionalDetails
                                                      .drivingLicenceNo =
                                                  licenceNoController.text;
                                            });
                                          },
                                          onEditingCompleted: () {},
                                          type: TextInputType.name,
                                          onsubmitted: (val) {
                                            setState(() {
                                              _isLicenceNoEditingComplete =
                                                  true;
                                              _focusNodeLicenceNo.unfocus();
                                              user.professionalDetails
                                                      .drivingLicenceNo =
                                                  licenceNoController.text;
                                            });
                                          },
                                          onTap: () {
                                            setState(() {
                                              _focusNodeLicenceNo
                                                  .requestFocus();
                                            });
                                          })),
                                  _drivingLicenceFile == null
                                      ? Container(
                                          margin: EdgeInsets.only(left: 15),
                                          child: Row(children: [
                                            InkWell(
                                              child: Icon(
                                                Icons.camera_alt_rounded,
                                                size: 40,
                                              ),
                                              onTap: () async {
                                                XFile? image =
                                                    await _picker.pickImage(
                                                        source:
                                                            ImageSource.camera);
                                                setState(() {
                                                  _drivingLicenceFile = image;
                                                });
                                              },
                                            ),
                                            SizedBox(width: 5),
                                            InkWell(
                                              child: Icon(
                                                Icons.upload_file_rounded,
                                                size: 40,
                                              ),
                                              onTap: () async {
                                                XFile? image =
                                                    await _picker.pickImage(
                                                        source: ImageSource
                                                            .gallery);
                                                setState(() {
                                                  _drivingLicenceFile = image;
                                                });
                                              },
                                            )
                                          ]))
                                      : Container(
                                          height: 45,
                                          width: 85,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                bottom: 0,
                                                left: 0,
                                                child: Image.file(
                                                  File(_drivingLicenceFile!
                                                      .path),
                                                  fit: BoxFit.fill,
                                                  height: 45,
                                                  width: 85,
                                                ),
                                              ),
                                              Positioned(
                                                  top: 2,
                                                  right: 2,
                                                  child: InkWell(
                                                    child: CircleAvatar(
                                                      radius: 10,
                                                      backgroundColor:
                                                          blackColor,
                                                      child: Icon(
                                                        Icons.close_outlined,
                                                        color: whiteColor,
                                                        size: 14,
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        _drivingLicenceFile =
                                                            null;
                                                      });
                                                    },
                                                  )),
                                            ],
                                          ))
                                ])),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            width: screenSize.width,
                            margin: EdgeInsets.only(left: 15, right: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: screenSize.width - 130,
                                      child: CustomTextField(
                                          labelText: "PAN *",
                                          completeEditing:
                                              _isPanEditingComplete,
                                          focusNode: _focusNodePan,
                                          controller: panController,
                                          onChanged: (val) {
                                            setState(() {
                                              user.professionalDetails.panNo =
                                                  panController.text;
                                            });
                                          },
                                          type: TextInputType.name,
                                          onEditingCompleted: () {},
                                          onsubmitted: (val) {
                                            setState(() {
                                              _isPanEditingComplete = true;
                                              _focusNodePan.unfocus();
                                              user.professionalDetails.panNo =
                                                  panController.text;
                                            });
                                          },
                                          onTap: () {
                                            setState(() {
                                              _focusNodePan.requestFocus();
                                            });
                                          })),
                                  _panFile == null
                                      ? Container(
                                          margin: EdgeInsets.only(left: 15),
                                          child: Row(children: [
                                            InkWell(
                                              child: Icon(
                                                Icons.camera_alt_rounded,
                                                size: 40,
                                              ),
                                              onTap: () async {
                                                XFile? image =
                                                    await _picker.pickImage(
                                                        source:
                                                            ImageSource.camera);
                                                setState(() {
                                                  _panFile = image;
                                                });
                                              },
                                            ),
                                            SizedBox(width: 5),
                                            InkWell(
                                              child: Icon(
                                                Icons.upload_file_rounded,
                                                size: 40,
                                              ),
                                              onTap: () async {
                                                XFile? image =
                                                    await _picker.pickImage(
                                                        source: ImageSource
                                                            .gallery);
                                                setState(() {
                                                  _panFile = image;
                                                });
                                              },
                                            )
                                          ]))
                                      : Container(
                                          height: 45,
                                          width: 85,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                bottom: 0,
                                                left: 0,
                                                child: Image.file(
                                                  File(_panFile!.path),
                                                  fit: BoxFit.fill,
                                                  height: 45,
                                                  width: 85,
                                                ),
                                              ),
                                              Positioned(
                                                  top: 2,
                                                  right: 2,
                                                  child: InkWell(
                                                    child: CircleAvatar(
                                                      radius: 10,
                                                      backgroundColor:
                                                          blackColor,
                                                      child: Icon(
                                                        Icons.close_outlined,
                                                        color: whiteColor,
                                                        size: 14,
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        _panFile = null;
                                                      });
                                                    },
                                                  )),
                                            ],
                                          ))
                                ])),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            width: screenSize.width,
                            margin: EdgeInsets.only(left: 15, right: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: screenSize.width - 130,
                                      child: CustomTextField(
                                          labelText: "PF Account No (Optional)",
                                          completeEditing:
                                              _ispfAccountNoEditingComplete,
                                          focusNode: _focusNodePFAccountNo,
                                          controller: pfAccountNoController,
                                          onChanged: (val) {
                                            setState(() {
                                              user.professionalDetails
                                                      .pfAccountNo =
                                                  pfAccountNoController.text;
                                            });
                                          },
                                          onEditingCompleted: () {},
                                          type: TextInputType.name,
                                          onsubmitted: (val) {
                                            setState(() {
                                              _ispfAccountNoEditingComplete =
                                                  true;
                                              _focusNodePFAccountNo.unfocus();
                                              user.professionalDetails
                                                      .pfAccountNo =
                                                  pfAccountNoController.text;
                                            });
                                          },
                                          onTap: () {
                                            setState(() {
                                              _focusNodePFAccountNo
                                                  .requestFocus();
                                            });
                                          })),
                                  _pfAccountFile == null
                                      ? Container(
                                          margin: EdgeInsets.only(left: 15),
                                          child: Row(children: [
                                            InkWell(
                                              child: Icon(
                                                Icons.camera_alt_rounded,
                                                size: 40,
                                              ),
                                              onTap: () async {
                                                XFile? image =
                                                    await _picker.pickImage(
                                                        source:
                                                            ImageSource.camera);
                                                setState(() {
                                                  _pfAccountFile = image;
                                                });
                                              },
                                            ),
                                            SizedBox(width: 5),
                                            InkWell(
                                              child: Icon(
                                                Icons.upload_file_rounded,
                                                size: 40,
                                              ),
                                              onTap: () async {
                                                XFile? image =
                                                    await _picker.pickImage(
                                                        source: ImageSource
                                                            .gallery);
                                                setState(() {
                                                  _pfAccountFile = image;
                                                });
                                              },
                                            )
                                          ]))
                                      : Container(
                                          height: 45,
                                          width: 85,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                bottom: 0,
                                                left: 0,
                                                child: Image.file(
                                                  File(_pfAccountFile!.path),
                                                  fit: BoxFit.fill,
                                                  height: 45,
                                                  width: 85,
                                                ),
                                              ),
                                              Positioned(
                                                  top: 2,
                                                  right: 2,
                                                  child: InkWell(
                                                    child: CircleAvatar(
                                                      radius: 10,
                                                      backgroundColor:
                                                          blackColor,
                                                      child: Icon(
                                                        Icons.close_outlined,
                                                        color: whiteColor,
                                                        size: 14,
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        _pfAccountFile = null;
                                                      });
                                                    },
                                                  )),
                                            ],
                                          ))
                                ])),
                        SizedBox(height: 20),
                        Container(
                          width: screenSize.width,
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.university,
                                size: 20,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                "Bank Details",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'helvetica',
                                    color: darkGreyColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: screenSize.width,
                          margin: EdgeInsets.only(left: 15, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: screenSize.width - 130,
                                  child: Column(children: [
                                    Container(
                                        child: CustomTextField(
                                            controller:
                                                accountHolderNameController,
                                            type: TextInputType.name,
                                            labelText: "Account Holder Name *",
                                            onChanged: (val) {
                                              setState(() {
                                                user.bankDetails
                                                        .accountHolderName =
                                                    accountHolderNameController
                                                        .text;
                                              });
                                            },
                                            onsubmitted: (val) {
                                              setState(() {
                                                _focusNodeAccountHolderName
                                                    .unfocus();
                                                _isAccountHolderNameEditingComplete =
                                                    true;

                                                user.bankDetails
                                                        .accountHolderName =
                                                    accountHolderNameController
                                                        .text;
                                              });
                                            },
                                            completeEditing:
                                                _isAccountHolderNameEditingComplete,
                                            onEditingCompleted: () {},
                                            onTap: () {
                                              setState(() {
                                                _focusNodeAccountHolderName
                                                    .requestFocus();
                                              });
                                            },
                                            focusNode:
                                                _focusNodeAccountHolderName)),
                                    SizedBox(height: 15),
                                    Container(
                                        child: CustomTextField(
                                            controller: accountNoController,
                                            type: TextInputType.number,
                                            labelText: "Account Number *",
                                            onChanged: (val) {
                                              setState(() {
                                                user.bankDetails.accountNo =
                                                    int.parse(
                                                        accountNoController
                                                            .text);
                                              });
                                            },
                                            onsubmitted: (val) {
                                              setState(() {
                                                _focusNodeAccountNo.unfocus();
                                                _isAccountNoEditingComplete =
                                                    true;
                                                user.bankDetails.accountNo =
                                                    int.parse(
                                                        accountNoController
                                                            .text);
                                              });
                                            },
                                            completeEditing:
                                                _isAccountNoEditingComplete,
                                            onEditingCompleted: () {},
                                            onTap: () {
                                              setState(() {
                                                _focusNodeAccountNo
                                                    .requestFocus();
                                              });
                                            },
                                            focusNode: _focusNodeAccountNo)),
                                    SizedBox(height: 15),
                                    Container(
                                        child: CustomTextField(
                                            controller: ifsCodeController,
                                            type: TextInputType.name,
                                            labelText: "Branch IFS Code*",
                                            onChanged: (val) {
                                              setState(() {
                                                user.bankDetails.IFScode =
                                                    ifsCodeController.text;
                                              });
                                            },
                                            onsubmitted: (val) {
                                              setState(() {
                                                _focusNodeIfsCode.unfocus();
                                                _isIfsCodeEditingComplete =
                                                    true;
                                                user.bankDetails.IFScode =
                                                    ifsCodeController.text;
                                              });
                                            },
                                            completeEditing:
                                                _isIfsCodeEditingComplete,
                                            onEditingCompleted: () {},
                                            onTap: () {
                                              setState(() {
                                                _focusNodeIfsCode
                                                    .requestFocus();
                                              });
                                            },
                                            focusNode: _focusNodeIfsCode)),
                                  ])),
                              Container(
                                width: 85,
                                margin: EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    _accountFile == null
                                        ? Container(
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                InkWell(
                                                  child: Icon(
                                                    Icons.camera_alt_rounded,
                                                    size: 40,
                                                  ),
                                                  onTap: () async {
                                                    XFile? image =
                                                        await _picker.pickImage(
                                                            source: ImageSource
                                                                .camera);
                                                    setState(() {
                                                      _accountFile = image;
                                                    });
                                                  },
                                                ),
                                                SizedBox(width: 5),
                                                InkWell(
                                                  child: Icon(
                                                      Icons.upload_file_rounded,
                                                      size: 40),
                                                  onTap: () async {
                                                    XFile? image =
                                                        await _picker.pickImage(
                                                            source: ImageSource
                                                                .gallery);
                                                    setState(() {
                                                      _accountFile = image;
                                                    });
                                                  },
                                                )
                                              ]))
                                        : Container(
                                            height: 45,
                                            width: 85,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  bottom: 0,
                                                  left: 0,
                                                  child: Image.file(
                                                    File(_accountFile!.path),
                                                    fit: BoxFit.fill,
                                                    height: 45,
                                                    width: 85,
                                                  ),
                                                ),
                                                Positioned(
                                                    top: 2,
                                                    right: 2,
                                                    child: InkWell(
                                                      child: CircleAvatar(
                                                        radius: 10,
                                                        backgroundColor:
                                                            blackColor,
                                                        child: Icon(
                                                          Icons.close_outlined,
                                                          color: whiteColor,
                                                          size: 14,
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        setState(() {
                                                          _accountFile = null;
                                                        });
                                                      },
                                                    )),
                                              ],
                                            )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "(Upload image of Cancelled Cheque or Passbook)",
                                      maxLines: 6,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "Helvetica"),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                            width: screenSize.width,
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: Row(children: [
                              FaIcon(FontAwesomeIcons.list, size: 20),
                              SizedBox(width: 7),
                              Text("Preferred Service Time",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'helvetica',
                                      color: darkGreyColor))
                            ])),
                        SizedBox(height: 15),
                        Container(
                            width: screenSize.width,
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: Column(children: [
                              Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                    GradientButton(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.3,
                                        title: "Weekdays (Mon-Thu)",
                                        onPress: () {
                                          setState(() {
                                            isweekdays = !isweekdays;
                                            if (isweekdays) {
                                              user.preferredServiceTime
                                                  .add("Weekdays (Mon-Thu)");
                                            } else {
                                              user.preferredServiceTime
                                                  .removeWhere((element) =>
                                                      element ==
                                                      "Weekdays (Mon-Thu)");
                                            }
                                          });
                                        },
                                        isSelected: isweekdays),
                                    GradientButton(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.3,
                                        title: "Weekend (Fri-Sun)",
                                        onPress: () {
                                          setState(() {
                                            isweekend = !isweekend;
                                            if (isweekend) {
                                              user.preferredServiceTime
                                                  .add("Weekend (Fri-Sun)");
                                            } else {
                                              user.preferredServiceTime
                                                  .removeWhere((element) =>
                                                      element ==
                                                      "Weekend (Fri-Sun)");
                                            }
                                          });
                                        },
                                        isSelected: isweekend),
                                  ]))
                            ])),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            width: screenSize.width,
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GradientText(
                                    title: "When you wish to take weekly off ?",
                                    textSize: 14,
                                    isbold: true,
                                  ),
                                  Container(
                                      height: 35,
                                      width: 90,
                                      padding: EdgeInsets.all(10),
                                      alignment: Alignment.center,
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
                                ])),
                        SizedBox(height: 20),
                        SizedBox(height: 15),
                        CustomBottomBarButton(
                          height: 50,
                          width: screenSize.width,
                          isDisable: false,
                          onpress: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: DeliveryPartnerMainPage()));
                          },
                          title: "SUBMIT",
                        ),
                        SizedBox(height: 15),
                      ]))
                ]))))));
  }
}
