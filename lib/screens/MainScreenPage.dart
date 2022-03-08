import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';
import 'package:flutter_test_app/screens/BookingPage.dart';
import 'package:flutter_test_app/screens/DeliveryPage.dart';
import 'package:flutter_test_app/screens/ProfilePage.dart';
import 'package:flutter_test_app/screens/bookingSummaryPage.dart';
import 'package:flutter_test_app/screens/homePage.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter_test_app/screens/homeScreen.dart';
import 'package:flutter_test_app/authentication/loginPage.dart';
import 'package:flutter_test_app/screens/notificationPage.dart';
import 'package:flutter_test_app/screens/pickupPage.dart';
import 'package:flutter_test_app/screens/supportPage.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  _MainScreenPageState createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    HomeScreen(),
    NotificationPage(),
    BookingPage(),
    SupportPage(),
    ProfilePage()
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
            height: 45,
            activeColor: bluegradientstartColor,
            initialActiveIndex: 0,
            top: -20,
            curveSize: 70,
            onTap: (i) {
              setState(() {
                pageIndex = i;
              });
            },
            items: [
              TabItem(
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: GradientIcon(
                        child: FaIcon(FontAwesomeIcons.home, size: 35)),
                  ),
                  icon: FaIcon(
                    FontAwesomeIcons.home,
                    size: 22,
                  ),
                  title: "Home"),
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

class Style extends StyleHook {
  @override
  double get activeIconSize => 40;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 20;

  @override
  TextStyle textStyle(Color color) {
    return TextStyle(fontSize: 14, color: blackColor);
  }
}
