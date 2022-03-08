import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/CustomProfileTextfield.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/components/customDatePicker.dart';
import 'package:flutter_test_app/components/customTextField.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';
import 'package:flutter_test_app/main.dart';
import 'package:flutter_test_app/screens/ProfilePage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:direct_select/direct_select.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  void toastMessageShort({String message = "default message"}) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.grey.shade600,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  TextEditingController _firstName = TextEditingController()..text = fisrtName;
  TextEditingController _lastName = TextEditingController()..text = lastName;
  TextEditingController _emailID = TextEditingController()..text = emailID;
  TextEditingController _phoneNo = TextEditingController()..text = phoneNo;
  TextEditingController _companyName = TextEditingController();
  TextEditingController _GstNo = TextEditingController();
  TextEditingController _officialEmailId = TextEditingController();
  TextEditingController _middleName = TextEditingController();

  FocusNode _focusNodeFirstName = FocusNode();
  FocusNode _focusNodeLastName = FocusNode();
  FocusNode _focusNodeEmailID = FocusNode();
  FocusNode _focusNodePhoneNo = FocusNode();
  FocusNode _focusNodeCampanyName = FocusNode();
  FocusNode _focusNodeGstNo = FocusNode();
  FocusNode _focusNodeOfficialEmailID = FocusNode();
  FocusNode _focusNodeMiddleName = FocusNode();

  bool _firstNameEditingComplete = true;
  bool _lastNameEditingComplete = true;
  bool _emailIDEditingComplete = true;
  bool _phoneNoEditingComplete = true;
  bool _middleNameEditingComplete = true;
  bool _gstNoEditingComplete = false;
  bool _comapanyNameEditingComplete = false;
  bool _officialEmailIDEditingComplete = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  final ImagePicker _picker = ImagePicker();
