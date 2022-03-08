import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/CustomDeliveryPartnerClosedBookings.dart';
import 'package:flutter_test_app/modals/closedBookingsDeliverPartnerModel.dart';

class deliveryPartnerClosedBookings extends StatefulWidget {
  const deliveryPartnerClosedBookings({Key? key}) : super(key: key);

  @override
  _deliveryPartnerClosedBookingsState createState() =>
      _deliveryPartnerClosedBookingsState();
}

class _deliveryPartnerClosedBookingsState
    extends State<deliveryPartnerClosedBookings> {
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
        ]),
    ClosedBookingsDP(
        bookingID: "CRB200915101",
        time: "15 Feb 2022",
        listItems: [
          ListItems(
              type: ["Shoe & Leather Care"],
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
        ]),
    ClosedBookingsDP(
        bookingID: "CRB200915101",
        time: "15 Feb 2022",
        listItems: [
          ListItems(
              type: ["Shoe & Leather Care"],
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
        child: ListView.separated(
            padding: EdgeInsets.only(top: 20, bottom: 30),
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
