import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/gradientIcon.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 130,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [bluegradientstartColor, bluegradientendColor],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft),
            ),
          ),
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 100,
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.call,
                            color: whiteColor,
                            size: 45,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: whiteColor, width: 3),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Call Us",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'helvetica',
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    var url = 'tel:+9197599 99055';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                InkWell(
                  child: Container(
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.email,
                            color: whiteColor,
                            size: 45,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: whiteColor, width: 3),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Email Us",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'helvetica',
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    var url = 'mailto:support@clorev.com';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                InkWell(
                  child: Container(
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/whatsup.png"),
                          size: 70,
                          color: whiteColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "WhatsApp",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'helvetica',
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    var url = 'https://wa.me/919759999055';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                )
              ],
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
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                    //height: screenSize.height / 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    //padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: Column(children: [
                      ListTile(
                          dense: true,
                          leading: Container(
                            height: 30,
                            width: 30,
                            child: GradientIcon(
                              child: Icon(
                                Icons.message_rounded,
                                color: bluegradientstartColor,
                                size: 30,
                              ),
                            ),
                          ),
                          subtitle: Text("Average Response time 10 - 15 min"),
                          title: Text(
                            "Chat with Us",
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
                          // Navigator.push(
                          //   context,
                          //   PageTransition(
                          //       type: PageTransitionType.rightToLeft,
                          //       child: MyAddressPage()),
                          // );
                        },
                        child: ListTile(
                          dense: true,
                          leading: Container(
                            height: 30,
                            width: 30,
                            child: GradientIcon(
                              child: Icon(
                                Icons.phone_callback_rounded,
                                color: bluegradientstartColor,
                                size: 30,
                              ),
                            ),
                          ),
                          subtitle: Text("Available b/w 09:00AM -09:00PM"),
                          title: Text(
                            "Request Call-back",
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
                              )),
                        ),
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
                          //       child: RatingAndReviewPage()),
                          // );
                        },
                        child: ListTile(
                            dense: true,
                            leading: Container(
                              height: 30,
                              width: 30,
                              child: GradientIcon(
                                child: Icon(
                                  Icons.question_answer,
                                  color: bluegradientstartColor,
                                  size: 30,
                                ),
                              ),
                            ),
                            subtitle:
                                Text("Get your Frequent query resolved here"),
                            title: Text(
                              "FAQs",
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
                          //contentPadding: EdgeInsets.all(0),
                          dense: true,
                          leading: Container(
                            height: 30,
                            width: 30,
                            child: GradientIcon(
                              child: Icon(
                                Icons.comment,
                                color: bluegradientstartColor,
                                size: 30,
                              ),
                            ),
                          ),
                          subtitle:
                              Text("Intersting Facts & Washing Instructiions"),
                          title: Text(
                            "Blogs",
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
                      ListTile(
                          dense: true,
                          leading: Container(
                            height: 30,
                            width: 30,
                          ),
                          title: Text(
                            "About us",
                            style: TextStyle(
                                color: darkGreyColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
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
                      ListTile(
                          dense: true,
                          leading: Container(
                            height: 30,
                            width: 30,
                            child: GradientIcon(
                              child: Icon(
                                Icons.document_scanner_rounded,
                                color: bluegradientstartColor,
                                size: 30,
                              ),
                            ),
                          ),
                          title: Text(
                            "Terms of service",
                            style: TextStyle(
                                color: darkGreyColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
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
                          // Navigator.push(
                          //   context,
                          //   PageTransition(
                          //       type: PageTransitionType.rightToLeft,
                          //       child: SettingPage()),
                          // );
                        },
                        child: ListTile(
                            dense: true,
                            leading: Container(
                              height: 30,
                              width: 30,
                              child: GradientIcon(
                                child: Icon(
                                  Icons.privacy_tip_rounded,
                                  color: bluegradientstartColor,
                                  size: 30,
                                ),
                              ),
                            ),
                            title: Text(
                              "Privacy Policy",
                              style: TextStyle(
                                  color: darkGreyColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
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
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Application Version v1.0.5",
                              style: TextStyle(fontFamily: 'helvetica'),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ]))
              ]),
            )));
  }
}
