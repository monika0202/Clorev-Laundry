import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/authentication/deliveryPartnerLoginPage.dart';
import 'package:flutter_test_app/authentication/serviceProviderLoginPage.dart';
import 'package:flutter_test_app/colorconst.dart';

import 'package:flutter_test_app/components/CustomLoginButton.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';
import 'package:flutter_test_app/components/loadingWidget.dart';
import 'package:flutter_test_app/screens/addressPage.dart';
import 'package:flutter_test_app/screens/google.dart';
import 'package:flutter_test_app/screens/locationPage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:pinput/pin_put/pin_put_state.dart';
import 'package:country_list/country_list.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:video_player/video_player.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  FocusNode _focusNode = FocusNode();
  String _selectedLocation = "";
  final FocusNode _pinPutFocusNode = FocusNode();

  bool requestotp = true;
  bool istimer = false;
  bool otpfill = true;
  late String mobile;
  TextEditingController phone = new TextEditingController();
  TextEditingController otp = new TextEditingController();

  bool istimerstop = true;
  bool mobiledisable = false;

  CountDownController timeController = CountDownController();
  String _selectedCountryCode = "+91";
  List<String> _countryCodes = ['+91', '+23', "+34"];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    var countryDropDown = Container(

        //   child: Row(
        //     children: [
        // Text("+91", style: TextStyle(fontSize: 14, fontFamily: "Helvetica")),
        child: Wrap(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, top: 17, right: 15, bottom: 15),
          child: Text("+91",
              style: TextStyle(fontSize: 16, fontFamily: "Helvetica")),
        ),
      ],
    ));

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/bodybg.png"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                height: 400,
                // color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                      // changes position of shadow
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Container(
                          height: 45,
                          child: Center(
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                focusNode: _focusNode,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.justify,
                                style: TextStyle(color: Colors.black),
                                keyboardType: TextInputType.phone,
                                controller: phone,
                                readOnly: mobiledisable,
                                onFieldSubmitted: (value) {
                                  setState(() {
                                    mobile = value;
                                    _focusNode.unfocus();
                                    mobiledisable = true;
                                  });
                                },
                                onEditingComplete: () {
                                  setState(() {
                                    mobile = phone.text;
                                    _focusNode.unfocus();
                                    mobiledisable = true;
                                  });
                                },
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                onTap: () {},
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(15),
                                  alignLabelWithHint: false,
                                  floatingLabelStyle: TextStyle(
                                      color: mobiledisable
                                          ? Colors.grey[500]
                                          : bluegradientstartColor),
                                  labelText: 'Mobile Number',
                                  labelStyle:
                                      TextStyle(color: Colors.grey[500]),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color: mobiledisable
                                            ? Colors.grey[500]!
                                            : bluegradientstartColor,
                                        width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color: mobiledisable
                                            ? Colors.grey[500]!
                                            : bluegradientstartColor,
                                        width: 1),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color: Colors.grey[500]!, width: 1),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          color: bluegradientstartColor,
                                          width: 1)),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                          color: mobiledisable
                                              ? Colors.grey[500]!
                                              : bluegradientstartColor,
                                          width: 1)),
                                  hintStyle: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                  prefixIcon: countryDropDown,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    mobile = value;
                                  });

                                  if (phone.text.length == 10) {
                                    setState(() {
                                      requestotp = false;
                                    });
                                  } else if (phone.text.length < 10 ||
                                      phone.text.length > 10) {
                                    setState(() {
                                      requestotp = true;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: screenSize.width,
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              istimer
                                  ? Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "OTP has been sent to above number.",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Helvetica"),
                                      ),
                                    )
                                  : Container(
                                      width: screenSize.width,

                                      // fit: BoxFit.contain,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "By requesting OTP, you agree to the ",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "Helvetica"),
                                          ),
                                          GradientText(
                                            title: "Terms of Use",
                                            isbold: false,
                                            isUnderline: true,
                                            textSize: 15,
                                          )
                                        ],
                                      ),
                                    ),
                              SizedBox(
                                height: 7,
                              ),
                              istimer
                                  ? Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            child: Row(
                                              children: [
                                                GradientIcon(
                                                  child: Icon(
                                                    Icons.edit,
                                                    size: 20,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                GradientText(
                                                  title: "Edit Mob No",
                                                  isbold: false,
                                                  isUnderline: true,
                                                  textSize: 15,
                                                ),
                                              ],
                                            ),
                                            onTap: () {
                                              setState(() {
                                                if (istimer) {
                                                  mobiledisable = false;
                                                  _focusNode.requestFocus();
                                                  istimer = false;
                                                }
                                              });
                                            },
                                          ),
                                          InkWell(
                                            child: Row(
                                              children: [
                                                GradientText(
                                                  title: "Get OTP on Call",
                                                  isbold: false,
                                                  isUnderline: true,
                                                  textSize: 15,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                GradientIcon(
                                                  child: Icon(
                                                    Icons.call,
                                                    size: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // GradientText(
                                          //   title: "Use",
                                          //   isbold: false,
                                          //   isUnderline: true,
                                          //   textSize: 15,
                                          // ),
                                          Text("and ",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: "Helvetica")),
                                          GradientText(
                                            title: "Privacy Policy",
                                            isbold: false,
                                            isUnderline: true,
                                            textSize: 15,
                                          ),
                                          Text(
                                            " of CLOREV Laundry",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "Helvetica"),
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: screenSize.width,
                          margin: EdgeInsets.only(right: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Visibility(
                                  visible: istimer,
                                  child: CircularCountDownTimer(
                                    width:
                                        MediaQuery.of(context).size.width / 2.4,
                                    height: 45,
                                    duration: 30,
                                    strokeWidth: 5,
                                    // initialDuration: 30,
                                    isReverse: true,
                                    backgroundGradient: null,
                                    backgroundColor: Colors.white,
                                    fillColor: Colors.white,
                                    ringColor: Colors.white,
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Helvetica',
                                    ),
                                    controller: timeController,
                                    ringGradient: LinearGradient(
                                        colors: [
                                          bluegradientstartColor,
                                          bluegradientendColor
                                        ],
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft),
                                    onComplete: () {
                                      setState(() {
                                        istimer = true;
                                        istimerstop = true;
                                      });

                                      print(timeController.getTime());
                                    },
                                  )),
                              istimer
                                  ? LoginButtons(
                                      width: MediaQuery.of(context).size.width *
                                          .4,
                                      isDisable: !istimerstop,
                                      onpress: () {
                                        setState(() {
                                          if (!istimerstop) {
                                          } else {
                                            istimer = true;
                                            timeController.start();
                                            istimerstop = false;
                                          }
                                        });
                                      },
                                      isLoginButton: false,
                                      title: "Resend OTP",
                                    )
                                  : LoginButtons(
                                      width: MediaQuery.of(context).size.width *
                                          .4,
                                      isDisable: requestotp,
                                      onpress: () {
                                        setState(() {
                                          if (phone.text.length == 10) {
                                            istimer = true;
                                            istimerstop = false;
                                            _focusNode.unfocus();
                                            mobiledisable = true;
                                          }
                                        });
                                      },
                                      title: "Request OTP",
                                      isLoginButton: false,
                                    ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 180,
                                child: PinPut(
                                    controller: otp,
                                    fieldsCount: 4,
                                    textStyle: const TextStyle(
                                        fontSize: 17.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'helvetica'),
                                    eachFieldWidth: 10.0,
                                    eachFieldHeight: 45.0,
                                    focusNode: _pinPutFocusNode,
                                    selectedFieldDecoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        border: Border.all(
                                            color: bluegradientstartColor,
                                            width: 1),
                                        color: whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    followingFieldDecoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        border: Border.all(
                                            color: bluegradientstartColor,
                                            width: 1),
                                        color: whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    submittedFieldDecoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        gradient: LinearGradient(
                                          colors: [
                                            bluegradientstartColor,
                                            bluegradientendColor
                                          ],
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                        ),
                                        //color: whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    onChanged: (value) {
                                      print(otp.text.length);
                                      if (otp.text.length == 4) {
                                        setState(() {
                                          otpfill = false;
                                        });
                                      } else if (otp.text.length < 4) {
                                        setState(() {
                                          otpfill = true;
                                        });
                                      }
                                    }),
                              ),
                              LoginButtons(
                                isDisable: otpfill,
                                onpress: () {
                                  if (otpfill == false) {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            child: FutureBuilder(
                                                // Replace the 3 second delay with your initialization code:
                                                future: Future.delayed(
                                                    Duration(seconds: 3)),
                                                builder: (context,
                                                    AsyncSnapshot snapshot) {
                                                  // Show splash screen while waiting for app resources to load:
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.waiting) {
                                                    return MaterialApp(
                                                        debugShowCheckedModeBanner:
                                                            false,
                                                        home: LoadingWidget());
                                                  } else {
                                                    // Loading is done, return the app:
                                                    return MaterialApp(
                                                        theme: ThemeData(
                                                          primaryColor:
                                                              whiteColor,
                                                          primarySwatch:
                                                              blueColormedium,
                                                          accentColor:
                                                              blueColormedium,
                                                        ),
                                                        debugShowCheckedModeBanner:
                                                            false,
                                                        home: LocationPage());
                                                  }
                                                })));
                                  }
                                },
                                width: MediaQuery.of(context).size.width * .4,
                                icon: Icons.login_rounded,
                                title: "Login",
                                isLoginButton: true,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          child: FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: Divider(
                                    thickness: 1,
                                    color: bluegradientstartColor,
                                  ),
                                ),
                                GradientText(
                                  title: "or Sign In as  ",
                                  isbold: false,
                                  isUnderline: false,
                                  textSize: 17,
                                  isItalic: true,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: Divider(
                                    thickness: 1,
                                    color: bluegradientstartColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: Row(
                                  children: [
                                    GradientText(
                                      title: "Service Provider",
                                      isbold: true,
                                      isUnderline: false,
                                      textSize: 17,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    GradientIcon(
                                      child: Icon(
                                        Icons.arrow_right_rounded,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: ServiceProviderLoginPage()));
                                },
                              ),
                              Text(
                                "|",
                                style: TextStyle(
                                    color: Colors.grey[500], fontSize: 18),
                              ),
                              Transform.translate(
                                offset: Offset(10, 0),
                                child: InkWell(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GradientText(
                                        title: "Delivery Partner",
                                        isbold: true,
                                        isUnderline: false,
                                        textSize: 17,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      GradientIcon(
                                        child: Icon(
                                          Icons.arrow_right_rounded,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            child:
                                                DeliveryPartnerLogingPage()));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
