import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/CustomDeliveryPartnerClosedBookings.dart';
import 'package:flutter_test_app/components/customServiceProviderClosedBookings.dart';
import 'package:flutter_test_app/modals/ClosedBookingsServiceProviderModel.dart';
import 'package:flutter_test_app/modals/closedBookingsDeliverPartnerModel.dart';

class ServiceProviderClosedBookings extends StatefulWidget {
  const ServiceProviderClosedBookings({Key? key}) : super(key: key);

  @override
  _ServiceProviderClosedBookingsState createState() =>
      _ServiceProviderClosedBookingsState();
}

class _ServiceProviderClosedBookingsState
    extends State<ServiceProviderClosedBookings> {
  List<ClosedBookingsDP> _closedBookings = [
    ClosedBookingsDP(
        bookingID: "CRB200915101",
        time: "15 Feb 2022",
        listItems: [
          ListItems(
              type: ["Laundry", "Dry-Cleaning"],
              date: "01 Aug",
              time: "09:00AM - 11:00AM"),
        ]),
    ClosedBookingsDP(
        bookingID: "CRB200915101",
        time: "15 Feb 2022",
        listItems: [
          ListItems(
              type: ["Laundry", "Dry-Cleaning"],
              date: "01 Aug",
              time: "09:00AM - 11:00AM"),
        ]),
    ClosedBookingsDP(
        bookingID: "CRB200915101",
        time: "15 Feb 2022",
        listItems: [
          ListItems(
              type: ["Laundry", "Dry-Cleaning"],
              date: "01 Aug",
              time: "09:00AM - 11:00AM"),
        ]),
    ClosedBookingsDP(
        bookingID: "CRB200915101",
        time: "15 Feb 2022",
        listItems: [
          ListItems(
              type: ["Shoe & Leather Care"],
              date: "01 Aug",
              time: "09:00AM - 11:00AM"),
        ])
  ];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(top: 20, bottom: 30),
        child: ListView.separated(
            separatorBuilder: ((context, index) {
              return SizedBox(
                height: 15,
              );
            }),
            shrinkWrap: true,
            itemCount: _closedBookings.length,
            itemBuilder: (context, index) {
              return CustomDeliveryPartnerClosedBookings(
                  bookingID: _closedBookings[index].bookingID,
                  time: _closedBookings[index].time,
                  listItems: _closedBookings[index].listItems);
            }));
  }
}
