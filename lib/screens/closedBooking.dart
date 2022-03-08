import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/CustomClosedBookingList.dart';
import 'package:flutter_test_app/components/CustomRatingBottomSheet.dart';
import 'package:flutter_test_app/modals/BookingComplete.dart';
import 'package:flutter_test_app/screens/showBookingDetail.dart';
import 'package:google_maps_webservice/timezone.dart';
import 'package:page_transition/page_transition.dart';

List<BookingComplete> completeBookedList = [
  BookingComplete(
      bookingID: "CRB200925051",
      Date: "25 Sep 2022",
      Item: "Laundary -2 items",
      deliveredDate: "30 Sep 2020",
      serviceProviderId: "CRL-017 (DEL)",
      rating: 4,
      status: "has laundered your items"),
  BookingComplete(
      bookingID: "CRB200925051",
      Date: "25 Sep 2022",
      Item: "Laundary -2 items",
      deliveredDate: "30 Sep 2022",
      serviceProviderId: "CRL-017 (DEL)",
      rating: 0,
      status: "has laundered your items"),
  BookingComplete(
      bookingID: "CRB200925051",
      Date: "25 Sep 2022",
      Item: "Laundary -2 items",
      deliveredDate: "30 Sep 2022",
      serviceProviderId: "CRL-017 (DEL)",
      rating: 4,
      status: "has laundered your items"),
  BookingComplete(
      bookingID: "CRB200925051",
      Date: "25 Sep 2022",
      Item: "Laundary -2 items",
      deliveredDate: "30 Sep",
      serviceProviderId: "CRL-017 (DEL)",
      rating: 0,
      status: "has laundered your items"),
  BookingComplete(
      bookingID: "CRB200925051",
      Date: "25 Sep 2022",
      Item: "Laundary -2 items",
      deliveredDate: "30 Sep 2022",
      serviceProviderId: "CRL-017 (DEL)",
      rating: 4,
      status: "has laundered your items"),
];

class CloasedBooking extends StatefulWidget {
  const CloasedBooking({Key? key}) : super(key: key);

  @override
  _CloasedBookingState createState() => _CloasedBookingState();
}

class _CloasedBookingState extends State<CloasedBooking> {
  double newRating = 0;
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
            itemCount: completeBookedList.length,
            itemBuilder: (context, index) {
              return CustomClosedBookingList(
                bookingID: completeBookedList[index].bookingID,
                date: completeBookedList[index].Date,
                status: completeBookedList[index].status,
                deliveredDate: completeBookedList[index].deliveredDate,
                items: completeBookedList[index].Item,
                rate: completeBookedList[index].rating!,
                isRate: completeBookedList[index].rating == 0,
                serviceProviderID: completeBookedList[index].serviceProviderId,
                onpressRateService: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                            builder: (BuildContext context, setState) {
                          return Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: CustomRatingBottomSheet(
                                onPressSubmit: () {
                                  setState(() {
                                    completeBookedList[index].rating =
                                        newRating;
                                    print(completeBookedList[index].rating);
                                  });

                                  Navigator.of(context).pop();
                                  this.setState(() {});
                                },
                                onRatingUpdate: (rating) {
                                  setState(() {
                                    newRating = rating;

                                    print(rating);
                                  });
                                  this.setState(() {});
                                },
                                CRLNo: "CRL-017 (DEL)"),
                          );
                        });
                      });
                },
                onpressShowDetails: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: ShowBookingDetails(
                          bookingID: completeBookedList[index].bookingID,
                        )),
                  );
                },
              );
            }));
  }
}