//pick image from camera
  late XFile _image;

  _imgFromGallery() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image!;
    });
  }

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

  DateTime date = DateTime(2016, 10, 26);

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 200,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile",
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
              fit: BoxFit.fill, image: AssetImage("assets/images/bodybg.png")),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Container(
                height: 620,
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                child: Container(
                                    alignment: Alignment.center,
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: bluegradientstartColor,
                                          width: 3),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.person_add_alt_1_rounded,
                                        color: bluegradientstartColor,
                                        size: 70,
                                      ),
                                    )),
                                onTap: () {
                                  _imgFromGallery();
                                })
                          ]),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                    focusNode: _focusNodeFirstName,
                                    controller: _firstName,
                                    type: TextInputType.name,
                                    maxLines: null,
                                    onTap: () {
                                      setState(() {
                                        _focusNodeFirstName.requestFocus();
                                      });
                                    },
                                    labelText: 'First Name *',
                                    completeEditing: _firstNameEditingComplete,
                                    onChanged: (val) {
                                      setState(() {});
                                    },
                                    onEditingCompleted: () {},
                                    onsubmitted: (val) {
                                      setState(() {
                                        _focusNodeFirstName.unfocus();
                                        _firstNameEditingComplete = true;
                                      });
                                    }))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          width: screenSize.width,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    //  width: screenSize.width * 0.3,
                                    child: CustomTextField(
                                  focusNode: _focusNodeMiddleName,
                                  controller: _middleName,
                                  type: TextInputType.name,
                                  onTap: () {
                                    setState(() {
                                      _focusNodeMiddleName.requestFocus();
                                    });
                                  },
                                  labelText: 'Middle Name',
                                  completeEditing: _middleNameEditingComplete,
                                  onChanged: (val) {
                                    setState(() {});
                                  },
                                  onEditingCompleted: () {},
                                  onsubmitted: (val) {
                                    setState(() {
                                      _focusNodeMiddleName.unfocus();
                                      _middleNameEditingComplete = true;
                                    });
                                  },
                                )),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    // width: screenSize.width * 0.3,
                                    child: CustomTextField(
                                  focusNode: _focusNodeLastName,
                                  controller: _lastName,
                                  type: TextInputType.name,
                                  onTap: () {
                                    setState(() {
                                      _focusNodeLastName.requestFocus();
                                    });
                                  },
                                  labelText: 'Last Name',
                                  completeEditing: _lastNameEditingComplete,
                                  onChanged: (val) {
                                    setState(() {});
                                  },
                                  onEditingCompleted: () {},
                                  onsubmitted: (val) {
                                    setState(() {
                                      _focusNodeLastName.unfocus();
                                      _lastNameEditingComplete = true;
                                    });
                                  },
                                )),
                              ])),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          width: screenSize.width,
                          child: CustomTextField(
                            focusNode: _focusNodeEmailID,
                            controller: _emailID,
                            type: TextInputType.emailAddress,
                            onTap: () {
                              setState(() {
                                _focusNodeEmailID.requestFocus();
                              });
                            },
                            labelText: 'Email ID *',
                            completeEditing: _emailIDEditingComplete,
                            suffix: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: GradientText(
                                isbold: false,
                                title: "Verify now",
                                isUnderline: true,
                              ),
                            ),
                            onChanged: (val) {
                              setState(() {});
                            },
                            onEditingCompleted: () {},
                            onsubmitted: (val) {
                              setState(() {
                                _focusNodeEmailID.unfocus();
                                _emailIDEditingComplete = true;
                                if (isEmail(_emailID.text)) {
                                } else {
                                  toastMessageShort(
                                      message: "enter the valid email address");
                                }
                              });
                            },
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          width: screenSize.width,
                          child: CustomTextField(
                            focusNode: _focusNodePhoneNo,
                            controller: _phoneNo,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            inputFormat: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            type: TextInputType.phone,
                            onTap: () {
                              setState(() {
                                _focusNodePhoneNo.requestFocus();
                              });
                            },
                            labelText: 'Mobile Number *',
                            completeEditing: _phoneNoEditingComplete,
                            suffix: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Container(
                                width: 73,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Verified ",
                                      style: TextStyle(
                                          fontFamily: 'helvetica',
                                          color: Colors.grey[500]),
                                    ),
                                    GradientIcon(
                                      child: Icon(
                                        Icons.verified,
                                        color: blackColor,
                                        size: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onChanged: (val) {
                              setState(() {});
                            },
                            onEditingCompleted: () {},
                            onsubmitted: (val) {
                              setState(() {
                                _focusNodePhoneNo.unfocus();
                                _phoneNoEditingComplete = true;
                              });
                            },
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 45,
                        padding: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: bluegradientstartColor, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Text("Date of Birth : ",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[500],
                                    fontFamily: 'helvetica')),
                            Container(
                              child: CupertinoButton(
                                alignment: Alignment.topCenter,
                                padding: EdgeInsets.only(left: 15, top: 13),
                                onPressed: () => _showDialog(
                                  CupertinoDatePicker(
                                    initialDateTime: date,
                                    dateOrder: DatePickerDateOrder.dmy,
                                    mode: CupertinoDatePickerMode.date,
                                    use24hFormat: false,
                                    onDateTimeChanged: (DateTime newDate) {
                                      setState(() => date = newDate);
                                    },
                                  ),
                                ),
                                child: Text(
                                  '${date.day}-${listOfMonths[date.month - 1]}-${date.year}',
                                  style: const TextStyle(
                                      fontFamily: 'helvetica',
                                      color: blackColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          width: screenSize.width,
                          child: CustomTextField(
                            focusNode: _focusNodeCampanyName,
                            controller: _companyName,
                            onTap: () {
                              setState(() {
                                _focusNodeCampanyName.requestFocus();
                              });
                            },
                            labelText: 'Company Name',
                            type: TextInputType.name,
                            completeEditing: _comapanyNameEditingComplete,
                            onChanged: (val) {},
                            onEditingCompleted: () {},
                            onsubmitted: (val) {
                              setState(() {
                                _focusNodeCampanyName.unfocus();
                                _comapanyNameEditingComplete = true;
                              });
                            },
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          width: screenSize.width,
                          child: CustomTextField(
                            focusNode: _focusNodeGstNo,
                            controller: _GstNo,
                            onTap: () {
                              setState(() {
                                _focusNodeGstNo.requestFocus();
                              });
                            },
                            labelText: 'Company GST Number',
                            type: TextInputType.name,
                            completeEditing: _gstNoEditingComplete,
                            onChanged: (val) {},
                            onEditingCompleted: () {},
                            onsubmitted: (val) {
                              setState(() {
                                _focusNodeGstNo.unfocus();
                                _gstNoEditingComplete = true;
                              });
                            },
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          width: screenSize.width,
                          child: CustomTextField(
                            focusNode: _focusNodeOfficialEmailID,
                            controller: _officialEmailId,
                            type: TextInputType.emailAddress,
                            onTap: () {
                              setState(() {
                                _focusNodeOfficialEmailID.requestFocus();
                              });
                            },
                            labelText: 'Official Email ID',
                            completeEditing: _officialEmailIDEditingComplete,
                            onChanged: (val) {},
                            onEditingCompleted: () {},
                            onsubmitted: (val) {
                              setState(() {
                                _focusNodeOfficialEmailID.unfocus();
                                _officialEmailIDEditingComplete = true;
                              });
                            },
                          )),
                    ],
                  ),
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
                      isDisable: false,
                      onpress: () {
                        setState(() {
                          fisrtName = _firstName.text;
                          lastName = _lastName.text;
                          emailID = _emailID.text;
                          phoneNo = _phoneNo.text;

                          print(fisrtName);

                          Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: ProfilePage()),
                          );
                        });
                      },
                      title: "SAVE DETAILS",
                    )))
          ],
        ),
      ),
    );
  }
}
