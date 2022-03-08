import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/api/ApiUrl.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';
import 'package:flutter_test_app/modals/bankDetails.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter_test_app/modals/serviceProviderUser.dart';
import 'package:flutter_test_app/screens/ServiceProvider/serviceProviderMainPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_webservice/geolocation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/BorderIcon.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/CustomLoginButton.dart';
import 'package:flutter_test_app/components/DotWidget.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/GradientButton.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/components/customTextField.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;

import 'package:path/path.dart' as path;

class ServiceProviderLoginPage extends StatefulWidget {
  const ServiceProviderLoginPage({Key? key}) : super(key: key);

  @override
  _ServiceProviderLoginPageState createState() =>
      _ServiceProviderLoginPageState();
}

enum LaundryCategory {
  laundry,
  dryCleaning,
  streamPress,
  leathercare,
  FugmigationAndSanitisation
}

late ServiceProviderUser user = ServiceProviderUser(
    name: "",
    designation: "",
    emailID: "",
    mobileNumber: 0,
    alternateMobileNo: "",
    address1: "",
    address2: "",
    landmark: "",
    weeklyOff: "",
    serviceoffered: [],
    businessInformation:
        BusinessInformation(shopName: "", GSTIN: "", panNo: "", msmeNo: ""),
    bankDetails: BankDetails(accountHolderName: "", accountNo: 0, IFScode: ""));

class _ServiceProviderLoginPageState extends State<ServiceProviderLoginPage> {
  String dropdownvalue = "DEL";
  String designation = "Mr";
  String week = "Mon";
  String laundry = "";
  String dryCleaning = "";
  String streamPress = "";
  String leatherCare = "";
  List<Text> weekDays = [
    Text("Mon",
        style: TextStyle(
          fontFamily: 'helvetica',
        )),
    Text("Tue",
        style: TextStyle(
          fontFamily: 'helvetica',
        )),
    Text("Wed",
        style: TextStyle(
          fontFamily: 'helvetica',
        )),
    Text("Thu",
        style: TextStyle(
          fontFamily: 'helvetica',
        )),
    Text("Fri",
        style: TextStyle(
          fontFamily: 'helvetica',
        )),
    Text("Sat",
        style: TextStyle(
          fontFamily: 'helvetica',
        )),
    Text("Sun",
        style: TextStyle(
          fontFamily: 'helvetica',
        )),
  ];
  bool istermPrivacy = false;
  bool isremember = true;
  bool isvisible = false;
  bool isObsecure = true;
  bool isSelectedLaundry = false;
  bool isSelectedDryCleaning = false;
  bool isSelectedSteamPress = false;
  bool isSelectedLeatherCare = false;
  bool isSelectedSanitisation = false;
  TextEditingController providerID = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailIDController = TextEditingController();
  TextEditingController alternateMobileController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController gstinController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController msemeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController accountNoController = TextEditingController();
  TextEditingController ifsCodeController = TextEditingController();
  FocusNode _focusNodeProviderID = FocusNode();
  FocusNode _focusNodeMobileNumber = FocusNode();
  FocusNode _focusNodeEmailID = FocusNode();
  FocusNode _focusNodeAlternateMobile = FocusNode();
  FocusNode _focusNodeShopName = FocusNode();
  FocusNode _focusNodeGstin = FocusNode();
  FocusNode _focusNodePan = FocusNode();
  FocusNode _focusNodeMseme = FocusNode();
  FocusNode _focusNodeName = FocusNode();
  FocusNode _focusNodeAccountHolderName = FocusNode();
  FocusNode _focusNodeAccountNo = FocusNode();
  FocusNode _focusNodeIfsCode = FocusNode();

  bool _isMobileNumberEditingComplete = false;
  bool _isNameEditingComplete = false;
  bool _isEmailIDEditingComplete = false;
  bool _isAlternateMobileEditingComplete = false;
  bool _isShopNameEditingComplete = false;
  bool _isGstinEditingComplete = false;
  bool _isPanEditingComplete = false;
  bool _isMsemeEditingComplete = false;

  bool _isAccountHolderNameEditingComplete = false;
  bool _isAccountNoEditingComplete = false;
  bool _isIfsCodeEditingComplete = false;

  FocusNode _focusNodePassword = FocusNode();

  final ImagePicker _picker = ImagePicker();

  XFile? _shopFile;
  XFile? _panFile;
  XFile? _msmeFile;
  XFile? _gstinFile;
  XFile? _accountFile;

