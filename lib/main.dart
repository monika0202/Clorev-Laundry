import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/modals/AddOnCategory.dart';
import 'package:flutter_test_app/modals/AddToCart.dart';
import 'package:flutter_test_app/modals/BrandCategory.dart';

import 'package:flutter_test_app/modals/ServiceList.dart';
import 'package:flutter_test_app/modals/address.dart';
import 'package:flutter_test_app/modals/prices.dart';
import 'package:flutter_test_app/screens/MainScreenPage.dart';
import 'package:flutter_test_app/screens/homePage.dart';
import 'package:flutter_test_app/authentication/loginPage.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

double halfPrice = 0;

Prices prices = Prices(
    cartValue: "",
    basePrice: "",
    starPrice: "",
    gst: "",
    igst: "",
    cgst: "",
    sgst: "",
    deliveryPrice: "",
    halfPayableAmount: "",
    payableAmount: "");

String fisrtName = "Sudhir";
String lastName = "Mishra";
String emailID = "sudhirmishra@gmail.com";
String phoneNo = "9929371023";

var serviceList = ServiceList(title: "", star: 0, ratings: 0, price: 0);
var addressList = Address(
    landmark: "",
    flat_House_No: "",
    location: "",
    tag_address: "",
    isAdded: false);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(Duration(seconds: 7)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
              debugShowCheckedModeBanner: false, home: SplashScreen());
        } else {
          // Loading is done, return the app:
          return MaterialApp(
              theme: ThemeData(
                primaryColor: whiteColor,
                primarySwatch: blueColormedium,
                accentColor: blueColormedium,
              ),
              debugShowCheckedModeBanner: false,
              home: LoginPage());
        }
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/video/splash.mp4");
    _controller.initialize().then((_) {
      setState(() {
        _controller.play();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_controller != null) {
      _controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          // height: MediaQuery.of(context).size.height,
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //         colors: [bluegradientstartColor, bluegradientendColor],
          //         begin: Alignment.topRight,
          //         end: Alignment.bottomLeft)),
          child: Container(
              // alignment: Alignment.bottomCenter,
              // decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //         colors: [bluegradientstartColor, bluegradientendColor],
              //         begin: Alignment.topRight,
              //         end: Alignment.bottomLeft)),
              // width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              child: VideoPlayer(_controller))),
    );
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'HomePage',
//       theme: ThemeData(
//         primaryColor: whiteColor,
//         primarySwatch: blueColormedium,
//         accentColor: blueColormedium,
//       ),
//       initialRoute: HomePage.routeName,
//       routes: {
//         HomePage.routeName: (context) => LoginPage(),
//       },
//     );
//   }
// }
