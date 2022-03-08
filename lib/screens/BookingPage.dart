import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/screens/activeBookingsPage.dart';
import 'package:flutter_test_app/screens/closedBooking.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool activebooking = true;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              bottom: PreferredSize(
                preferredSize: Size(screenSize.width, 0),
                child: TabBar(
                    labelPadding: EdgeInsets.only(bottom: 10),
                    indicatorColor: whiteColor,
                    indicatorWeight: 4,
                    tabs: [
                      Text("Active Bookings",
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'helvetica')),
                      Text("Closed Bookings",
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'helvetica')),
                    ]),
              ),
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
                child: TabBarView(
                  children: [ActiveBookings(), CloasedBooking()],
                ))));
  }
}
