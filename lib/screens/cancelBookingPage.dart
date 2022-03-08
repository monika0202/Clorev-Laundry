import 'package:flutter/material.dart';
import 'package:flutter_test_app/colorconst.dart';
import 'package:flutter_test_app/components/CustomBottomBarButton.dart';
import 'package:flutter_test_app/components/GradientText.dart';

class CancelBooking extends StatefulWidget {
  const CancelBooking({Key? key}) : super(key: key);

  @override
  _CancelBookingState createState() => _CancelBookingState();
}

class _CancelBookingState extends State<CancelBooking> {
  int? val = -1;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Cancel Booking",
            style:
                TextStyle(fontFamily: 'helvetica', fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.centerLeft,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 40,
                color: Colors.white,
              )),
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
            child: Stack(
              children: [
                Column(children: [
                  Container(
                      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          Container(
                            width: screenSize.width,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  bluegradientstartColor,
                                  bluegradientendColor
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                    text: TextSpan(
                                        text: "Booking ID : ",
                                        style: TextStyle(
                                          color: darkGreyColor,
                                          fontFamily: 'helvetica',
                                        ),
                                        children: [
                                      TextSpan(
                                          text: "CRB",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: darkGreyColor,
                                              fontFamily: 'helvetica')),
                                    ])),
                                RichText(
                                    text: TextSpan(
                                        text: "dtd ",
                                        style: TextStyle(
                                          color: darkGreyColor,
                                          fontFamily: 'helvetica',
                                        ),
                                        children: [
                                      TextSpan(
                                          text: "fjgkg",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: darkGreyColor,
                                              fontFamily: 'helvetica')),
                                    ]))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Laundry-5 items",
                                        style:
                                            TextStyle(fontFamily: 'helvetica')),
                                    Text("CRL-017 (DEL)")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Dry-Cleaning-2 items",
                                        style:
                                            TextStyle(fontFamily: 'helvetica')),
                                    Text("\₹0000")
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
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
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) => LinearGradient(
                                  colors: [
                                    bluegradientstartColor,
                                    bluegradientendColor
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                ).createShader(bounds),
                            child: Text(
                                "Please take a moment and tell us why are you cancelling this booking? It will help us to serve you in a much better way.",
                                maxLines: 4,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'helvetica',
                                ))),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1,
                          width: screenSize.width,
                          color: bluegradientstartColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Transform.translate(
                          offset: Offset(-10, 0),
                          child: RadioListTile<int>(
                              contentPadding: EdgeInsets.all(0),
                              dense: true,
                              title: Transform.translate(
                                offset: Offset(-10, 0),
                                child: Text(
                                    "Want to change address for the pick- up. ",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: 'helvetica')),
                              ),
                              value: 1,
                              groupValue: val,
                              onChanged: (value) {
                                setState(() {
                                  val = value;
                                });
                              }),
                        ),
                        Container(
                          height: 1,
                          width: screenSize.width,
                          color: bluegradientstartColor,
                        ),
                        Transform.translate(
                          offset: Offset(-10, 0),
                          child: RadioListTile<int>(
                              contentPadding: EdgeInsets.all(0),
                              dense: true,
                              title: Transform.translate(
                                offset: Offset(-10, 0),
                                child: Text("Need to reschedule the pick-up.",
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: 'helvetica')),
                              ),
                              value: 2,
                              groupValue: val,
                              onChanged: (value) {
                                setState(() {
                                  val = value;
                                });
                              }),
                        ),
                        Container(
                          height: 1,
                          width: screenSize.width,
                          color: bluegradientstartColor,
                        ),
                        Transform.translate(
                          offset: Offset(-10, 0),
                          child: RadioListTile<int>(
                              contentPadding: EdgeInsets.all(0),
                              dense: true,
                              title: Transform.translate(
                                offset: Offset(-10, 0),
                                child: Text("Wanna add few more items to it.",
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: 'helvetica')),
                              ),
                              value: 3,
                              groupValue: val,
                              onChanged: (value) {
                                setState(() {
                                  val = value;
                                });
                              }),
                        ),
                        Container(
                          height: 1,
                          width: screenSize.width,
                          color: bluegradientstartColor,
                        ),
                        Transform.translate(
                          offset: Offset(-10, 0),
                          child: RadioListTile<int>(
                              contentPadding: EdgeInsets.all(0),
                              dense: true,
                              title: Transform.translate(
                                offset: Offset(-10, 0),
                                child: Text("Got better deal elsewhere.",
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: 'helvetica')),
                              ),
                              value: 4,
                              groupValue: val,
                              onChanged: (value) {
                                setState(() {
                                  val = value;
                                });
                              }),
                        ),
                        Container(
                          height: 1,
                          width: screenSize.width,
                          color: bluegradientstartColor,
                        ),
                        Transform.translate(
                          offset: Offset(-10, 0),
                          child: RadioListTile<int>(
                              contentPadding: EdgeInsets.all(0),
                              dense: true,
                              title: Transform.translate(
                                offset: Offset(-10, 0),
                                child: Text("Some Personal reason.",
                                    style: TextStyle(
                                        fontSize: 14, fontFamily: 'helvetica')),
                              ),
                              value: 5,
                              groupValue: val,
                              onChanged: (value) {
                                setState(() {
                                  val = value;
                                });
                              }),
                        ),
                        Container(
                          height: 1,
                          width: screenSize.width,
                          color: bluegradientstartColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text.rich(
                          TextSpan(
                              text: "Note : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'helvetica'),
                              children: [
                                TextSpan(
                                    text:
                                        "Our pick-up guy will come to you adter a call-confirmation only, till then you may cancel free of cost. Once the delivery guy leaves for the pick-up, a mere cancelaation charge of \₹50 will be levied on it.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.italic,
                                        fontFamily: 'helvetica')),
                              ]),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Refund for the balance amount will be credited immediately to your wallet",
                          style: TextStyle(
                            fontFamily: 'helvetica',
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.justify,
                        )
                      ],
                    ),
                  )
                ]),
                Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: CustomBottomBarButton(
                      isDisable: false,
                      onpress: () {},
                      title: "REQUEST CANCELLATION",
                      width: screenSize.width,
                      height: 50,
                    )),
              ],
            )));
  }
}
