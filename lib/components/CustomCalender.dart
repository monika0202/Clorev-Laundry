import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/customtimebutton.dart';
import 'package:flutter_test_app/screens/DeliveryPage.dart';
import 'package:flutter_test_app/screens/pickupPage.dart';

DateTime pickUpDate = DateTime.now();
DateTime DeliveryDate = pickUpDate;
String weekendPickup = "";
String weekendDelivery = "";

class CustomCalender extends StatefulWidget {
  final DateTime Date;
  final ispickuppage;
  const CustomCalender(
      {Key? key, required this.Date, required this.ispickuppage})
      : super(key: key);

  @override
  _CustomCalenderState createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  late DateTime selectedDate;
  DateTime todaydate = DateTime.now();

  @override
  void initState() {
    selectedDate = widget.Date;
  }
  // TO tracking date

  int currentDateSelectedIndex = -1; //For Horizontal Date
  ScrollController scrollController =
      ScrollController(); //To Track Scroll of ListView

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

  bool tomorrow = true;
  bool today = true;
  List<String> listOfDays = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          // padding: EdgeInsets.only(left: 15),
          height: 110,
          child: Row(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 10);
                  },
                  itemCount: 5,
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    // if (selectedDate.add(Duration(days: index)).day ==
                    //         DateTime.now().day &&
                    //     selectedDate.add(Duration(days: index)).weekday ==
                    //         DateTime.now().weekday) {
                    //   setState(() {
                    //     today = true;

                    //   });
                    // }
                    return Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: DateTimeButton(
                        isSubtitled: true,
                        subtitle: selectedDate.add(Duration(days: index)).day ==
                                    DateTime.now().day &&
                                selectedDate
                                        .add(Duration(days: index))
                                        .weekday ==
                                    DateTime.now().weekday
                            ? "Today"
                            : selectedDate.add(Duration(days: index)).day ==
                                        DateTime.now()
                                            .add(Duration(days: 1))
                                            .day &&
                                    selectedDate
                                            .add(Duration(days: index))
                                            .weekday ==
                                        DateTime.now()
                                            .add(Duration(days: 1))
                                            .weekday
                                ? "Tomorrow"
                                : listOfDays[selectedDate
                                            .add(Duration(days: index))
                                            .weekday -
                                        1]
                                    .toString(),
                        onPress: () {
                          setState(() {
                            print(selectedDate
                                .add(Duration(days: index + 1))
                                .day);
                            print(selectedDate
                                .add(Duration(days: index + 1))
                                .weekday);
                            print(DateTime.now().add(Duration(days: 1)).day);
                            print(
                                DateTime.now().add(Duration(days: 1)).weekday);

                            if (widget.ispickuppage) {
                              weekendPickup = selectedDate
                                              .add(Duration(days: index))
                                              .day ==
                                          DateTime.now().day &&
                                      selectedDate
                                              .add(Duration(days: index))
                                              .weekday ==
                                          DateTime.now().weekday
                                  ? "Today"
                                  : selectedDate
                                                  .add(Duration(days: index))
                                                  .day ==
                                              DateTime.now()
                                                  .add(Duration(days: 1))
                                                  .day &&
                                          selectedDate
                                                  .add(Duration(days: index))
                                                  .weekday ==
                                              DateTime.now()
                                                  .add(Duration(days: 1))
                                                  .weekday
                                      ? "Tomorrow"
                                      : listOfDays[selectedDate
                                                  .add(Duration(days: index))
                                                  .weekday -
                                              1]
                                          .toString();
                              print(weekendPickup);
                              isSelectedPickUpDate = true;
                            } else {
                              weekendDelivery = selectedDate
                                              .add(Duration(days: index))
                                              .day ==
                                          DateTime.now().day &&
                                      selectedDate
                                              .add(Duration(days: index))
                                              .weekday ==
                                          DateTime.now().weekday
                                  ? "Today"
                                  : selectedDate
                                                  .add(Duration(days: index))
                                                  .day ==
                                              DateTime.now()
                                                  .add(Duration(days: 1))
                                                  .day &&
                                          selectedDate
                                                  .add(Duration(days: index))
                                                  .weekday ==
                                              DateTime.now()
                                                  .add(Duration(days: 1))
                                                  .weekday
                                      ? "Tomorrow"
                                      : listOfDays[selectedDate
                                                  .add(Duration(days: index))
                                                  .weekday -
                                              1]
                                          .toString();

                              isSelectedDeliveryDate = true;
                            }

                            currentDateSelectedIndex = index;
                            // selectedDate = selectedDate.add(Duration(days: index));
                            widget.ispickuppage
                                ? pickUpDate =
                                    selectedDate.add(Duration(days: index))
                                : DeliveryDate =
                                    selectedDate.add(Duration(days: index));
                          });
                        },
                        isBorderCircular: false,
                        title: selectedDate
                            .add(Duration(days: index))
                            .day
                            .toString(),
                        textsize: 25,
                        isSelected: currentDateSelectedIndex == index,
                        width: 80,
                        isShadow: true,
                        height: 80,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
