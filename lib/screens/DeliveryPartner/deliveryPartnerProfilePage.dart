import 'package:flutter/material.dart';
import 'package:flutter_test_app/authentication/deliveryPartnerLoginPage.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';
import 'package:flutter_test_app/screens/DeliveryPartner/deliveryPartnerBankDetails.dart';
import 'package:flutter_test_app/screens/DeliveryPartner/deliveryPartnerLedgerAccount.dart';
import 'package:flutter_test_app/screens/DeliveryPartner/deliveryPartnerProfessionalDetails.dart';
import 'package:flutter_test_app/screens/DeliveryPartner/deliveryPartnerProfileEditPage.dart';
import 'package:flutter_test_app/screens/settingPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class DeliveryPartnerProfilePage extends StatefulWidget {
  const DeliveryPartnerProfilePage({Key? key}) : super(key: key);

  @override
  _DeliveryPartnerProfilePageState createState() =>
      _DeliveryPartnerProfilePageState();
}

class _DeliveryPartnerProfilePageState
    extends State<DeliveryPartnerProfilePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 130,
          automaticallyImplyLeading: false,
          title: Column(children: [
            Container(
              child: Row(
                children: [
                  Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${user.name}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'helvetica',
                              fontSize: 19),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "${user.emailID}",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'helvetica',
                              fontSize: 17),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "+91-${user.mobileNumber}",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'helvetica',
                              fontSize: 17),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontFamily: 'helvetica',
                          fontSize: 15),
                    ),
                    Icon(Icons.arrow_right_rounded, color: Colors.white),
                  ]),
              onTap: () {
                print("hello");
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: DeliveryPartnerProfileEditPage()),
                );
              },
            )
          ]),
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
            child: Stack(
              children: [
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          //padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                  dense: true,
                                  leading: GradientIcon(
                                    child: Icon(
                                      Icons.account_balance_wallet_rounded,
                                      color: bluegradientstartColor,
                                      size: 30,
                                    ),
                                  ),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Wallet",
                                        style: TextStyle(
                                            color: darkGreyColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'helvetica'),
                                      ),
                                      Transform.translate(
                                          offset: const Offset(18, 0),
                                          child: Text(
                                            "\₹0000",
                                            style: TextStyle(
                                                color: darkGreyColor,
                                                fontFamily: 'helvetica'),
                                          )),
                                    ],
                                  ),
                                  trailing: Transform.translate(
                                    offset: const Offset(13, 0),
                                    child: Icon(
                                      Icons.arrow_right_rounded,
                                      color: bluegradientstartColor,
                                      size: 30,
                                    ),
                                  )),
                              Container(
                                padding: EdgeInsets.only(left: 70, right: 15),
                                child: Divider(
                                  height: 1,
                                  color: bluegradientstartColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: DeliveryPartnerLedgerAccount()),
                                  );
                                },
                                child: ListTile(
                                    dense: true,
                                    leading: GradientIcon(
                                      child: Icon(
                                        Icons.location_city_rounded,
                                        color: bluegradientstartColor,
                                        size: 30,
                                      ),
                                    ),
                                    title: Text(
                                      "Ledger Account",
                                      style: TextStyle(
                                          color: darkGreyColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'helvetica'),
                                    ),
                                    trailing: Transform.translate(
                                      offset: const Offset(13, 0),
                                      child: Icon(
                                        Icons.arrow_right_rounded,
                                        color: bluegradientstartColor,
                                        size: 30,
                                      ),
                                    )),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 70, right: 15),
                                child: Divider(
                                  height: 1,
                                  color: bluegradientstartColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child:
                                            DeliveryPartnerProfessionalDetails()),
                                  );
                                },
                                child: ListTile(
                                    dense: true,
                                    leading: GradientIcon(
                                      child: FaIcon(
                                        FontAwesomeIcons.briefcase,
                                        color: blackColor,
                                        size: 26,
                                      ),
                                    ),
                                    title: Text(
                                      "Professional Details",
                                      style: TextStyle(
                                          color: darkGreyColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'helvetica'),
                                    ),
                                    trailing: Transform.translate(
                                      offset: const Offset(13, 0),
                                      child: Icon(
                                        Icons.arrow_right_rounded,
                                        color: bluegradientstartColor,
                                        size: 30,
                                      ),
                                    )),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 70, right: 15),
                                child: Divider(
                                  height: 1,
                                  color: bluegradientstartColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: DeliveryPartnerBankDetails()),
                                  );
                                },
                                child: ListTile(
                                    dense: true,
                                    leading: GradientIcon(
                                      child: FaIcon(
                                        FontAwesomeIcons.university,
                                        color: blackColor,
                                        size: 26,
                                      ),
                                    ),
                                    title: Text(
                                      "Bank Details",
                                      style: TextStyle(
                                          color: darkGreyColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'helvetica'),
                                    ),
                                    trailing: Transform.translate(
                                      offset: const Offset(13, 0),
                                      child: Icon(
                                        Icons.arrow_right_rounded,
                                        color: bluegradientstartColor,
                                        size: 30,
                                      ),
                                    )),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 70, right: 15),
                                child: Divider(
                                  height: 1,
                                  color: bluegradientstartColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   PageTransition(
                                  //       type: PageTransitionType.rightToLeft,
                                  //       child: ServiceProviderBankDetails()),
                                  // );
                                },
                                child: ListTile(
                                    dense: true,
                                    leading: GradientIcon(
                                        child: FaIcon(FontAwesomeIcons.shareAlt,
                                            color: blackColor, size: 26)),
                                    title: Text(
                                      "Refer App",
                                      style: TextStyle(
                                          color: darkGreyColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'helvetica'),
                                    ),
                                    trailing: Transform.translate(
                                      offset: const Offset(13, 0),
                                      child: Icon(
                                        Icons.arrow_right_rounded,
                                        color: bluegradientstartColor,
                                        size: 30,
                                      ),
                                    )),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 70, right: 15),
                                child: Divider(
                                  height: 1,
                                  color: bluegradientstartColor,
                                ),
                              ),
                              ListTile(
                                  dense: true,
                                  leading: GradientIcon(
                                    child: FaIcon(
                                        FontAwesomeIcons.solidThumbsUp,
                                        color: blackColor,
                                        size: 26),
                                  ),
                                  title: Text(
                                    "Rate Us",
                                    style: TextStyle(
                                        color: darkGreyColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'helvetica'),
                                  ),
                                  trailing: Transform.translate(
                                    offset: const Offset(13, 0),
                                    child: Icon(
                                      Icons.arrow_right_rounded,
                                      color: bluegradientstartColor,
                                      size: 30,
                                    ),
                                  )),
                              Container(
                                padding: EdgeInsets.only(left: 70, right: 15),
                                child: Divider(
                                  height: 1,
                                  color: bluegradientstartColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: SettingPage()),
                                  );
                                },
                                child: ListTile(
                                    dense: true,
                                    leading: GradientIcon(
                                      child: FaIcon(FontAwesomeIcons.cog,
                                          color: blackColor, size: 26),
                                    ),
                                    title: Text(
                                      "Settings",
                                      style: TextStyle(
                                          color: darkGreyColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'helvetica'),
                                    ),
                                    trailing: Transform.translate(
                                      offset: const Offset(13, 0),
                                      child: Icon(
                                        Icons.arrow_right_rounded,
                                        color: bluegradientstartColor,
                                        size: 30,
                                      ),
                                    )),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: Divider(
                                  height: 1,
                                  color: bluegradientstartColor,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CircleAvatar(
                                      radius: 22,
                                      backgroundColor: bluegradientstartColor,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child: GradientIcon(
                                            child: FaIcon(
                                                FontAwesomeIcons.linkedinIn),
                                          ))),
                                  CircleAvatar(
                                      radius: 22,
                                      backgroundColor: bluegradientstartColor,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child: GradientIcon(
                                              child: FaIcon(
                                                  FontAwesomeIcons.youtube)))),
                                  CircleAvatar(
                                      radius: 22,
                                      backgroundColor: bluegradientstartColor,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child: GradientIcon(
                                            child: FaIcon(
                                                FontAwesomeIcons.facebookF),
                                          ))),
                                  CircleAvatar(
                                      radius: 22,
                                      backgroundColor: bluegradientstartColor,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child: GradientIcon(
                                            child: FaIcon(
                                                FontAwesomeIcons.instagram),
                                          ))),
                                  CircleAvatar(
                                      radius: 22,
                                      backgroundColor: bluegradientstartColor,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child: GradientIcon(
                                              child: FaIcon(
                                                  FontAwesomeIcons.twitter)))),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomBottomBarButton(
                          isDisable: false,
                          height: 50,
                          onpress: () {},
                          title: "Logouts",
                          width: screenSize.width,
                          isIcon: true,
                          icon: Icons.logout_rounded,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
