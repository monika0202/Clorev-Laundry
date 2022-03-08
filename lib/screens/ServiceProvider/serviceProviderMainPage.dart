import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';
import 'package:flutter_test_app/screens/ServiceProvider/ServiceProviderNotificationPage.dart';
import 'package:flutter_test_app/screens/ServiceProvider/ServiceProviderProfilePage.dart';
import 'package:flutter_test_app/screens/ServiceProvider/serviceProviderBookings.dart';
import 'package:flutter_test_app/screens/supportPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServiceProviderMainPage extends StatefulWidget {
  const ServiceProviderMainPage({Key? key}) : super(key: key);

  @override
  _ServiceProviderMainPageState createState() =>
      _ServiceProviderMainPageState();
}

class _ServiceProviderMainPageState extends State<ServiceProviderMainPage> {
  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    ServiceProviderBookings(),
    ServiceProviderNotificationPage(),
    SupportPage(),
    ServiceProviderProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ConvexAppBar(
            backgroundColor: whiteColor,
            style: TabStyle.react,
            color: blackColor,
            activeColor: bluegradientstartColor,
            initialActiveIndex: 0,
            top: -20,
            curveSize: 70,
            height: 45,
            onTap: (i) {
              setState(() {
                pageIndex = i;
              });
            },
            items: [
              TabItem(
                  activeIcon: GradientIcon(
                      child: ImageIcon(
                    AssetImage("assets/images/Machine.png"),
                  )),
                  icon: ImageIcon(
                    AssetImage("assets/images/Machine.png"),
                  ),
                  title: "Bookings"),
              TabItem(
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: GradientIcon(
                        child: FaIcon(FontAwesomeIcons.solidBell, size: 35)),
                  ),
                  icon: FaIcon(
                    FontAwesomeIcons.solidBell,
                    size: 22,
                  ),
                  title: "Notification"),
              TabItem(
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: GradientIcon(
                        child: FaIcon(FontAwesomeIcons.headset, size: 35)),
                  ),
                  icon: FaIcon(
                    FontAwesomeIcons.headset,
                    size: 22,
                  ),
                  title: "Support"),
              TabItem(
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: GradientIcon(
                        child: FaIcon(FontAwesomeIcons.solidUser, size: 35)),
                  ),
                  icon: FaIcon(
                    FontAwesomeIcons.solidUser,
                    size: 22,
                  ),
                  title: "Profile"),
            ]),
      ),
    );
  }
}
