import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomNotification.dart';
import 'package:flutter_test_app/components/GradientText.dart';
import 'package:flutter_test_app/modals/Notifications.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool allnotifiaction = true;

  var currDt = DateTime.now();
  ScrollController scrollController = ScrollController();

  List<NotificationModel> _bookmarked = [];
  List<NotificationModel> oneWeek = [];
  List<NotificationModel> twoweek = [];
  List<NotificationModel> threeweek = [];

  List<NotificationModel> _notification = [
    NotificationModel(
        content:
            "Enjoy a 10% discount on this weekend. Offer valid till Sunday 08:00 PM",
        date: "18 Jan",
        time: "10:30 PM",
        title: "Last minute deals",
        isbookmarked: false),
    NotificationModel(
        content:
            "Enjoy a 10% discount on this weekend. Offer valid till Sunday 08:00 PM",
        date: "18 Jan",
        time: "10:30 PM",
        title: "Last minute deals",
        isbookmarked: false),
    NotificationModel(
        content:
            "Enjoy a 10% discount on this weekend. Offer valid till Sunday 08:00 PM",
        date: "18 Jan",
        time: "10:30 PM",
        title: "Last minute deals",
        isbookmarked: false),
    NotificationModel(
        content:
            "Enjoy a 10% discount on this weekend. Offer valid till Sunday 08:00 PM",
        date: "26 Jan",
        time: "10:30 PM",
        title: "Last minute deals",
        isbookmarked: false),
    NotificationModel(
        content:
            "Enjoy a 10% discount on this weekend. Offer valid till Sunday 08:00 PM",
        date: "26 Jan",
        time: "10:30 PM",
        title: "Last minute deals",
        isbookmarked: false),
    NotificationModel(
        content:
            "Enjoy a 10% discount on this weekend. Offer valid till Sunday 08:00 PM",
        date: "26 Jan",
        time: "10:30 PM",
        title: "Last minute deals",
        isbookmarked: false),
    NotificationModel(
        content:
            "Enjoy a 10% discount on this weekend. Offer valid till Sunday 08:00 PM",
        date: "26 Jan",
        time: "10:30 PM",
        title: "Last minute deals",
        isbookmarked: false),
    NotificationModel(
        content:
            "Enjoy a 10% discount on this weekend. Offer valid till Sunday 08:00 PM",
        date: "26 Jan",
        time: "10:30 PM",
        title: "Last minute deals",
        isbookmarked: false),
    NotificationModel(
        content:
            "Enjoy a 10% discount on this weekend. Offer valid till Sunday 08:00 PM",
        date: "26 Jan",
        time: "10:30 PM",
        title: "Last minute deals",
        isbookmarked: false),
    NotificationModel(
        content:
            "Enjoy a 10% discount on this weekend. Offer valid till Sunday 08:00 PM",
        date: "26 Jan",
        time: "10:30 PM",
        title: "Last minute deals",
        isbookmarked: false),
    NotificationModel(
        content:
            "Enjoy a 10% discount on this weekend. Offer valid till Sunday 08:00 PM",
        date: "26 Jan",
        time: "10:30 PM",
        title: "Last minute deals",
        isbookmarked: false),
  ];

  // @override
  // void initState() {
  //   for (var i = 0; i < _notification.length; i++) {
  //     DateTime dateTime = DateFormat("DD-MM").parse("2019-07-19 8:40:23");
  //     if(dateTime  )
  //   }
  // }

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
                    Text("All",
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'helvetica')),
                    Text("Bookmarked",
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
              children: [
                Container(
                    child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(children: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 15, right: 15, top: 15),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Text(
                              "Notifications older than 30 days will automatically be deleted. Bookmark the notification, if you wish to keep it specifically for future reference.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontFamily: 'helvetica',
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: ListView.separated(
                                controller: scrollController,
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, bottom: 15),
                                shrinkWrap: true,
                                itemCount: _notification.length,
                                separatorBuilder: (context, index) {
                                  return _notification[index].isbookmarked ==
                                          false
                                      ? SizedBox(
                                          height: 10,
                                        )
                                      : Container();
                                },
                                itemBuilder: (context, index) {
                                  return _notification[index].isbookmarked ==
                                          false
                                      ? CustomNotification(
                                          content: _notification[index].content,
                                          title: _notification[index].title,
                                          time: _notification[index].time,
                                          date: _notification[index].date,
                                          isbookmarked: false,
                                          onPressBookmark: () {
                                            setState(() {
                                              _notification[index]
                                                  .isbookmarked = true;
                                              _bookmarked.add(_notification
                                                  .elementAt(index));
                                            });
                                          },
                                          onPressDelete: () {
                                            setState(() {
                                              _notification.removeAt(index);
                                            });
                                          },
                                        )
                                      : Container();
                                }),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 15, right: 15),
                              width: screenSize.width,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "1 Week Older",
                                      style: TextStyle(
                                          color: darkGreyColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'helvetica'),
                                    ),
                                    GradientText(
                                        title: "Clear ALL", isUnderline: true)
                                  ])),
                          SizedBox(
                            height: 30,
                          ),
                        ]))),
                Container(
                  child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 15, bottom: 30),
                      shrinkWrap: true,
                      itemCount: _bookmarked.length,
                      itemBuilder: (context, index) {
                        print(_bookmarked[index].isbookmarked);
                        return CustomNotification(
                          content: _bookmarked[index].content,
                          title: _bookmarked[index].title,
                          time: _notification[index].time,
                          date: _bookmarked[index].date,
                          isbookmarked: true,
                          onPressBookmark: () {
                            setState(() {
                              _bookmarked[index].isbookmarked = true;
                            });
                          },
                          onPressDelete: () {
                            setState(() {
                              _bookmarked.removeAt(index);
                            });
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