  int toggle = 0;

  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  int _markerIdCounter = 0;
  Completer<GoogleMapController> _mapController = Completer();
  bool popMessage = true;

  bool isSelectedAddress = false;
  bool isRegister = false;
  var uuid = new Uuid();
  String _sessionToken = "";
  List<dynamic> _placeList = [];

  TextEditingController _controller = TextEditingController();
  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(27.6602292, 85.308027);
  LatLng taplocation = LatLng(27.6602292, 85.308027);
  bool isSelected = false;
  String googleApikey = "AIzaSyA6q3Kd-rupAD-cieBCxwRhmx69FtR_cCg";
  String tapAddress = "";

  String _markerIdVal({bool increment = false}) {
    String val = 'marker_id_$_markerIdCounter';
    if (increment) _markerIdCounter++;
    return val;
  }

  void _onMapCreated(GoogleMapController controller) async {
    _mapController.complete(controller);
    if ([29.196722308032882, 77.95953489840029] != null) {
      MarkerId markerId = MarkerId(_markerIdVal());
      LatLng position = LatLng(29.196722308032882, 77.95953489840029);
      Marker marker = Marker(
        markerId: markerId,
        position: position,
        draggable: false,
        onTap: () async {
          // List<Placemark> placemarks =
          //     await placemarkFromCoordinates(taplocation);
        },
        onDragEnd: (val) {
          setState(() {
            popMessage = true;
          });
        },
      );
      setState(() {
        _markers[markerId] = marker;
      });

      Future.delayed(Duration(seconds: 1), () async {
        GoogleMapController controller = await _mapController.future;
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: position,
              zoom: 15,
            ),
          ),
        );
      });
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

  // Future check() async {
  //   var response = await http.get(
  //     Uri.parse("http://10.0.2.2:5000/clorev/registerVendor"),
  //     headers: <String, String>{'Content-Type': 'application/json'},
  //   );
  // }

  Future serviceProviderUploadFiles(
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

      // Show the incoming message in snakbar

    }
  }

  Future serviceProviderRegistration(ServiceProviderUser user) async {
    print("hello");
    print(user.serviceoffered);
    print(jsonEncode(user));
    var response = await http.post(Uri.parse(ApiUrl.baseurl + "registerVendor"),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode({
          "accountHolderName": user.bankDetails.accountHolderName,
          "accountNumber": user.bankDetails.accountNo,
          "address1": user.address1,
          "address2": user.address2,
          "altMobileNumber": user.mobileNumber,
          "branchIfscCode": user.bankDetails.IFScode,
          "designation": user.designation,
          "emailId": user.emailID,
          "expressDeliveryFlag": user.expressDelivery,
          "gstin": user.businessInformation.GSTIN,
          "landmark": user.landmark,
          "mobileNumber": user.alternateMobileNo,
          "name": user.name,
          "panNumber": user.businessInformation.panNo,
          "serviceOffered": user.serviceoffered,
          "shopName": user.businessInformation.shopName,
          "uamNumber": user.businessInformation.msmeNo,
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
      serviceProviderUploadFiles(
          img: _shopFile,
          file: "shopFile",
          vendorId: response.body,
          url: "uploadShopFile");

      serviceProviderUploadFiles(
          img: _gstinFile,
          file: "gstinFile",
          vendorId: response.body,
          url: "uploadGstinFile");

      serviceProviderUploadFiles(
          img: _panFile,
          file: "panFile",
          vendorId: response.body,
          url: "uploadPanFile");

      serviceProviderUploadFiles(
          img: _msmeFile,
          file: "msmeFile",
          vendorId: response.body,
          url: "uploadMsmeFile");
      serviceProviderUploadFiles(
          img: _accountFile,
          file: "accountFile",
          vendorId: response.body,
          url: "uploadAccountFile");
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    user.designation = "Mr";
    user.address1 = "adress1";
    user.address2 = "adress2";
    user.landmark = "landmark";
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
          centerTitle: false,
          title: FittedBox(
            child: Text(
              "Welcome to Service Provider Login Page",
              style: TextStyle(
                  fontFamily: 'helvetica',
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
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
                                "CRL-",
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
                                  hintText: "Enter Vendor ID * ",
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
                    child: Column(
                      children: [
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
                            Text(
                              " of CLOREV Laundry",
                              style: TextStyle(
                                  fontSize: 14, fontFamily: "Helvetica"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
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
                              controller: passwordController,
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
                          isShadow: true,
                          isLoginButton: true,
                          width: MediaQuery.of(context).size.width * .4,
                          icon: Icons.login_rounded,
                          onpress: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
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
                              // Icon(Icons.person, color: darkGreyColor),
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
                                  onToggle: (val) {
                                    setState(() {
                                      val == 0
                                          ? designation = "Mr"
                                          : designation = "Mrs";
                                      user.designation = designation;
                                    });
                                  },
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
                                  Expanded(
                                    child: Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.briefcase,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text("Business Information",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'helvetica',
                                                color: darkGreyColor)),
                                      ],
                                    ),
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
                                                color: bluegradientstartColor),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Docs",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'helvetica',
                                                    color:
                                                        bluegradientstartColor),
                                              ),
                                              Icon(
                                                Icons.info_outline_rounded,
                                                color: bluegradientstartColor,
                                                size: 15,
                                              ),
                                            ],
                                          )
                                        ]),
                                  )
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
                                          labelText: "Shop Name *",
                                          completeEditing:
                                              _isShopNameEditingComplete,
                                          focusNode: _focusNodeShopName,
                                          type: TextInputType.name,
                                          controller: shopNameController,
                                          onChanged: (val) {
                                            setState(() {
                                              user.businessInformation
                                                      .shopName =
                                                  shopNameController.text;
                                            });
                                          },
                                          onEditingCompleted: () {},
                                          onsubmitted: (val) {
                                            setState(() {
                                              _isShopNameEditingComplete = true;
                                              _focusNodeShopName.unfocus();
                                              user.businessInformation
                                                      .shopName =
                                                  shopNameController.text;
                                            });
                                          },
                                          onTap: () {
                                            setState(() {
                                              _focusNodeShopName.requestFocus();
                                            });
                                          })),
                                  _shopFile == null
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
                                                  _shopFile = image;
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
                                                  _shopFile = image;
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
                                                  File(_shopFile!.path),
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
                                                        _shopFile = null;
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
                                          labelText: "GSTIN *",
                                          type: TextInputType.name,
                                          completeEditing:
                                              _isGstinEditingComplete,
                                          focusNode: _focusNodeGstin,
                                          controller: gstinController,
                                          onChanged: (val) {
                                            setState(() {
                                              user.businessInformation.GSTIN =
                                                  gstinController.text;
                                            });
                                          },
                                          onEditingCompleted: () {},
                                          onsubmitted: (val) {
                                            setState(() {
                                              _isGstinEditingComplete = true;
                                              _focusNodeGstin.unfocus();
                                              user.businessInformation.GSTIN =
                                                  gstinController.text;
                                            });
                                          },
                                          onTap: () {
                                            setState(() {
                                              _focusNodeGstin.requestFocus();
                                            });
                                          })),
                                  _gstinFile == null
                                      ? Container(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                    _gstinFile = image;
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
                                                    _gstinFile = image;
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
                                                  File(_gstinFile!.path),
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
                                                        _gstinFile = null;
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
                                          type: TextInputType.name,
                                          completeEditing:
                                              _isPanEditingComplete,
                                          focusNode: _focusNodePan,
                                          controller: panController,
                                          onChanged: (val) {
                                            setState(() {
                                              user.businessInformation.panNo =
                                                  panController.text;
                                            });
                                          },
                                          onEditingCompleted: () {},
                                          onsubmitted: (val) {
                                            setState(() {
                                              _isPanEditingComplete = true;
                                              _focusNodePan.unfocus();
                                              user.businessInformation.panNo =
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
                                                      source:
                                                          ImageSource.gallery);
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
                                          labelText: "MSME Reg. No (Optional)",
                                          type: TextInputType.name,
                                          completeEditing:
                                              _isMsemeEditingComplete,
                                          focusNode: _focusNodeMseme,
                                          controller: msemeController,
                                          onChanged: (val) {
                                            setState(() {
                                              user.businessInformation.msmeNo =
                                                  msemeController.text;
                                            });
                                          },
                                          onEditingCompleted: () {},
                                          onsubmitted: (val) {
                                            setState(() {
                                              _isMsemeEditingComplete = true;
                                              _focusNodeMseme.unfocus();
                                              user.businessInformation.msmeNo =
                                                  msemeController.text;
                                            });
                                          },
                                          onTap: () {
                                            setState(() {
                                              _focusNodeMseme.requestFocus();
                                            });
                                          })),
                                  _msmeFile == null
                                      ? Container(
                                          child: Row(
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
                                                    _msmeFile = image;
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
                                                    _msmeFile = image;
                                                  });
                                                },
                                              )
                                            ],
                                          ),
                                        )
                                      : Container(
                                          height: 45,
                                          width: 85,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                bottom: 0,
                                                left: 0,
                                                child: Image.file(
                                                  File(_msmeFile!.path),
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
                                                        _msmeFile = null;
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
                                            labelText: "Account Holder Name *",
                                            onChanged: (val) {
                                              setState(() {
                                                user.bankDetails
                                                        .accountHolderName =
                                                    accountHolderNameController
                                                        .text;
                                              });
                                            },
                                            type: TextInputType.name,
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
                                            labelText: "Account Number *",
                                            type: TextInputType.number,
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
                                            labelText: "Branch IFS Code *",
                                            onChanged: (val) {
                                              setState(() {
                                                user.bankDetails.IFScode =
                                                    ifsCodeController.text;
                                              });
                                            },
                                            type: TextInputType.name,
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
                              Text("Services Offered",
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
                                          MediaQuery.of(context).size.width / 4,
                                      title: "Laundry",
                                      onPress: () {
                                        setState(() {
                                          isSelectedLaundry =
                                              !isSelectedLaundry;

                                          if (isSelectedLaundry) {
                                            laundry = "Laundry |";
                                            user.serviceoffered.add("Laundry");
                                          } else {
                                            laundry = "";
                                            user.serviceoffered.removeWhere(
                                                (element) =>
                                                    element == "Laundry");
                                          }
                                        });
                                      },
                                      isSelected: isSelectedLaundry,
                                    ),
                                    GradientButton(
                                      width: MediaQuery.of(context).size.width /
                                          3.5,
                                      title: "Dry-Cleaning",
                                      onPress: () {
                                        setState(() {
                                          isSelectedDryCleaning =
                                              !isSelectedDryCleaning;
                                          if (isSelectedDryCleaning) {
                                            dryCleaning = "Dry-Cleaning |";
                                            user.serviceoffered
                                                .add("Dry-Cleaning");
                                          } else {
                                            dryCleaning = "";
                                            user.serviceoffered.removeWhere(
                                                (element) =>
                                                    element == "Dry-Cleaning");
                                          }
                                        });
                                      },
                                      isSelected: isSelectedDryCleaning,
                                    ),
                                    GradientButton(
                                      width: MediaQuery.of(context).size.width /
                                          3.5,
                                      title: "Steam Press",
                                      onPress: () {
                                        setState(() {
                                          isSelectedSteamPress =
                                              !isSelectedSteamPress;
                                          if (isSelectedSteamPress) {
                                            streamPress = "Steam Press |";
                                            user.serviceoffered
                                                .add("Steam Press");
                                          } else {
                                            streamPress = "";
                                            user.serviceoffered.removeWhere(
                                                (element) =>
                                                    element == "Steam Press");
                                          }
                                        });
                                      },
                                      isSelected: isSelectedSteamPress,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                  width: screenSize.width,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GradientButton(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          title: "Shoe & Leather Care",
                                          onPress: () {
                                            setState(() {
                                              isSelectedLeatherCare =
                                                  !isSelectedLeatherCare;
                                              if (isSelectedLeatherCare) {
                                                leatherCare =
                                                    "Shoe & Leather Care";
                                                user.serviceoffered
                                                    .add("LeatherCare");
                                              } else {
                                                laundry = "";
                                                user.serviceoffered.removeWhere(
                                                    (element) =>
                                                        element ==
                                                        "LeatherCare");
                                              }
                                            });
                                          },
                                          isSelected: isSelectedLeatherCare,
                                        ),
                                      ]))
                            ])),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            child: GradientText(
                                          title:
                                              "Do you offer Express Delivery ?",
                                          textSize: 14,
                                          isbold: true,
                                        )),
                                        GradientText(
                                            title:
                                                "(Average lead time 24-36 hrs)",
                                            textSize: 14,
                                            isbold: false)
                                      ]),
                                  Container(
                                    child: ToggleSwitch(
                                      minHeight: 30,
                                      minWidth: 45,
                                      initialLabelIndex: toggle,
                                      borderColor: [bluegradientstartColor],
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
                                          toggle = val!;
                                          val == 0
                                              ? user.expressDelivery = false
                                              : user.expressDelivery = true;
                                        });
                                      },
                                    ),
                                  ),
                                ])),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            width: screenSize.width,
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GradientText(
                                    title: "When is your weekly off ?",
                                    textSize: 14,
                                    isbold: true,
                                  ),
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
                                ])),
                        SizedBox(height: 20),
                        Container(
                            width: screenSize.width,
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: Row(children: [
                              FaIcon(
                                FontAwesomeIcons.store,
                                size: 20,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text("Store Address",
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
                            child: Row(children: [
                              GradientIcon(child: Icon(Icons.my_location)),
                              SizedBox(
                                width: 7,
                              ),
                              GradientText(
                                title: "Use Current Location",
                                textSize: 14,
                                isbold: true,
                              )
                            ])),
                        SizedBox(height: 15),
                        Container(
                            height: 400,
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
                                // borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: bluegradientstartColor, width: 1)),
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: Stack(children: [
                              Positioned(
                                  top: 0,
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              1.5,
                                      child: GoogleMap(
                                          markers:
                                              Set<Marker>.of(_markers.values),
                                          onMapCreated: _onMapCreated,
                                          initialCameraPosition: CameraPosition(
                                            target: LatLng(29.196722308032882,
                                                77.95953489840029),
                                            zoom: 10,
                                          ),
                                          onTap: (val) async {
                                            taplocation = val;
                                            print(taplocation);

                                            List<Placemark> placemarks =
                                                await placemarkFromCoordinates(
                                                    taplocation.latitude,
                                                    taplocation.longitude);
                                            print(placemarks);
                                            setState(() {
                                              tapAddress =
                                                  "${placemarks.first}";
                                            });
                                          },
                                          myLocationEnabled: true,
                                          onCameraIdle: () {
                                            setState(() {
                                              popMessage = true;
                                            });
                                          },
                                          onCameraMove:
                                              (CameraPosition position) {
                                            if (_markers.length > 0) {
                                              MarkerId markerId =
                                                  MarkerId(_markerIdVal());
                                              Marker? marker =
                                                  _markers[markerId];
                                              Marker updatedMarker =
                                                  marker!.copyWith(
                                                positionParam: position.target,
                                              );

                                              setState(() {
                                                _markers[markerId] =
                                                    updatedMarker;
                                                popMessage = false;
                                              });
                                            }
                                          }))),
                              Positioned(
                                  top: 20,
                                  child: Container(
                                      margin:
                                          EdgeInsets.only(left: 15, right: 15),
                                      width: screenSize.width - 65,
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
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: bluegradientstartColor,
                                              width: 1)),
                                      child: TextFormField(
                                          controller: _controller,
                                          decoration: InputDecoration(
                                            prefixIcon:
                                                Icon(Icons.location_on_rounded),
                                            labelStyle: TextStyle(
                                                color: bluegradientstartColor),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  color: bluegradientstartColor,
                                                  width: 1),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  color: bluegradientstartColor,
                                                  width: 1),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                    color:
                                                        bluegradientstartColor,
                                                    width: 1)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        10.0),
                                                borderSide: BorderSide(
                                                    color:
                                                        bluegradientstartColor,
                                                    width: 1)),

                                            //prefix: countryDropDown,
                                            hintText: 'Search Your Location',
                                            hintStyle: TextStyle(
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                          onChanged: (val) async {},
                                          onFieldSubmitted: (value) async {
                                            print("hello");
                                            List locations =
                                                await locationFromAddress(
                                                    value);
                                            String lo = locations[0].toString();

                                            List<String> str = lo.split(",");
                                            List<String> lat =
                                                str[0].split(":");
                                            List<String> long =
                                                str[1].split(":");
                                            print(str);

                                            LatLng position = LatLng(
                                                double.parse(lat[1]),
                                                double.parse(long[1]));

                                            Future.delayed(Duration(seconds: 1),
                                                () async {
                                              GoogleMapController controller =
                                                  await _mapController.future;
                                              controller.animateCamera(
                                                  CameraUpdate
                                                      .newCameraPosition(
                                                          CameraPosition(
                                                target: position,
                                                zoom: 15,
                                              )));
                                            });
                                          })))
                            ])),
                        SizedBox(height: 15),
                        CustomBottomBarButton(
                          height: 50,
                          width: screenSize.width,
                          isDisable: false,
                          onpress: () async {
                            // user.businessInformation.serviceoffered =
                            //     "${laundry}${dryCleaning}${streamPress}${leatherCare}";

                            serviceProviderRegistration(user);
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: ServiceProviderMainPage()));
                          },
                          title: "SUBMIT",
                        ),
                        SizedBox(height: 15),
                      ]))
                ]))))));
  }
}
